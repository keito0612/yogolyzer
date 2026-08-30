import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_view_model.freezed.dart';

/// オンボーディング画面の状態
@freezed
sealed class OnboardingState with _$OnboardingState {
  /// ページ表示中
  const factory OnboardingState.viewing({
    required int currentPage,
  }) = OnboardingStateViewing;

  /// オンボーディング完了
  const factory OnboardingState.completed() = OnboardingStateCompleted;
}

/// オンボーディング画面のViewModel
class OnboardingViewModel extends Notifier<OnboardingState> {
  static const int totalPages = 3;

  @override
  OnboardingState build() {
    return const OnboardingState.viewing(currentPage: 0);
  }

  /// ページ変更
  void onPageChanged(int page) {
    state = OnboardingState.viewing(currentPage: page);
  }

  /// 次のページへ
  void nextPage() {
    state.whenOrNull(
      viewing: (currentPage) {
        if (currentPage < totalPages - 1) {
          state = OnboardingState.viewing(currentPage: currentPage + 1);
        }
      },
    );
  }

  /// オンボーディングをスキップ
  Future<void> skip() async {
    await _completeOnboarding();
  }

  /// オンボーディングを完了
  Future<void> complete() async {
    await _completeOnboarding();
  }

  /// オンボーディング完了処理
  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedOnboarding', true);
    state = const OnboardingState.completed();
  }

  /// 現在のページインデックスを取得
  int get currentPage {
    return state.maybeWhen(
      viewing: (page) => page,
      orElse: () => 0,
    );
  }

  /// 最後のページかどうか
  bool get isLastPage {
    return state.maybeWhen(
      viewing: (page) => page == totalPages - 1,
      orElse: () => false,
    );
  }
}

/// OnboardingViewModelプロバイダー
final onboardingViewModelProvider =
    NotifierProvider.autoDispose<OnboardingViewModel, OnboardingState>(
  OnboardingViewModel.new,
);

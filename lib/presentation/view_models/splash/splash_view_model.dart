import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_view_model.freezed.dart';

/// スプラッシュ画面の状態
@freezed
sealed class SplashState with _$SplashState {
  /// 初期化中
  const factory SplashState.loading() = SplashStateLoading;

  /// オンボーディングへ遷移
  const factory SplashState.navigateToOnboarding() = SplashStateNavigateToOnboarding;

  /// ホームへ遷移
  const factory SplashState.navigateToHome() = SplashStateNavigateToHome;
}

/// スプラッシュ画面のViewModel
class SplashViewModel extends Notifier<SplashState> {
  @override
  SplashState build() {
    return const SplashState.loading();
  }

  /// 初期化処理
  Future<void> initialize() async {
    // 最低2秒は表示
    await Future.delayed(const Duration(seconds: 2));

    // 初回起動チェック
    final prefs = await SharedPreferences.getInstance();
    final hasCompletedOnboarding =
        prefs.getBool('hasCompletedOnboarding') ?? false;

    if (!ref.mounted) return;

    // 遷移先を決定
    if (hasCompletedOnboarding) {
      state = const SplashState.navigateToHome();
    } else {
      state = const SplashState.navigateToOnboarding();
    }
  }
}

/// SplashViewModelプロバイダー
final splashViewModelProvider =
    NotifierProvider.autoDispose<SplashViewModel, SplashState>(
  SplashViewModel.new,
);

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_view_model.freezed.dart';

/// ホーム画面の状態
@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    /// 本日の診断回数
    @Default(0) int todayDiagnosisCount,

    /// 1日の診断上限
    @Default(3) int dailyLimit,

    /// プレミアム会員かどうか
    @Default(false) bool isPremium,

    /// ローディング中かどうか
    @Default(true) bool isLoading,
  }) = _HomeState;
}

/// ホーム画面のViewModel
class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    // 初期化時にデータを読み込む
    _loadData();
    return const HomeState();
  }

  /// データを読み込む
  Future<void> _loadData() async {
    // TODO: ローカルDBから診断回数を取得
    // TODO: プレミアム状態を取得

    // 仮のデータ
    await Future.delayed(const Duration(milliseconds: 300));

    state = state.copyWith(
      todayDiagnosisCount: 1,
      isPremium: false,
      isLoading: false,
    );
  }

  /// 診断可能かどうか
  bool get canDiagnose {
    if (state.isPremium) return true;
    return state.todayDiagnosisCount < state.dailyLimit;
  }

  /// 残り診断回数のテキスト
  String get remainingCountText {
    if (state.isPremium) {
      return '無制限';
    }
    return '${state.todayDiagnosisCount}/${state.dailyLimit}回';
  }

  /// 診断を開始
  void startDiagnosis() {
    // ナビゲーションは View で行う
    // ここでは状態変更のみ（必要に応じて）
  }

  /// データを再読み込み
  Future<void> refresh() async {
    state = state.copyWith(isLoading: true);
    await _loadData();
  }
}

/// HomeViewModelプロバイダー
final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(
  HomeViewModel.new,
);

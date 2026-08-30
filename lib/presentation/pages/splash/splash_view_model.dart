import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// スプラッシュ画面の状態
enum SplashState {
  /// 初期化中
  loading,

  /// オンボーディングへ遷移
  navigateToOnboarding,

  /// ホームへ遷移
  navigateToHome,
}

/// スプラッシュ画面のViewModel
class SplashViewModel extends Notifier<SplashState> {
  @override
  SplashState build() {
    return SplashState.loading;
  }

  /// 初期化処理
  Future<void> initialize() async {
    // 最低2秒は表示
    await Future.delayed(const Duration(seconds: 2));

    // 初回起動チェック
    final prefs = await SharedPreferences.getInstance();
    final hasCompletedOnboarding =
        prefs.getBool('hasCompletedOnboarding') ?? false;

    // 遷移先を決定
    if (hasCompletedOnboarding) {
      state = SplashState.navigateToHome;
    } else {
      state = SplashState.navigateToOnboarding;
    }
  }
}

/// SplashViewModelプロバイダー
final splashViewModelProvider =
    NotifierProvider.autoDispose<SplashViewModel, SplashState>(
  SplashViewModel.new,
);

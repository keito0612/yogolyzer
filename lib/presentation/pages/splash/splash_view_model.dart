import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// スプラッシュ画面の状態
sealed class SplashState {
  const SplashState();

  /// パターンマッチング用のwhenメソッド
  T when<T>({
    required T Function() loading,
    required T Function() navigateToOnboarding,
    required T Function() navigateToHome,
  }) {
    return switch (this) {
      SplashStateLoading() => loading(),
      SplashStateNavigateToOnboarding() => navigateToOnboarding(),
      SplashStateNavigateToHome() => navigateToHome(),
    };
  }

  /// パターンマッチング用のmaybeWhenメソッド
  T maybeWhen<T>({
    T Function()? loading,
    T Function()? navigateToOnboarding,
    T Function()? navigateToHome,
    required T Function() orElse,
  }) {
    return switch (this) {
      SplashStateLoading() => loading?.call() ?? orElse(),
      SplashStateNavigateToOnboarding() =>
        navigateToOnboarding?.call() ?? orElse(),
      SplashStateNavigateToHome() => navigateToHome?.call() ?? orElse(),
    };
  }
}

/// 初期化中
final class SplashStateLoading extends SplashState {
  const SplashStateLoading();
}

/// オンボーディングへ遷移
final class SplashStateNavigateToOnboarding extends SplashState {
  const SplashStateNavigateToOnboarding();
}

/// ホームへ遷移
final class SplashStateNavigateToHome extends SplashState {
  const SplashStateNavigateToHome();
}

/// スプラッシュ画面のViewModel
class SplashViewModel extends Notifier<SplashState> {
  @override
  SplashState build() {
    return const SplashStateLoading();
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
      state = const SplashStateNavigateToHome();
    } else {
      state = const SplashStateNavigateToOnboarding();
    }
  }
}

/// SplashViewModelプロバイダー
final splashViewModelProvider =
    NotifierProvider.autoDispose<SplashViewModel, SplashState>(
  SplashViewModel.new,
);

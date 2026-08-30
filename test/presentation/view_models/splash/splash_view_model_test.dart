import 'package:flutter_test/flutter_test.dart';
import 'package:yogolyzer/presentation/view_models/splash/splash_view_model.dart';

void main() {
  group('SplashState', () {
    test('loading状態が正しく作成されること', () {
      // Arrange & Act
      const state = SplashState.loading();

      // Assert
      state.when(
        loading: () {
          // 成功
        },
        navigateToOnboarding: () => fail('loadingであるべき'),
        navigateToHome: () => fail('loadingであるべき'),
      );
    });

    test('navigateToOnboarding状態が正しく作成されること', () {
      // Arrange & Act
      const state = SplashState.navigateToOnboarding();

      // Assert
      state.when(
        loading: () => fail('navigateToOnboardingであるべき'),
        navigateToOnboarding: () {
          // 成功
        },
        navigateToHome: () => fail('navigateToOnboardingであるべき'),
      );
    });

    test('navigateToHome状態が正しく作成されること', () {
      // Arrange & Act
      const state = SplashState.navigateToHome();

      // Assert
      state.when(
        loading: () => fail('navigateToHomeであるべき'),
        navigateToOnboarding: () => fail('navigateToHomeであるべき'),
        navigateToHome: () {
          // 成功
        },
      );
    });

    test('whenで全ての状態をハンドリングできること', () {
      // Arrange
      const loading = SplashState.loading();
      const onboarding = SplashState.navigateToOnboarding();
      const home = SplashState.navigateToHome();

      // Act & Assert
      expect(
        loading.when(
          loading: () => 'loading',
          navigateToOnboarding: () => 'onboarding',
          navigateToHome: () => 'home',
        ),
        equals('loading'),
      );

      expect(
        onboarding.when(
          loading: () => 'loading',
          navigateToOnboarding: () => 'onboarding',
          navigateToHome: () => 'home',
        ),
        equals('onboarding'),
      );

      expect(
        home.when(
          loading: () => 'loading',
          navigateToOnboarding: () => 'onboarding',
          navigateToHome: () => 'home',
        ),
        equals('home'),
      );
    });

    test('maybeWhenで特定の状態のみ処理できること', () {
      // Arrange
      const state = SplashState.navigateToHome();

      // Act
      final result = state.maybeWhen(
        navigateToHome: () => 'home',
        orElse: () => 'other',
      );

      // Assert
      expect(result, equals('home'));
    });

    test('maybeWhenで該当しない状態はorElseが呼ばれること', () {
      // Arrange
      const state = SplashState.loading();

      // Act
      final result = state.maybeWhen(
        navigateToHome: () => 'home',
        orElse: () => 'other',
      );

      // Assert
      expect(result, equals('other'));
    });
  });

  // 注意: SplashViewModelの非同期テストはProviderContainerのライフサイクルと
  // 非同期処理の競合が発生するため、integration_testで行うことを推奨します。
}

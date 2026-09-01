import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yogolyzer/presentation/view_models/login/login_view_model.dart';

void main() {
  group('AuthProvider', () {
    test('should have apple and google values', () {
      expect(AuthProvider.values.length, 2);
      expect(AuthProvider.apple, isNotNull);
      expect(AuthProvider.google, isNotNull);
    });
  });

  group('LoginState', () {
    test('idle state should be created correctly', () {
      // Arrange & Act
      const state = LoginState.idle();

      // Assert
      expect(state, isA<LoginStateIdle>());
    });

    test('loading state should contain provider', () {
      // Arrange & Act
      const state = LoginState.loading(provider: AuthProvider.apple);

      // Assert
      expect(state, isA<LoginStateLoading>());
      final loadingState = state as LoginStateLoading;
      expect(loadingState.provider, AuthProvider.apple);
    });

    test('success state should contain user info', () {
      // Arrange & Act
      const state = LoginState.success(
        userId: 'user-123',
        email: 'test@example.com',
        provider: AuthProvider.google,
      );

      // Assert
      expect(state, isA<LoginStateSuccess>());
      final successState = state as LoginStateSuccess;
      expect(successState.userId, 'user-123');
      expect(successState.email, 'test@example.com');
      expect(successState.provider, AuthProvider.google);
    });

    test('error state should contain message', () {
      // Arrange & Act
      const state = LoginState.error(message: 'ログインに失敗しました');

      // Assert
      expect(state, isA<LoginStateError>());
      final errorState = state as LoginStateError;
      expect(errorState.message, 'ログインに失敗しました');
    });

    test('when should pattern match correctly', () {
      // Arrange
      const state = LoginState.idle();

      // Act
      final result = state.when(
        idle: () => 'idle',
        loading: (p) => 'loading',
        success: (u, e, p) => 'success',
        error: (m) => 'error',
      );

      // Assert
      expect(result, 'idle');
    });

    test('when should pattern match loading state', () {
      // Arrange
      const state = LoginState.loading(provider: AuthProvider.apple);

      // Act
      final result = state.when(
        idle: () => 'idle',
        loading: (p) => 'loading-${p.name}',
        success: (u, e, p) => 'success',
        error: (m) => 'error',
      );

      // Assert
      expect(result, 'loading-apple');
    });

    test('whenOrNull should return null for non-matching state', () {
      // Arrange
      const state = LoginState.idle();

      // Act
      final result = state.whenOrNull(
        success: (u, e, p) => 'success',
      );

      // Assert
      expect(result, isNull);
    });
  });

  group('LoginViewModel', () {
    late ProviderContainer container;
    late LoginViewModel viewModel;

    setUp(() {
      container = ProviderContainer();
      viewModel = container.read(loginViewModelProvider.notifier);
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state should be idle', () {
      // Assert
      final state = container.read(loginViewModelProvider);
      expect(state, isA<LoginStateIdle>());
    });

    test('signInWithApple should transition to loading then success', () async {
      // Act
      final success = await viewModel.signInWithApple();

      // Assert
      expect(success, true);
      final state = container.read(loginViewModelProvider);
      expect(state, isA<LoginStateSuccess>());
      final successState = state as LoginStateSuccess;
      expect(successState.provider, AuthProvider.apple);
      expect(successState.email, contains('@'));
    });

    test('signInWithGoogle should transition to loading then success',
        () async {
      // Act
      final success = await viewModel.signInWithGoogle();

      // Assert
      expect(success, true);
      final state = container.read(loginViewModelProvider);
      expect(state, isA<LoginStateSuccess>());
      final successState = state as LoginStateSuccess;
      expect(successState.provider, AuthProvider.google);
      expect(successState.email, contains('@'));
    });

    test('resetError should reset error state to idle', () {
      // Arrange
      viewModel.state = const LoginState.error(message: 'テストエラー');

      // Act
      viewModel.resetError();

      // Assert
      final state = container.read(loginViewModelProvider);
      expect(state, isA<LoginStateIdle>());
    });

    test('resetError should not change non-error state', () {
      // Arrange - state is already idle
      final initialState = container.read(loginViewModelProvider);
      expect(initialState, isA<LoginStateIdle>());

      // Act
      viewModel.resetError();

      // Assert - still idle
      final state = container.read(loginViewModelProvider);
      expect(state, isA<LoginStateIdle>());
    });

    test('resetError should not change success state', () {
      // Arrange
      viewModel.state = const LoginState.success(
        userId: 'user-123',
        email: 'test@example.com',
        provider: AuthProvider.apple,
      );

      // Act
      viewModel.resetError();

      // Assert - still success
      final state = container.read(loginViewModelProvider);
      expect(state, isA<LoginStateSuccess>());
    });
  });
}

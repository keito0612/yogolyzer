import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yogolyzer/presentation/view_models/settings/settings_view_model.dart';

void main() {
  group('UserInfo', () {
    test('should create with all required fields', () {
      // Arrange & Act
      const userInfo = UserInfo(
        id: 'user-123',
        email: 'test@example.com',
        provider: 'apple',
      );

      // Assert
      expect(userInfo.id, 'user-123');
      expect(userInfo.email, 'test@example.com');
      expect(userInfo.provider, 'apple');
    });

    test('should support copyWith', () {
      // Arrange
      const userInfo = UserInfo(
        id: 'user-123',
        email: 'test@example.com',
        provider: 'apple',
      );

      // Act
      final updated = userInfo.copyWith(email: 'new@example.com');

      // Assert
      expect(updated.email, 'new@example.com');
      expect(updated.id, 'user-123'); // unchanged
      expect(updated.provider, 'apple'); // unchanged
    });
  });

  group('SettingsState', () {
    test('loading state should be created correctly', () {
      // Arrange & Act
      const state = SettingsState.loading();

      // Assert
      expect(state, isA<SettingsStateLoading>());
    });

    test('loaded state should contain default values', () {
      // Arrange & Act
      const state = SettingsState.loaded();

      // Assert
      expect(state, isA<SettingsStateLoaded>());
      final loadedState = state as SettingsStateLoaded;
      expect(loadedState.userInfo, isNull);
      expect(loadedState.isPremium, false);
      expect(loadedState.isSyncEnabled, false);
      expect(loadedState.appVersion, '');
    });

    test('loaded state should contain custom values', () {
      // Arrange
      const userInfo = UserInfo(
        id: 'user-123',
        email: 'test@example.com',
        provider: 'google',
      );

      // Act
      const state = SettingsState.loaded(
        userInfo: userInfo,
        isPremium: true,
        isSyncEnabled: true,
        appVersion: '1.0.0 (1)',
      );

      // Assert
      expect(state, isA<SettingsStateLoaded>());
      final loadedState = state as SettingsStateLoaded;
      expect(loadedState.userInfo, isNotNull);
      expect(loadedState.userInfo!.email, 'test@example.com');
      expect(loadedState.isPremium, true);
      expect(loadedState.isSyncEnabled, true);
      expect(loadedState.appVersion, '1.0.0 (1)');
    });

    test('error state should contain message', () {
      // Arrange & Act
      const state = SettingsState.error(message: 'エラーが発生しました');

      // Assert
      expect(state, isA<SettingsStateError>());
      final errorState = state as SettingsStateError;
      expect(errorState.message, 'エラーが発生しました');
    });

    test('when should pattern match correctly', () {
      // Arrange
      const state = SettingsState.loading();

      // Act
      final result = state.when(
        loading: () => 'loading',
        loaded: (u, p, s, v) => 'loaded',
        error: (m) => 'error',
      );

      // Assert
      expect(result, 'loading');
    });

    test('when should pattern match loaded state', () {
      // Arrange
      const state = SettingsState.loaded(
        isPremium: true,
        appVersion: '1.0.0',
      );

      // Act
      final result = state.when(
        loading: () => 'loading',
        loaded: (u, p, s, v) => 'loaded-$p-$v',
        error: (m) => 'error',
      );

      // Assert
      expect(result, 'loaded-true-1.0.0');
    });
  });

  group('SettingsViewModel', () {
    late ProviderContainer container;
    late SettingsViewModel viewModel;

    setUp(() {
      container = ProviderContainer();
      // プロバイダーをlistenしてautoDisposeを防ぐ
      container.listen(settingsViewModelProvider, (prev, next) {});
      viewModel = container.read(settingsViewModelProvider.notifier);
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state should be loading', () {
      // Assert
      final state = container.read(settingsViewModelProvider);
      expect(state, isA<SettingsStateLoading>());
    });

    test('logout should return false when not in loaded state', () async {
      // Don't call loadSettings - state is still loading

      // Act
      final success = await viewModel.logout();

      // Assert
      expect(success, false);
    });

    test('logout should return false when not logged in', () async {
      // Arrange - manually set loaded state without user
      viewModel.state = const SettingsState.loaded(
        userInfo: null,
        isPremium: false,
        isSyncEnabled: false,
        appVersion: '1.0.0',
      );

      // Act
      final success = await viewModel.logout();

      // Assert
      expect(success, false);
    });

    test('logout should return true when logged in', () async {
      // Arrange - manually set loaded state with user
      viewModel.state = const SettingsState.loaded(
        userInfo: UserInfo(
          id: 'user-123',
          email: 'test@example.com',
          provider: 'apple',
        ),
        isPremium: false,
        isSyncEnabled: true,
        appVersion: '1.0.0',
      );

      // Act
      final success = await viewModel.logout();

      // Assert
      expect(success, true);
      final state = container.read(settingsViewModelProvider);
      final loadedState = state as SettingsStateLoaded;
      expect(loadedState.userInfo, isNull);
      expect(loadedState.isSyncEnabled, false);
    });

    test('toggleSync should return false when not in loaded state', () async {
      // Don't call loadSettings - state is still loading

      // Act
      final success = await viewModel.toggleSync();

      // Assert
      expect(success, false);
    });

    test('toggleSync should return false when not logged in', () async {
      // Arrange - manually set loaded state without user
      viewModel.state = const SettingsState.loaded(
        userInfo: null,
        isPremium: false,
        isSyncEnabled: false,
        appVersion: '1.0.0',
      );

      // Act
      final success = await viewModel.toggleSync();

      // Assert
      expect(success, false);
    });

    test('toggleSync should toggle sync when logged in', () async {
      // Arrange - manually set loaded state with user
      viewModel.state = const SettingsState.loaded(
        userInfo: UserInfo(
          id: 'user-123',
          email: 'test@example.com',
          provider: 'apple',
        ),
        isPremium: false,
        isSyncEnabled: false,
        appVersion: '1.0.0',
      );

      // Act
      final success = await viewModel.toggleSync();

      // Assert
      expect(success, true);
      final state = container.read(settingsViewModelProvider);
      final loadedState = state as SettingsStateLoaded;
      expect(loadedState.isSyncEnabled, true);
    });

    test('deleteAccount should return false when not in loaded state',
        () async {
      // Don't call loadSettings - state is still loading

      // Act
      final success = await viewModel.deleteAccount();

      // Assert
      expect(success, false);
    });

    test('deleteAccount should return false when not logged in', () async {
      // Arrange - manually set loaded state without user
      viewModel.state = const SettingsState.loaded(
        userInfo: null,
        isPremium: false,
        isSyncEnabled: false,
        appVersion: '1.0.0',
      );

      // Act
      final success = await viewModel.deleteAccount();

      // Assert
      expect(success, false);
    });

    test('deleteAccount should delete account and reset state', () async {
      // Arrange - manually set loaded state with user
      viewModel.state = const SettingsState.loaded(
        userInfo: UserInfo(
          id: 'user-123',
          email: 'test@example.com',
          provider: 'apple',
        ),
        isPremium: true,
        isSyncEnabled: true,
        appVersion: '1.0.0',
      );

      // Act
      final success = await viewModel.deleteAccount();

      // Assert
      expect(success, true);
      final state = container.read(settingsViewModelProvider);
      final loadedState = state as SettingsStateLoaded;
      expect(loadedState.userInfo, isNull);
      expect(loadedState.isPremium, false);
      expect(loadedState.isSyncEnabled, false);
    });
  });
}

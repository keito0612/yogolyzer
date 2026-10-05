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

  group('BackupInfo', () {
    test('should create with all fields', () {
      // Arrange & Act
      final backupInfo = BackupInfo(
        hasBackup: true,
        lastBackupAt: DateTime(2024, 1, 1),
      );

      // Assert
      expect(backupInfo.hasBackup, true);
      expect(backupInfo.lastBackupAt, DateTime(2024, 1, 1));
    });

    test('should support null lastBackupAt', () {
      // Arrange & Act
      const backupInfo = BackupInfo(hasBackup: false);

      // Assert
      expect(backupInfo.hasBackup, false);
      expect(backupInfo.lastBackupAt, isNull);
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
      expect(loadedState.backupInfo, isNull);
      expect(loadedState.appVersion, '');
    });

    test('loaded state should contain custom values', () {
      // Arrange
      const userInfo = UserInfo(
        id: 'user-123',
        email: 'test@example.com',
        provider: 'google',
      );
      final backupInfo = BackupInfo(
        hasBackup: true,
        lastBackupAt: DateTime(2024, 1, 1),
      );

      // Act
      final state = SettingsState.loaded(
        userInfo: userInfo,
        isPremium: true,
        isSyncEnabled: true,
        backupInfo: backupInfo,
        appVersion: '1.0.0 (1)',
      );

      // Assert
      expect(state, isA<SettingsStateLoaded>());
      final loadedState = state as SettingsStateLoaded;
      expect(loadedState.userInfo, isNotNull);
      expect(loadedState.userInfo!.email, 'test@example.com');
      expect(loadedState.isPremium, true);
      expect(loadedState.isSyncEnabled, true);
      expect(loadedState.backupInfo, isNotNull);
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
        loaded: (u, p, s, b, v) => 'loaded',
        backingUp: (_) => 'backingUp',
        restoring: (_) => 'restoring',
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
        loaded: (u, p, s, b, v) => 'loaded-$p-$v',
        backingUp: (_) => 'backingUp',
        restoring: (_) => 'restoring',
        error: (m) => 'error',
      );

      // Assert
      expect(result, 'loaded-true-1.0.0');
    });

    test('backingUp state should contain previous state', () {
      // Arrange
      const previousState = SettingsState.loaded(appVersion: '1.0.0');

      // Act
      final state = SettingsState.backingUp(
        previousState: previousState as SettingsStateLoaded,
      );

      // Assert
      expect(state, isA<SettingsStateBackingUp>());
      final backingUpState = state as SettingsStateBackingUp;
      expect(backingUpState.previousState.appVersion, '1.0.0');
    });

    test('restoring state should contain previous state', () {
      // Arrange
      const previousState = SettingsState.loaded(appVersion: '1.0.0');

      // Act
      final state = SettingsState.restoring(
        previousState: previousState as SettingsStateLoaded,
      );

      // Assert
      expect(state, isA<SettingsStateRestoring>());
      final restoringState = state as SettingsStateRestoring;
      expect(restoringState.previousState.appVersion, '1.0.0');
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
  });
}

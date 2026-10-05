import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../application/services/auth_service.dart';
import '../../../application/services/backup_service.dart';
import '../../../application/services/subscription_service.dart';
import '../../../infrastructure/datasources/remote/api_exception.dart';
import '../../../infrastructure/providers/service_providers.dart';

part 'settings_view_model.freezed.dart';

/// ユーザー情報
@freezed
abstract class UserInfo with _$UserInfo {
  const factory UserInfo({
    required String id,
    required String email,
    required String provider,
  }) = _UserInfo;
}

/// バックアップ情報
@freezed
abstract class BackupInfo with _$BackupInfo {
  const factory BackupInfo({
    required bool hasBackup,
    DateTime? lastBackupAt,
  }) = _BackupInfo;
}

/// 設定画面の状態
@freezed
sealed class SettingsState with _$SettingsState {
  /// 読み込み中
  const factory SettingsState.loading() = SettingsStateLoading;

  /// 読み込み完了
  const factory SettingsState.loaded({
    /// ログイン中のユーザー情報（未ログインの場合null）
    UserInfo? userInfo,

    /// プレミアム会員かどうか
    @Default(false) bool isPremium,

    /// データ同期が有効かどうか
    @Default(false) bool isSyncEnabled,

    /// バックアップ情報
    BackupInfo? backupInfo,

    /// アプリバージョン
    @Default('') String appVersion,
  }) = SettingsStateLoaded;

  /// バックアップ処理中
  const factory SettingsState.backingUp({
    required SettingsStateLoaded previousState,
  }) = SettingsStateBackingUp;

  /// 復元処理中
  const factory SettingsState.restoring({
    required SettingsStateLoaded previousState,
  }) = SettingsStateRestoring;

  /// エラー
  const factory SettingsState.error({
    required String message,
  }) = SettingsStateError;
}

/// 設定画面のViewModel
class SettingsViewModel extends Notifier<SettingsState> {
  late final AuthService _authService;
  late final SubscriptionService _subscriptionService;
  late final BackupService _backupService;

  @override
  SettingsState build() {
    _authService = ref.watch(authServiceProvider);
    _subscriptionService = ref.watch(subscriptionServiceProvider);
    _backupService = ref.watch(backupServiceProvider);
    return const SettingsState.loading();
  }

  /// 設定を読み込む
  Future<void> loadSettings() async {
    state = const SettingsState.loading();

    try {
      // 並行して取得
      final results = await Future.wait([
        PackageInfo.fromPlatform(),
        _authService.getCurrentUser(),
        _subscriptionService.isPremium(),
        _getBackupInfo(),
      ]);

      final packageInfo = results[0] as PackageInfo;
      final user = results[1] as dynamic;
      final isPremium = results[2] as bool;
      final backupInfo = results[3] as BackupInfo?;

      final version = '${packageInfo.version} (${packageInfo.buildNumber})';

      if (!ref.mounted) return;

      UserInfo? userInfo;
      if (user != null) {
        userInfo = UserInfo(
          id: user.id,
          email: user.email,
          provider: user.provider.name,
        );
      }

      state = SettingsState.loaded(
        userInfo: userInfo,
        isPremium: isPremium,
        isSyncEnabled: userInfo != null && isPremium,
        backupInfo: backupInfo,
        appVersion: version,
      );
    } on ApiException catch (e) {
      if (!ref.mounted) return;
      state = SettingsState.error(message: e.message);
    } catch (e) {
      if (!ref.mounted) return;
      state = SettingsState.error(message: '設定の読み込みに失敗しました: $e');
    }
  }

  /// バックアップ情報を取得
  Future<BackupInfo?> _getBackupInfo() async {
    try {
      final status = await _backupService.getBackupStatus();
      return BackupInfo(
        hasBackup: status.hasBackup,
        lastBackupAt: status.lastBackupAt,
      );
    } catch (_) {
      return null;
    }
  }

  /// ログアウト
  Future<bool> logout() async {
    final currentState = state;
    if (currentState is! SettingsStateLoaded) return false;
    if (currentState.userInfo == null) return false;

    try {
      await _authService.signOut();

      if (!ref.mounted) return false;

      state = currentState.copyWith(
        userInfo: null,
        isSyncEnabled: false,
      );
      return true;
    } on ApiException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  /// バックアップを実行
  Future<bool> backup() async {
    final currentState = state;
    if (currentState is! SettingsStateLoaded) return false;
    if (currentState.userInfo == null) return false;
    if (!currentState.isPremium) return false;

    state = SettingsState.backingUp(previousState: currentState);

    try {
      final result = await _backupService.backup();

      if (!ref.mounted) return false;

      state = currentState.copyWith(
        backupInfo: BackupInfo(
          hasBackup: true,
          lastBackupAt: result.backedUpAt,
        ),
      );
      return true;
    } on ApiException catch (e) {
      if (!ref.mounted) return false;
      state = SettingsState.error(message: e.message);
      return false;
    } catch (e) {
      if (!ref.mounted) return false;
      state = SettingsState.error(message: 'バックアップに失敗しました: $e');
      return false;
    }
  }

  /// バックアップを復元
  Future<bool> restore() async {
    final currentState = state;
    if (currentState is! SettingsStateLoaded) return false;
    if (currentState.userInfo == null) return false;
    if (!currentState.isPremium) return false;
    if (currentState.backupInfo?.hasBackup != true) return false;

    state = SettingsState.restoring(previousState: currentState);

    try {
      await _backupService.restore();

      if (!ref.mounted) return false;

      // 復元後は設定を再読み込み
      await loadSettings();
      return true;
    } on ApiException catch (e) {
      if (!ref.mounted) return false;
      state = SettingsState.error(message: e.message);
      return false;
    } catch (e) {
      if (!ref.mounted) return false;
      state = SettingsState.error(message: '復元に失敗しました: $e');
      return false;
    }
  }

  /// アカウント削除
  Future<bool> deleteAccount() async {
    final currentState = state;
    if (currentState is! SettingsStateLoaded) return false;
    if (currentState.userInfo == null) return false;

    try {
      await _authService.deleteAccount();

      if (!ref.mounted) return false;

      state = currentState.copyWith(
        userInfo: null,
        isPremium: false,
        isSyncEnabled: false,
        backupInfo: null,
      );
      return true;
    } on ApiException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  /// エラーからリセット
  Future<void> resetFromError() async {
    if (state is SettingsStateError) {
      await loadSettings();
    }
  }
}

/// SettingsViewModelのプロバイダー
final settingsViewModelProvider =
    NotifierProvider.autoDispose<SettingsViewModel, SettingsState>(
  SettingsViewModel.new,
);

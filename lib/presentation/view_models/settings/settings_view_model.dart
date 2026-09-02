import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

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

    /// アプリバージョン
    @Default('') String appVersion,
  }) = SettingsStateLoaded;

  /// エラー
  const factory SettingsState.error({
    required String message,
  }) = SettingsStateError;
}

/// 設定画面のViewModel
class SettingsViewModel extends Notifier<SettingsState> {
  @override
  SettingsState build() {
    return const SettingsState.loading();
  }

  /// 設定を読み込む
  Future<void> loadSettings() async {
    state = const SettingsState.loading();

    try {
      // アプリバージョンを取得
      final packageInfo = await PackageInfo.fromPlatform();
      final version = '${packageInfo.version} (${packageInfo.buildNumber})';

      // TODO: 実際のログイン状態・プレミアム状態をリポジトリから取得
      await Future.delayed(const Duration(milliseconds: 200));

      if (!ref.mounted) return;

      state = SettingsState.loaded(
        userInfo: null, // 未ログイン状態
        isPremium: false,
        isSyncEnabled: false,
        appVersion: version,
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = SettingsState.error(message: '設定の読み込みに失敗しました: $e');
    }
  }

  /// ログアウト
  Future<bool> logout() async {
    final currentState = state;
    if (currentState is! SettingsStateLoaded) return false;
    if (currentState.userInfo == null) return false;

    try {
      // TODO: 実際のログアウト処理
      await Future.delayed(const Duration(milliseconds: 300));

      if (!ref.mounted) return false;

      state = currentState.copyWith(
        userInfo: null,
        isSyncEnabled: false,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  /// データ同期を切り替え
  Future<bool> toggleSync() async {
    final currentState = state;
    if (currentState is! SettingsStateLoaded) return false;
    if (currentState.userInfo == null) return false; // ログインしていないと同期できない

    try {
      // TODO: 実際の同期設定変更処理
      await Future.delayed(const Duration(milliseconds: 200));

      if (!ref.mounted) return false;

      state = currentState.copyWith(
        isSyncEnabled: !currentState.isSyncEnabled,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  /// アカウント削除
  Future<bool> deleteAccount() async {
    final currentState = state;
    if (currentState is! SettingsStateLoaded) return false;
    if (currentState.userInfo == null) return false;

    try {
      // TODO: 実際のアカウント削除処理
      await Future.delayed(const Duration(milliseconds: 500));

      if (!ref.mounted) return false;

      state = currentState.copyWith(
        userInfo: null,
        isPremium: false,
        isSyncEnabled: false,
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}

/// SettingsViewModelのプロバイダー
final settingsViewModelProvider =
    NotifierProvider.autoDispose<SettingsViewModel, SettingsState>(
  SettingsViewModel.new,
);

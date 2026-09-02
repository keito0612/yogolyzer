import '../entities/settings.dart';

/// 設定リポジトリのインターフェース
abstract interface class ISettingsRepository {
  /// 設定を取得
  Future<Settings> getSettings();

  /// 設定を保存
  Future<void> saveSettings(Settings settings);

  /// デバイスIDを取得
  Future<String> getDeviceId();

  /// ログイン状態を取得
  Future<bool> isLoggedIn();

  /// ログイン状態を設定
  Future<void> setLoggedIn(bool value, {String? userId});

  /// プレミアム会員かを取得
  Future<bool> isPremium();

  /// プレミアム状態を設定
  Future<void> setPremium(bool value);

  /// 今日の診断回数を取得
  Future<int> getDailyDiagnosisCount();

  /// 診断回数をインクリメント
  Future<void> incrementDiagnosisCount();

  /// 診断可能かチェック（回数制限）
  Future<bool> canDiagnose();
}

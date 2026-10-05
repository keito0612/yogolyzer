/// APIエンドポイント定義
class ApiEndpoints {
  ApiEndpoints._();

  /// ベースURL（環境変数で切り替え可能）
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://192.168.0.12:3000/api',
  );

  // === 認証 ===
  static const String authSignIn = '/auth/signin';
  static const String authSignOut = '/auth/signout';
  static const String authProfile = '/auth/profile';
  static const String authDeleteAccount = '/auth/account';

  // === 診断 ===
  static const String diagnosisAnalyze = '/diagnosis/analyze';

  // === サブスクリプション ===
  static const String subscriptionVerify = '/subscription/verify';
  static const String subscriptionStatus = '/subscription/status';

  // === バックアップ ===
  static const String backupUpload = '/backup/upload';
  static const String backupDownload = '/backup/download';
  static const String backupStatus = '/backup/status';
}

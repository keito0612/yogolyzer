import '../entities/user.dart';

/// ユーザーリポジトリのインターフェース
abstract interface class IUserRepository {
  /// 現在のユーザーを取得
  Future<User?> getCurrentUser();

  /// ユーザーを保存
  Future<void> saveUser(User user);

  /// ユーザーを削除
  Future<void> deleteUser();

  /// プレミアム状態を更新
  Future<void> updatePremiumStatus({
    required bool isPremium,
    DateTime? expiresAt,
  });

  /// ログイン状態を取得
  Future<bool> isLoggedIn();

  /// デバイスIDを取得
  Future<String> getDeviceId();
}

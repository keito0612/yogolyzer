import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// トークン保存のインターフェース
abstract interface class ITokenStorage {
  /// アクセストークンを取得
  Future<String?> getAccessToken();

  /// アクセストークンを保存
  Future<void> saveAccessToken(String token);

  /// リフレッシュトークンを取得
  Future<String?> getRefreshToken();

  /// リフレッシュトークンを保存
  Future<void> saveRefreshToken(String token);

  /// 全てのトークンをクリア
  Future<void> clearTokens();

  /// トークンが存在するか確認
  Future<bool> hasToken();
}

/// トークン保存の実装（flutter_secure_storage使用）
class TokenStorageImpl implements ITokenStorage {
  TokenStorageImpl([FlutterSecureStorage? storage])
      : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const _keyAccessToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';

  @override
  Future<String?> getAccessToken() async {
    return _storage.read(key: _keyAccessToken);
  }

  @override
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _keyAccessToken, value: token);
  }

  @override
  Future<String?> getRefreshToken() async {
    return _storage.read(key: _keyRefreshToken);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _keyRefreshToken, value: token);
  }

  @override
  Future<void> clearTokens() async {
    await _storage.delete(key: _keyAccessToken);
    await _storage.delete(key: _keyRefreshToken);
  }

  @override
  Future<bool> hasToken() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }
}

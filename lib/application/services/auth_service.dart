import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/i_settings_repository.dart';
import '../../infrastructure/datasources/remote/api_exception.dart';
import '../../infrastructure/datasources/remote/auth_remote_data_source.dart';
import '../../infrastructure/external/token_storage.dart';

/// 認証サービス
class AuthService {
  AuthService({
    required AuthRemoteDataSource authRemoteDataSource,
    required ISettingsRepository settingsRepository,
    required ITokenStorage tokenStorage,
    GoogleSignIn? googleSignIn,
  }) : _authRemoteDataSource = authRemoteDataSource,
       _settingsRepository = settingsRepository,
       _tokenStorage = tokenStorage,
       _googleSignIn = googleSignIn ?? GoogleSignIn(scopes: ['email']);

  final AuthRemoteDataSource _authRemoteDataSource;
  final ISettingsRepository _settingsRepository;
  final ITokenStorage _tokenStorage;
  final GoogleSignIn _googleSignIn;

  /// Apple Sign-inでログイン
  Future<User> signInWithApple() async {
    try {
      // Apple Sign-in SDKを呼び出し
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final idToken = credential.identityToken;
      if (idToken == null) {
        throw const ValidationException('Apple IDトークンを取得できませんでした');
      }

      // バックエンドAPIでトークン検証・ユーザー作成
      final authResponse = await _authRemoteDataSource.signIn(
        provider: 'apple',
        idToken: idToken,
      );

      // トークンを保存
      await _tokenStorage.saveAccessToken(authResponse.accessToken);

      // ローカル設定を更新
      await _settingsRepository.setLoggedIn(true, userId: authResponse.user.id);

      return authResponse.user;
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        throw const ValidationException('ログインがキャンセルされました');
      }
      throw ValidationException('Apple Sign-inエラー: ${e.message}');
    }
  }

  /// Google Sign-inでログイン
  Future<User> signInWithGoogle() async {
    try {
      // Google Sign-in SDKを呼び出し
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw const ValidationException('ログインがキャンセルされました');
      }

      final googleAuth = await googleUser.authentication;
      final idToken = googleAuth.idToken;
      if (idToken == null) {
        throw const ValidationException('Google IDトークンを取得できませんでした');
      }

      // バックエンドAPIでトークン検証・ユーザー作成
      final authResponse = await _authRemoteDataSource.signIn(
        provider: 'google',
        idToken: idToken,
      );

      // トークンを保存
      await _tokenStorage.saveAccessToken(authResponse.accessToken);

      // ローカル設定を更新
      await _settingsRepository.setLoggedIn(true, userId: authResponse.user.id);

      return authResponse.user;
    } on Exception catch (e) {
      throw ValidationException('Google Sign-inエラー: $e');
    }
  }

  /// サインアウト
  Future<void> signOut() async {
    try {
      // バックエンドに通知
      await _authRemoteDataSource.signOut();
    } catch (_) {
      // バックエンドへの通知が失敗してもローカルは処理する
    }

    // Googleからサインアウト
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.signOut();
    }

    // トークンをクリア
    await _tokenStorage.clearTokens();

    // ローカル設定を更新
    await _settingsRepository.setLoggedIn(false);
  }

  /// ログイン済みかどうか
  Future<bool> isLoggedIn() async {
    final hasToken = await _tokenStorage.hasToken();
    if (!hasToken) return false;

    final isLoggedIn = await _settingsRepository.isLoggedIn();
    return isLoggedIn;
  }

  /// 現在のユーザー情報を取得
  Future<User?> getCurrentUser() async {
    try {
      final isLoggedIn = await this.isLoggedIn();
      if (!isLoggedIn) return null;

      return await _authRemoteDataSource.getProfile();
    } on UnauthorizedException {
      // トークンが無効な場合はログアウト
      await signOut();
      return null;
    } catch (_) {
      return null;
    }
  }

  /// アカウント削除
  Future<void> deleteAccount() async {
    await _authRemoteDataSource.deleteAccount();

    // Googleからサインアウト
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.disconnect();
    }

    // トークンをクリア
    await _tokenStorage.clearTokens();

    // ローカル設定を更新
    await _settingsRepository.setLoggedIn(false);
  }

  /// Apple Sign-inが利用可能か（iOS 13+）
  Future<bool> isAppleSignInAvailable() async {
    if (!Platform.isIOS) return false;
    return await SignInWithApple.isAvailable();
  }
}

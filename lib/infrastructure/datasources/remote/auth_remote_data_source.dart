import 'package:dio/dio.dart';

import '../../../domain/entities/user.dart';
import 'api_endpoints.dart';
import 'api_exception.dart';

/// 認証レスポンス
class AuthResponse {
  AuthResponse({
    required this.user,
    required this.accessToken,
    this.refreshToken,
  });

  final User user;
  final String accessToken;
  final String? refreshToken;

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String?,
    );
  }
}

/// 認証API用リモートデータソース
class AuthRemoteDataSource {
  AuthRemoteDataSource(this._dio);

  final Dio _dio;

  /// ソーシャルサインイン（Apple/Google共通）
  Future<AuthResponse> signIn({
    required String provider,
    required String idToken,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.authSignIn,
        data: {
          'provider': provider,
          'idToken': idToken,
        },
      );

      if (response.data == null) {
        throw const UnknownApiException('レスポンスが空です');
      }

      return AuthResponse.fromJson(response.data!);
    } on DioException catch (e) {
      throw e.error as ApiException? ?? const UnknownApiException();
    }
  }

  /// サインアウト
  Future<void> signOut() async {
    try {
      await _dio.post<void>(ApiEndpoints.authSignOut);
    } on DioException catch (e) {
      throw e.error as ApiException? ?? const UnknownApiException();
    }
  }

  /// プロフィール取得
  Future<User> getProfile() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.authProfile,
      );

      if (response.data == null) {
        throw const UnknownApiException('レスポンスが空です');
      }

      return User.fromJson(response.data!);
    } on DioException catch (e) {
      throw e.error as ApiException? ?? const UnknownApiException();
    }
  }

  /// アカウント削除
  Future<void> deleteAccount() async {
    try {
      await _dio.delete<void>(ApiEndpoints.authDeleteAccount);
    } on DioException catch (e) {
      throw e.error as ApiException? ?? const UnknownApiException();
    }
  }
}

import 'package:dio/dio.dart';

import '../../../external/token_storage.dart';

/// 認証トークンを自動付与するインターセプター
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._tokenStorage);

  final ITokenStorage _tokenStorage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStorage.getAccessToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}

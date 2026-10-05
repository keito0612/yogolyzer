import 'package:dio/dio.dart';

import '../../external/token_storage.dart';
import 'api_endpoints.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';

/// APIクライアント（Dio）の設定と生成
class ApiClient {
  ApiClient._();

  /// Dioインスタンスを作成
  static Dio create(ITokenStorage tokenStorage) {
    print('🌐 [ApiClient] Creating Dio with baseUrl: ${ApiEndpoints.baseUrl}');

    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // デバッグ用ログインターセプター
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
        logPrint: (obj) => print('🌐 [Dio] $obj'),
      ),
    );

    // インターセプターを追加
    dio.interceptors.addAll([
      AuthInterceptor(tokenStorage),
      ErrorInterceptor(),
    ]);

    return dio;
  }
}

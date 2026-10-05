import 'dart:io';

import 'package:dio/dio.dart';

import '../api_exception.dart';

/// エラーレスポンスをApiExceptionに変換するインターセプター
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = _mapException(err);
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        error: exception,
        type: err.type,
        response: err.response,
      ),
    );
  }

  ApiException _mapException(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutException();

      case DioExceptionType.connectionError:
        return const NetworkException();

      case DioExceptionType.badResponse:
        return _mapStatusCode(err.response);

      case DioExceptionType.cancel:
        return const UnknownApiException('リクエストがキャンセルされました');

      case DioExceptionType.badCertificate:
        return const NetworkException('セキュリティ証明書エラー');

      case DioExceptionType.unknown:
        if (err.error is SocketException) {
          return const NetworkException();
        }
        return UnknownApiException(err.message);

      default:
        return UnknownApiException(err.message);
    }
  }

  ApiException _mapStatusCode(Response<dynamic>? response) {
    if (response == null) {
      return const UnknownApiException();
    }

    final statusCode = response.statusCode ?? 0;
    final data = response.data;
    final message = data is Map<String, dynamic> ? data['message'] as String? : null;

    switch (statusCode) {
      case 400:
        return ValidationException(message ?? 'リクエストが不正です');
      case 401:
        return UnauthorizedException(message);
      case 403:
        return const UnauthorizedException('アクセス権限がありません');
      case 404:
        return ServerException(statusCode, message ?? 'リソースが見つかりません');
      case 429:
        return RateLimitException(message);
      case 503:
        return ServiceUnavailableException(message);
      case >= 500:
        return ServerException(statusCode, message);
      default:
        return ServerException(statusCode, message);
    }
  }
}

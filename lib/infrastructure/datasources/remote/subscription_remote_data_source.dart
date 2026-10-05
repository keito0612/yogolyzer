import 'package:dio/dio.dart';

import 'api_endpoints.dart';
import 'api_exception.dart';

/// サブスクリプション状態
class SubscriptionStatus {
  SubscriptionStatus({
    required this.isPremium,
    this.expiresAt,
    this.productId,
  });

  final bool isPremium;
  final DateTime? expiresAt;
  final String? productId;

  factory SubscriptionStatus.fromJson(Map<String, dynamic> json) {
    return SubscriptionStatus(
      isPremium: json['is_premium'] as bool,
      expiresAt: json['expires_at'] != null
          ? DateTime.parse(json['expires_at'] as String)
          : null,
      productId: json['product_id'] as String?,
    );
  }
}

/// サブスクリプションAPI用リモートデータソース
class SubscriptionRemoteDataSource {
  SubscriptionRemoteDataSource(this._dio);

  final Dio _dio;

  /// レシート検証
  Future<SubscriptionStatus> verifyReceipt({
    required String receiptData,
    required String productId,
    required bool isSubscription,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.subscriptionVerify,
        data: {
          'receipt_data': receiptData,
          'product_id': productId,
          'is_subscription': isSubscription,
        },
      );

      if (response.data == null) {
        throw const UnknownApiException('レスポンスが空です');
      }

      return SubscriptionStatus.fromJson(response.data!);
    } on DioException catch (e) {
      throw e.error as ApiException? ?? const UnknownApiException();
    }
  }

  /// サブスクリプション状態を取得
  Future<SubscriptionStatus> getStatus() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.subscriptionStatus,
      );

      if (response.data == null) {
        throw const UnknownApiException('レスポンスが空です');
      }

      return SubscriptionStatus.fromJson(response.data!);
    } on DioException catch (e) {
      throw e.error as ApiException? ?? const UnknownApiException();
    }
  }
}

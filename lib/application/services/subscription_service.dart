import 'package:purchases_flutter/purchases_flutter.dart';

import '../../domain/repositories/i_settings_repository.dart';
import '../../infrastructure/datasources/remote/subscription_remote_data_source.dart';

/// サブスクリプションサービス
class SubscriptionService {
  SubscriptionService({
    required SubscriptionRemoteDataSource subscriptionRemoteDataSource,
    required ISettingsRepository settingsRepository,
  }) : _subscriptionRemoteDataSource = subscriptionRemoteDataSource,
       _settingsRepository = settingsRepository;

  final SubscriptionRemoteDataSource _subscriptionRemoteDataSource;
  final ISettingsRepository _settingsRepository;

  /// RevenueCat商品ID
  static const String _monthlyProductId = 'yogolyzer_premium_monthly';
  static const String _yearlyProductId = 'yogolyzer_premium_yearly';

  /// 購入処理
  Future<bool> purchase({required bool isYearly}) async {
    try {
      final productId = isYearly ? _yearlyProductId : _monthlyProductId;

      // RevenueCatのオファリングを取得
      final offerings = await Purchases.getOfferings();
      final offering = offerings.current;
      if (offering == null) {
        throw Exception('オファリングが見つかりません');
      }

      // パッケージを取得
      final package = isYearly ? offering.annual : offering.monthly;
      if (package == null) {
        throw Exception('パッケージが見つかりません');
      }

      // 購入実行
      final result = await Purchases.purchasePackage(package);

      // 購入成功時にバックエンドで検証
      await _verifyPurchase(
        receiptData: result.customerInfo.originalAppUserId,
        productId: productId,
        isSubscription: true,
      );

      // ローカル設定を更新
      await _settingsRepository.setPremium(true);

      return true;
    } catch (e) {
      // PurchasesErrorCode.purchaseCancelledByUser の場合はfalseを返す
      if (e is PurchasesErrorCode) {
        return false;
      }
      rethrow;
    }
  }

  /// 購入を復元
  Future<bool> restore() async {
    try {
      final customerInfo = await Purchases.restorePurchases();

      // アクティブなサブスクリプションがあるか確認
      final isActive = customerInfo.entitlements.active.isNotEmpty;

      if (isActive) {
        // バックエンドでも確認
        final status = await _subscriptionRemoteDataSource.getStatus();
        await _settingsRepository.setPremium(status.isPremium);
        return status.isPremium;
      }

      return false;
    } catch (_) {
      return false;
    }
  }

  /// プレミアム状態を確認
  Future<bool> isPremium() async {
    try {
      // まずローカルを確認
      final localPremium = await _settingsRepository.isPremium();
      if (!localPremium) return false;

      // RevenueCatで確認
      final customerInfo = await Purchases.getCustomerInfo();
      return customerInfo.entitlements.active.isNotEmpty;
    } catch (_) {
      return await _settingsRepository.isPremium();
    }
  }

  /// サブスクリプション状態を同期
  Future<void> syncSubscriptionStatus() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      final isActive = customerInfo.entitlements.active.isNotEmpty;
      await _settingsRepository.setPremium(isActive);
    } catch (_) {
      // エラー時は何もしない
    }
  }

  /// バックエンドでレシート検証
  Future<void> _verifyPurchase({
    required String receiptData,
    required String productId,
    required bool isSubscription,
  }) async {
    await _subscriptionRemoteDataSource.verifyReceipt(
      receiptData: receiptData,
      productId: productId,
      isSubscription: isSubscription,
    );
  }

  /// RevenueCatの初期化
  static Future<void> initialize(String apiKey) async {
    await Purchases.configure(PurchasesConfiguration(apiKey));
  }

  /// ユーザーIDを設定（ログイン時）
  static Future<void> setUserId(String userId) async {
    await Purchases.logIn(userId);
  }

  /// ユーザーIDをクリア（ログアウト時）
  static Future<void> clearUserId() async {
    await Purchases.logOut();
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../application/services/subscription_service.dart';
import '../../../infrastructure/datasources/remote/api_exception.dart';
import '../../../infrastructure/providers/service_providers.dart';

part 'premium_view_model.freezed.dart';

/// プレミアムプランの種類
enum PremiumPlan {
  monthly,
  yearly,
}

/// プレミアムプランの情報
@freezed
abstract class PlanInfo with _$PlanInfo {
  const factory PlanInfo({
    required PremiumPlan plan,
    required String name,
    required int price,
    required String period,
    String? savings,
  }) = _PlanInfo;
}

/// プレミアム画面の状態
@freezed
sealed class PremiumState with _$PremiumState {
  /// 読み込み中
  const factory PremiumState.loading() = PremiumStateLoading;

  /// 読み込み完了
  const factory PremiumState.loaded({
    /// 選択中のプラン
    required PremiumPlan selectedPlan,

    /// プラン情報一覧
    required List<PlanInfo> plans,

    /// 既にプレミアム会員かどうか
    @Default(false) bool isPremium,
  }) = PremiumStateLoaded;

  /// 購入処理中
  const factory PremiumState.purchasing({
    required PremiumPlan plan,
  }) = PremiumStatePurchasing;

  /// 購入成功
  const factory PremiumState.purchaseSuccess() = PremiumStatePurchaseSuccess;

  /// エラー
  const factory PremiumState.error({
    required String message,
  }) = PremiumStateError;
}

/// プレミアム画面のViewModel
class PremiumViewModel extends Notifier<PremiumState> {
  late final SubscriptionService _subscriptionService;

  /// プラン情報（固定）
  static const List<PlanInfo> _plans = [
    PlanInfo(
      plan: PremiumPlan.monthly,
      name: '月額プラン',
      price: 500,
      period: '月',
    ),
    PlanInfo(
      plan: PremiumPlan.yearly,
      name: '年額プラン',
      price: 4800,
      period: '年',
      savings: '2ヶ月分お得',
    ),
  ];

  @override
  PremiumState build() {
    _subscriptionService = ref.watch(subscriptionServiceProvider);
    return const PremiumState.loading();
  }

  /// プレミアム情報を読み込む
  Future<void> loadPremiumInfo() async {
    state = const PremiumState.loading();

    try {
      final isPremium = await _subscriptionService.isPremium();

      if (!ref.mounted) return;

      state = PremiumState.loaded(
        selectedPlan: PremiumPlan.monthly,
        plans: _plans,
        isPremium: isPremium,
      );
    } on ApiException catch (e) {
      if (!ref.mounted) return;
      state = PremiumState.error(message: e.message);
    } catch (e) {
      if (!ref.mounted) return;
      state = PremiumState.error(message: 'プレミアム情報の読み込みに失敗しました: $e');
    }
  }

  /// プランを選択
  void selectPlan(PremiumPlan plan) {
    final currentState = state;
    if (currentState is! PremiumStateLoaded) return;

    state = currentState.copyWith(selectedPlan: plan);
  }

  /// プレミアムを購入
  Future<bool> purchase() async {
    final currentState = state;
    if (currentState is! PremiumStateLoaded) return false;

    state = PremiumState.purchasing(plan: currentState.selectedPlan);

    try {
      final isYearly = currentState.selectedPlan == PremiumPlan.yearly;
      final success = await _subscriptionService.purchase(isYearly: isYearly);

      if (!ref.mounted) return false;

      if (success) {
        state = const PremiumState.purchaseSuccess();
        return true;
      } else {
        // ユーザーキャンセル
        state = PremiumState.loaded(
          selectedPlan: currentState.selectedPlan,
          plans: _plans,
          isPremium: false,
        );
        return false;
      }
    } on ApiException catch (e) {
      if (!ref.mounted) return false;
      state = PremiumState.error(message: e.message);
      return false;
    } catch (e) {
      if (!ref.mounted) return false;
      state = PremiumState.error(message: '購入に失敗しました: $e');
      return false;
    }
  }

  /// 購入を復元
  Future<bool> restore() async {
    final currentState = state;
    if (currentState is! PremiumStateLoaded) return false;

    state = const PremiumState.loading();

    try {
      final success = await _subscriptionService.restore();

      if (!ref.mounted) return false;

      state = PremiumState.loaded(
        selectedPlan: PremiumPlan.monthly,
        plans: _plans,
        isPremium: success,
      );
      return success;
    } on ApiException catch (e) {
      if (!ref.mounted) return false;
      state = PremiumState.error(message: e.message);
      return false;
    } catch (e) {
      if (!ref.mounted) return false;
      state = PremiumState.error(message: '復元に失敗しました: $e');
      return false;
    }
  }

  /// エラーからリセット
  Future<void> resetFromError() async {
    if (state is PremiumStateError) {
      await loadPremiumInfo();
    }
  }

  /// 価格をフォーマット
  static String formatPrice(int price) {
    return '¥$price';
  }
}

/// PremiumViewModelのプロバイダー
final premiumViewModelProvider =
    NotifierProvider.autoDispose<PremiumViewModel, PremiumState>(
  PremiumViewModel.new,
);

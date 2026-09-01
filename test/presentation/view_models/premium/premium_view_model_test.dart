import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yogolyzer/presentation/view_models/premium/premium_view_model.dart';

void main() {
  group('PremiumPlan', () {
    test('should have monthly and yearly values', () {
      expect(PremiumPlan.values.length, 2);
      expect(PremiumPlan.monthly, isNotNull);
      expect(PremiumPlan.yearly, isNotNull);
    });
  });

  group('PlanInfo', () {
    test('should create with all required fields', () {
      // Arrange & Act
      const plan = PlanInfo(
        plan: PremiumPlan.monthly,
        name: '月額プラン',
        price: 500,
        period: '月',
      );

      // Assert
      expect(plan.plan, PremiumPlan.monthly);
      expect(plan.name, '月額プラン');
      expect(plan.price, 500);
      expect(plan.period, '月');
      expect(plan.savings, isNull);
    });

    test('should create with savings', () {
      // Arrange & Act
      const plan = PlanInfo(
        plan: PremiumPlan.yearly,
        name: '年額プラン',
        price: 4800,
        period: '年',
        savings: '2ヶ月分お得',
      );

      // Assert
      expect(plan.savings, '2ヶ月分お得');
    });

    test('should support copyWith', () {
      // Arrange
      const plan = PlanInfo(
        plan: PremiumPlan.monthly,
        name: '月額プラン',
        price: 500,
        period: '月',
      );

      // Act
      final updated = plan.copyWith(price: 600);

      // Assert
      expect(updated.price, 600);
      expect(updated.name, '月額プラン'); // unchanged
    });
  });

  group('PremiumState', () {
    test('loading state should be created correctly', () {
      // Arrange & Act
      const state = PremiumState.loading();

      // Assert
      expect(state, isA<PremiumStateLoading>());
    });

    test('loaded state should contain plan info', () {
      // Arrange & Act
      const state = PremiumState.loaded(
        selectedPlan: PremiumPlan.monthly,
        plans: [
          PlanInfo(
            plan: PremiumPlan.monthly,
            name: '月額プラン',
            price: 500,
            period: '月',
          ),
        ],
        isPremium: false,
      );

      // Assert
      expect(state, isA<PremiumStateLoaded>());
      final loadedState = state as PremiumStateLoaded;
      expect(loadedState.selectedPlan, PremiumPlan.monthly);
      expect(loadedState.plans.length, 1);
      expect(loadedState.isPremium, false);
    });

    test('purchasing state should contain plan', () {
      // Arrange & Act
      const state = PremiumState.purchasing(plan: PremiumPlan.yearly);

      // Assert
      expect(state, isA<PremiumStatePurchasing>());
      final purchasingState = state as PremiumStatePurchasing;
      expect(purchasingState.plan, PremiumPlan.yearly);
    });

    test('purchaseSuccess state should be created correctly', () {
      // Arrange & Act
      const state = PremiumState.purchaseSuccess();

      // Assert
      expect(state, isA<PremiumStatePurchaseSuccess>());
    });

    test('error state should contain message', () {
      // Arrange & Act
      const state = PremiumState.error(message: '購入に失敗しました');

      // Assert
      expect(state, isA<PremiumStateError>());
      final errorState = state as PremiumStateError;
      expect(errorState.message, '購入に失敗しました');
    });

    test('when should pattern match correctly', () {
      // Arrange
      const state = PremiumState.loading();

      // Act
      final result = state.when(
        loading: () => 'loading',
        loaded: (s, p, i) => 'loaded',
        purchasing: (p) => 'purchasing',
        purchaseSuccess: () => 'success',
        error: (m) => 'error',
      );

      // Assert
      expect(result, 'loading');
    });
  });

  group('PremiumViewModel', () {
    late ProviderContainer container;
    late PremiumViewModel viewModel;

    setUp(() {
      container = ProviderContainer();
      viewModel = container.read(premiumViewModelProvider.notifier);
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state should be loading', () {
      // Assert
      final state = container.read(premiumViewModelProvider);
      expect(state, isA<PremiumStateLoading>());
    });

    test('loadPremiumInfo should transition to loaded state', () async {
      // Act
      await viewModel.loadPremiumInfo();

      // Assert
      final state = container.read(premiumViewModelProvider);
      expect(state, isA<PremiumStateLoaded>());
      final loadedState = state as PremiumStateLoaded;
      expect(loadedState.plans.length, 2);
      expect(loadedState.selectedPlan, PremiumPlan.monthly);
    });

    test('selectPlan should change selected plan', () async {
      // Arrange
      await viewModel.loadPremiumInfo();

      // Act
      viewModel.selectPlan(PremiumPlan.yearly);

      // Assert
      final state = container.read(premiumViewModelProvider);
      final loadedState = state as PremiumStateLoaded;
      expect(loadedState.selectedPlan, PremiumPlan.yearly);
    });

    test('selectPlan should not change state when not loaded', () {
      // Don't load - state is still loading

      // Act
      viewModel.selectPlan(PremiumPlan.yearly);

      // Assert - still loading
      final state = container.read(premiumViewModelProvider);
      expect(state, isA<PremiumStateLoading>());
    });

    test('purchase should transition to success', () async {
      // Arrange
      await viewModel.loadPremiumInfo();

      // Act
      final success = await viewModel.purchase();

      // Assert
      expect(success, true);
      final state = container.read(premiumViewModelProvider);
      expect(state, isA<PremiumStatePurchaseSuccess>());
    });

    test('purchase should return false when not loaded', () async {
      // Don't load - state is still loading

      // Act
      final success = await viewModel.purchase();

      // Assert
      expect(success, false);
    });

    test('restore should transition to loaded with isPremium true', () async {
      // Arrange
      await viewModel.loadPremiumInfo();

      // Act
      final success = await viewModel.restore();

      // Assert
      expect(success, true);
      final state = container.read(premiumViewModelProvider);
      expect(state, isA<PremiumStateLoaded>());
      final loadedState = state as PremiumStateLoaded;
      expect(loadedState.isPremium, true);
    });

    test('restore should return false when not loaded', () async {
      // Don't load - state is still loading

      // Act
      final success = await viewModel.restore();

      // Assert
      expect(success, false);
    });

    test('resetFromError should reload when in error state', () async {
      // Arrange
      viewModel.state = const PremiumState.error(message: 'テストエラー');

      // Act
      await viewModel.resetFromError();

      // Assert
      final state = container.read(premiumViewModelProvider);
      expect(state, isA<PremiumStateLoaded>());
    });

    test('resetFromError should not reload when not in error state', () async {
      // Arrange - state is loading

      // Act
      await viewModel.resetFromError();

      // Assert - still loading (not reloaded)
      final state = container.read(premiumViewModelProvider);
      expect(state, isA<PremiumStateLoading>());
    });
  });

  group('PremiumViewModel.formatPrice', () {
    test('should format price with yen symbol', () {
      expect(PremiumViewModel.formatPrice(500), '¥500');
      expect(PremiumViewModel.formatPrice(4800), '¥4800');
    });
  });
}

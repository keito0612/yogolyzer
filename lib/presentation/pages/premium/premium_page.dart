import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view_models/premium/premium_view_model.dart';

/// プレミアム画面
class PremiumPage extends HookConsumerWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(premiumViewModelProvider);
    final viewModel = ref.read(premiumViewModelProvider.notifier);

    useEffect(() {
      Future.microtask(() {
        viewModel.loadPremiumInfo();
      });
      return null;
    }, const []);

    // 購入成功時に画面を閉じる
    ref.listen<PremiumState>(premiumViewModelProvider, (previous, next) {
      next.whenOrNull(
        purchaseSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('プレミアムに登録しました！'),
              backgroundColor: Colors.green,
            ),
          );
          if (context.canPop()) {
            context.pop(true);
          }
        },
        error: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Colors.red,
            ),
          );
          Future.microtask(() => viewModel.resetFromError());
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('プレミアム'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            }
          },
        ),
      ),
      body: state.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        loaded: (selectedPlan, plans, isPremium) => _buildContent(
          context,
          ref,
          selectedPlan: selectedPlan,
          plans: plans,
          isPremium: isPremium,
        ),
        purchasing: (plan) => _buildPurchasingOverlay(context, plan),
        purchaseSuccess: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, size: 64, color: Colors.green),
              SizedBox(height: 16),
              Text('プレミアムに登録しました！'),
            ],
          ),
        ),
        error: (message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text(message, textAlign: TextAlign.center),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => viewModel.loadPremiumInfo(),
                child: const Text('再読み込み'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref, {
    required PremiumPlan selectedPlan,
    required List<PlanInfo> plans,
    required bool isPremium,
  }) {
    final viewModel = ref.read(premiumViewModelProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    if (isPremium) {
      return _buildAlreadyPremium(context);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // プレミアムアイコン
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.amber.shade400,
                  Colors.orange.shade600,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.workspace_premium,
              size: 48,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Premium',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'すべての機能を制限なく使えます',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
          ),

          const SizedBox(height: 32),

          // 特典一覧
          _buildFeatureList(context),

          const SizedBox(height: 32),

          // プラン選択
          ...plans.map((plan) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _PlanCard(
                  plan: plan,
                  isSelected: selectedPlan == plan.plan,
                  onTap: () => viewModel.selectPlan(plan.plan),
                ),
              )),

          const SizedBox(height: 24),

          // 購入ボタン
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () => viewModel.purchase(),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                '購入する',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 購入を復元
          TextButton(
            onPressed: () => viewModel.restore(),
            child: Text(
              '購入を復元',
              style: TextStyle(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 注意書き
          Text(
            '購入後、サブスクリプションはApple IDに請求されます。\n'
            '現在の期間終了の24時間前までにキャンセルしない限り、\n'
            '自動的に更新されます。',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildFeatureItem(
            context,
            icon: Icons.all_inclusive,
            title: '診断回数無制限',
            description: '1日何回でも汚れを診断できます',
          ),
          const SizedBox(height: 16),
          _buildFeatureItem(
            context,
            icon: Icons.history,
            title: '履歴無制限',
            description: '診断履歴を無制限に保存できます',
          ),
          const SizedBox(height: 16),
          _buildFeatureItem(
            context,
            icon: Icons.block,
            title: '広告なし',
            description: '広告なしで快適に利用できます',
          ),
          const SizedBox(height: 16),
          _buildFeatureItem(
            context,
            icon: Icons.cloud_sync,
            title: 'データ同期',
            description: 'クラウドにデータをバックアップできます',
          ),
          const SizedBox(height: 16),
          _buildFeatureItem(
            context,
            icon: Icons.science,
            title: '全レシピ解放',
            description: 'すべての自作洗剤レシピを見られます',
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 20,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.check_circle,
          color: Colors.green.shade600,
          size: 24,
        ),
      ],
    );
  }

  Widget _buildAlreadyPremium(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.amber.shade400,
                    Colors.orange.shade600,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.workspace_premium,
                size: 56,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'プレミアム会員です',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'すべての機能をご利用いただけます',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
            const SizedBox(height: 32),
            Text(
              'サブスクリプションの管理は\nApp Storeの設定から行えます',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPurchasingOverlay(BuildContext context, PremiumPlan plan) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 24),
          Text('購入処理中...'),
        ],
      ),
    );
  }
}

/// プランカード
class _PlanCard extends StatelessWidget {
  const _PlanCard({
    required this.plan,
    required this.isSelected,
    required this.onTap,
  });

  final PlanInfo plan;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? colorScheme.primaryContainer
              : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? colorScheme.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            // ラジオボタン
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? colorScheme.primary : colorScheme.outline,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 16),

            // プラン情報
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        plan.name,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      if (plan.savings != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            plan.savings!,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),

            // 価格
            Text(
              '${PremiumViewModel.formatPrice(plan.price)}/${plan.period}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_spacing.dart';
import '../../router/app_routes.dart';
import '../../view_models/diagnosis_result/diagnosis_result_view_model.dart';
import '../../view_models/history_detail/history_detail_view_model.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_card.dart';

/// 履歴詳細画面
class HistoryDetailPage extends HookConsumerWidget {
  const HistoryDetailPage({
    super.key,
    required this.historyId,
  });

  final String historyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(historyDetailViewModelProvider);
    final viewModel = ref.read(historyDetailViewModelProvider.notifier);

    // 初期化時に履歴詳細を読み込む
    useEffect(() {
      Future.microtask(() {
        viewModel.loadDetail(historyId);
      });
      return null;
    }, [historyId]);

    // 削除完了時に一覧画面へ戻る
    ref.listen<HistoryDetailState>(historyDetailViewModelProvider,
        (previous, next) {
      next.whenOrNull(
        deleted: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('履歴を削除しました')),
          );
          context.go(AppRoutes.history);
        },
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('診断詳細'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(AppRoutes.history);
            }
          },
        ),
        actions: [
          state.maybeWhen(
            loaded: (result) => IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _showDeleteConfirmDialog(context, viewModel),
            ),
            deleting: (result) => const Padding(
              padding: EdgeInsets.all(12),
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
      body: SafeArea(
        child: state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (result) => _buildContent(context, result),
          deleting: (result) => _buildContent(context, result),
          deleted: () => const Center(child: CircularProgressIndicator()),
          error: (message) => _buildError(context, message, viewModel),
        ),
      ),
    );
  }

  Future<void> _showDeleteConfirmDialog(
    BuildContext context,
    HistoryDetailViewModel viewModel,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('履歴を削除'),
        content: const Text('この診断履歴を削除してもよろしいですか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('キャンセル'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.error,
            ),
            child: const Text('削除'),
          ),
        ],
      ),
    );

    if (result == true) {
      await viewModel.deleteHistory();
    }
  }

  Widget _buildContent(BuildContext context, DiagnosisResult result) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 撮影画像
          _buildImage(result.imagePath),

          const SizedBox(height: AppSpacing.md),

          // 場所・素材表示
          _buildLocationMaterial(context, result),

          const SizedBox(height: AppSpacing.sm),

          // 診断日時
          _buildDateTime(context, result.createdAt),

          const SizedBox(height: AppSpacing.lg),

          // 診断結果セクション
          _buildDiagnosisSection(context, result),

          const SizedBox(height: AppSpacing.lg),

          // おすすめ洗剤セクション
          _buildDetergentsSection(context, result),

          const SizedBox(height: AppSpacing.lg),

          // 自作レシピセクション
          if (result.diyRecipe != null)
            _buildDiyRecipeSection(context, result.diyRecipe!),

          if (result.diyRecipe != null) const SizedBox(height: AppSpacing.lg),

          // 掃除手順セクション
          _buildCleaningStepsSection(context, result),

          const SizedBox(height: AppSpacing.lg),

          // 注意セクション
          if (result.cautions.isNotEmpty)
            _buildCautionsSection(context, result),

          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  Widget _buildImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: imagePath.isNotEmpty
            ? Image.file(
                File(imagePath),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildImagePlaceholder();
                },
              )
            : _buildImagePlaceholder(),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      color: AppColors.background,
      child: const Center(
        child: Icon(
          Icons.image,
          size: 64,
          color: AppColors.textDisabled,
        ),
      ),
    );
  }

  Widget _buildLocationMaterial(BuildContext context, DiagnosisResult result) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          size: 16,
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: 4),
        Text(
          '${result.location} / ${result.material}',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
      ],
    );
  }

  Widget _buildDateTime(BuildContext context, DateTime dateTime) {
    return Row(
      children: [
        Icon(
          Icons.access_time,
          size: 16,
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: 4),
        Text(
          HistoryDetailViewModel.formatDateTime(dateTime),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
              ),
        ),
      ],
    );
  }

  Widget _buildDiagnosisSection(BuildContext context, DiagnosisResult result) {
    final confidenceLevel =
        DiagnosisResultViewModel.getConfidenceLevel(result.confidence);
    final confidenceColor = _getConfidenceColor(confidenceLevel);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.search,
                size: 20,
                color: AppColors.primary,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                '診断結果',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            result.stainType,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Text(
                '信頼度: ${(result.confidence * 100).toInt()}%',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: result.confidence,
                    backgroundColor: AppColors.border,
                    valueColor: AlwaysStoppedAnimation<Color>(confidenceColor),
                    minHeight: 8,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getConfidenceColor(String level) {
    switch (level) {
      case 'success':
        return AppColors.success;
      case 'warning':
        return AppColors.warning;
      case 'error':
        return AppColors.error;
      default:
        return AppColors.primary;
    }
  }

  Widget _buildDetergentsSection(BuildContext context, DiagnosisResult result) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.cleaning_services,
                size: 20,
                color: AppColors.primary,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                'おすすめ洗剤',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ...result.recommendedDetergents.asMap().entries.map((entry) {
            final index = entry.key;
            final detergent = entry.value;
            return Padding(
              padding: EdgeInsets.only(
                top: index == 0 ? 0 : AppSpacing.sm,
              ),
              child: _buildDetergentItem(context, detergent),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDetergentItem(BuildContext context, Detergent detergent) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.local_drink,
              size: 20,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detergent.name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  detergent.brand,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  detergent.reason,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiyRecipeSection(BuildContext context, DiyRecipe recipe) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.science,
                size: 20,
                color: AppColors.primary,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                '自作レシピ',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          InkWell(
            onTap: () => _showRecipeBottomSheet(context, recipe),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      recipe.name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Text(
                    '詳しく見る',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showRecipeBottomSheet(BuildContext context, DiyRecipe recipe) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => _RecipeBottomSheet(recipe: recipe),
    );
  }

  Widget _buildCleaningStepsSection(
    BuildContext context,
    DiagnosisResult result,
  ) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.checklist,
                size: 20,
                color: AppColors.primary,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                '掃除手順',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ...result.cleaningSteps.asMap().entries.map((entry) {
            final index = entry.key;
            final step = entry.value;
            return Padding(
              padding: EdgeInsets.only(
                top: index == 0 ? 0 : AppSpacing.sm,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        step,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildCautionsSection(BuildContext context, DiagnosisResult result) {
    return AppCard(
      backgroundColor: AppColors.error.withValues(alpha: 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.warning_amber,
                size: 20,
                color: AppColors.error,
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                '注意事項',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.error,
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ...result.cautions.map((caution) {
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(color: AppColors.error)),
                  Expanded(
                    child: Text(
                      caution,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textPrimary,
                          ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildError(
    BuildContext context,
    String message,
    HistoryDetailViewModel viewModel,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.error,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              '読み込みに失敗しました',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            AppButton(
              label: '再試行',
              onPressed: () => viewModel.loadDetail(historyId),
            ),
            const SizedBox(height: AppSpacing.md),
            TextButton(
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  context.go(AppRoutes.history);
                }
              },
              child: const Text('戻る'),
            ),
          ],
        ),
      ),
    );
  }
}

/// レシピ詳細BottomSheet
class _RecipeBottomSheet extends StatelessWidget {
  const _RecipeBottomSheet({required this.recipe});

  final DiyRecipe recipe;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                recipe.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: AppSpacing.xl),
              _buildSection(
                context,
                icon: Icons.list_alt,
                title: '材料',
                items: recipe.ingredients,
              ),
              const SizedBox(height: AppSpacing.lg),
              _buildSection(
                context,
                icon: Icons.build,
                title: '作り方',
                items: recipe.instructions,
                numbered: true,
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                '使い方',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                recipe.usage,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.lg),
              if (recipe.cautions.isNotEmpty) ...[
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.warning.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.warning_amber,
                            size: 16,
                            color: AppColors.warning,
                          ),
                          const SizedBox(width: AppSpacing.xs),
                          Text(
                            '注意',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.warning,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      ...recipe.cautions.map((caution) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            '• $caution',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required IconData icon,
    required String title,
    required List<String> items,
    bool numbered = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: AppColors.primary),
            const SizedBox(width: AppSpacing.sm),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        ...items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              numbered ? '${index + 1}. $item' : '• $item',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        }),
      ],
    );
  }
}

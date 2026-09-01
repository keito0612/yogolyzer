import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_spacing.dart';
import '../../router/app_routes.dart';
import '../../view_models/history/history_view_model.dart';
import '../../widgets/app_card.dart';

/// 履歴一覧画面
class HistoryPage extends HookConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(historyViewModelProvider);
    final viewModel = ref.read(historyViewModelProvider.notifier);

    // 初期化時に履歴を読み込む
    useEffect(() {
      Future.microtask(() {
        viewModel.loadHistory();
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('診断履歴'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (groups) => _buildHistoryList(context, ref, groups),
          empty: () => _buildEmptyState(context),
          error: (message) => _buildError(context, ref, message),
        ),
      ),
    );
  }

  Widget _buildHistoryList(
    BuildContext context,
    WidgetRef ref,
    List<HistoryGroup> groups,
  ) {
    return RefreshIndicator(
      onRefresh: () => ref.read(historyViewModelProvider.notifier).reload(),
      child: ListView.builder(
        padding: const EdgeInsets.all(AppSpacing.lg),
        itemCount: groups.fold<int>(
          0,
          (sum, group) => sum + 1 + group.items.length,
        ),
        itemBuilder: (context, index) {
          int currentIndex = 0;
          for (final group in groups) {
            // グループヘッダー
            if (currentIndex == index) {
              return _buildDateHeader(context, group.label);
            }
            currentIndex++;

            // グループ内のアイテム
            for (final item in group.items) {
              if (currentIndex == index) {
                return _buildHistoryItem(context, ref, item);
              }
              currentIndex++;
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildDateHeader(BuildContext context, String label) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSpacing.md,
        bottom: AppSpacing.sm,
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  Widget _buildHistoryItem(
    BuildContext context,
    WidgetRef ref,
    HistoryItem item,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Dismissible(
        key: Key(item.id),
        direction: DismissDirection.endToStart,
        background: _buildDismissBackground(),
        confirmDismiss: (direction) => _showDeleteConfirmDialog(context),
        onDismissed: (direction) {
          ref.read(historyViewModelProvider.notifier).deleteHistory(item.id);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('履歴を削除しました')),
          );
        },
        child: AppCard(
          onTap: () => context.go(AppRoutes.historyDetailPath(item.id)),
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              // サムネイル
              _buildThumbnail(item.imagePath),

              const SizedBox(width: AppSpacing.md),

              // 情報
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 汚れタイプ
                    Text(
                      item.stainType,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 4),
                    // 場所・素材
                    Text(
                      '${item.location} / ${item.material}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                    ),
                  ],
                ),
              ),

              // 時刻
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    HistoryViewModel.formatTime(item.createdAt),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnail(String imagePath) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.background,
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: imagePath.isNotEmpty
          ? Image.file(
              File(imagePath),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return _buildThumbnailPlaceholder();
              },
            )
          : _buildThumbnailPlaceholder(),
    );
  }

  Widget _buildThumbnailPlaceholder() {
    return const Center(
      child: Icon(
        Icons.image,
        size: 24,
        color: AppColors.textDisabled,
      ),
    );
  }

  Widget _buildDismissBackground() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.error,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.delete_outline,
        color: Colors.white,
        size: 24,
      ),
    );
  }

  Future<bool?> _showDeleteConfirmDialog(BuildContext context) {
    return showDialog<bool>(
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
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.history,
                size: 60,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              '履歴がありません',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textPrimary,
                  ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '診断を行うと履歴に保存されます',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildError(
    BuildContext context,
    WidgetRef ref,
    String message,
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
            ElevatedButton(
              onPressed: () =>
                  ref.read(historyViewModelProvider.notifier).reload(),
              child: const Text('再試行'),
            ),
          ],
        ),
      ),
    );
  }
}

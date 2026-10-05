import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_spacing.dart';
import '../../router/app_routes.dart';
import '../../view_models/diagnosing/diagnosing_view_model.dart';
import '../../widgets/app_button.dart';

/// 診断中画面
class DiagnosingPage extends HookConsumerWidget {
  const DiagnosingPage({
    super.key,
    required this.imagePath,
    required this.location,
    required this.material,
  });

  final String imagePath;
  final String location;
  final String material;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(diagnosingViewModelProvider);

    // 初期化時に診断を開始
    useEffect(() {
      Future.microtask(() {
        ref.read(diagnosingViewModelProvider.notifier).startDiagnosis(
              imagePath: imagePath,
              location: location,
              material: material,
            );
      });
      return null;
    }, []);

    // 診断完了時に結果画面へ遷移
    ref.listen<DiagnosingState>(diagnosingViewModelProvider, (previous, next) {
      next.whenOrNull(
        completed: (diagnosisId) {
          context.go(AppRoutes.resultPath(diagnosisId));
        },
      );
    });

    return PopScope(
      canPop: false, // 戻るボタン無効
      child: Scaffold(
        body: SafeArea(
          child: state.when(
            diagnosing: (imagePath, location, material) => _buildDiagnosing(
              context,
              imagePath,
            ),
            completed: (_) => _buildDiagnosing(context, imagePath), // 遷移中
            error: (message, canRetry, isRateLimitExceeded) => _buildError(
              context,
              ref,
              message,
              canRetry,
              isRateLimitExceeded: isRateLimitExceeded,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDiagnosing(BuildContext context, String imagePath) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 撮影画像
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              clipBehavior: Clip.antiAlias,
              child: imagePath.isNotEmpty
                  ? Image.file(
                      File(imagePath),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.image,
                          size: 48,
                          color: AppColors.textDisabled,
                        );
                      },
                    )
                  : const Icon(
                      Icons.image,
                      size: 48,
                      color: AppColors.textDisabled,
                    ),
            ),

            const SizedBox(height: AppSpacing.xl),

            // ローディングインジケーター
            const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                strokeWidth: 3,
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            // メインテキスト
            Text(
              'AI診断中...',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: AppSpacing.sm),

            // サブテキスト
            Text(
              '汚れの種類を分析しています',
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
    bool canRetry, {
    bool isRateLimitExceeded = false,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // アイコン
            Icon(
              isRateLimitExceeded ? Icons.workspace_premium : Icons.error_outline,
              size: 64,
              color: isRateLimitExceeded ? AppColors.warning : AppColors.error,
            ),

            const SizedBox(height: AppSpacing.lg),

            // タイトル
            Text(
              isRateLimitExceeded ? '本日の診断回数上限に達しました' : '診断に失敗しました',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSpacing.sm),

            Text(
              isRateLimitExceeded
                  ? 'プレミアムプランに登録すると\n無制限で診断できます'
                  : message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSpacing.xl),

            // プレミアムボタン（レート制限の場合）
            if (isRateLimitExceeded) ...[
              AppButton(
                label: 'プレミアムプランを見る',
                onPressed: () => context.push(AppRoutes.premium),
              ),
              const SizedBox(height: AppSpacing.md),
            ],

            // リトライボタン（リトライ可能な場合のみ表示）
            if (canRetry)
              AppButton(
                label: '再試行',
                onPressed: () {
                  ref.read(diagnosingViewModelProvider.notifier).retry();
                },
              ),

            if (!isRateLimitExceeded) const SizedBox(height: AppSpacing.md),

            // ホームに戻る
            TextButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('ホームに戻る'),
            ),
          ],
        ),
      ),
    );
  }
}

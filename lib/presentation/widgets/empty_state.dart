import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_spacing.dart';
import '../../shared/constants/app_typography.dart';
import 'app_button.dart';

/// Yogolyzer の空の状態ウィジェット
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.message,
    this.title,
    this.icon,
    this.iconWidget,
    this.actionLabel,
    this.onAction,
  });

  /// メインメッセージ
  final String message;

  /// タイトル（オプション）
  final String? title;

  /// アイコン
  final IconData? icon;

  /// カスタムアイコンウィジェット
  final Widget? iconWidget;

  /// アクションボタンのラベル
  final String? actionLabel;

  /// アクションボタン押下時のコールバック
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.screenPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // アイコン
          if (icon != null || iconWidget != null) ...[
            _buildIcon(),
            const SizedBox(height: AppSpacing.lg),
          ],

          // タイトル
          if (title != null) ...[
            Text(
              title!,
              style: AppTypography.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
          ],

          // メッセージ
          Text(
            message,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),

          // アクションボタン
          if (actionLabel != null && onAction != null) ...[
            const SizedBox(height: AppSpacing.lg),
            AppButton(
              onPressed: onAction,
              label: actionLabel!,
              variant: AppButtonVariant.secondary,
              isExpanded: false,
              size: AppButtonSize.medium,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildIcon() {
    if (iconWidget != null) {
      return iconWidget!;
    }

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.background,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 40,
        color: AppColors.textSecondary,
      ),
    );
  }
}

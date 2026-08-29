import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_typography.dart';

/// ボタンのバリアント
enum AppButtonVariant {
  /// プライマリボタン（塗りつぶし）
  primary,

  /// セカンダリボタン（アウトライン）
  secondary,

  /// テキストボタン
  text,
}

/// Yogolyzer の共通ボタンウィジェット
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.variant = AppButtonVariant.primary,
    this.icon,
    this.isLoading = false,
    this.isExpanded = true,
    this.size = AppButtonSize.large,
  });

  /// ボタン押下時のコールバック（nullでdisabled）
  final VoidCallback? onPressed;

  /// ボタンのラベル
  final String label;

  /// ボタンのバリアント
  final AppButtonVariant variant;

  /// 左側に表示するアイコン
  final IconData? icon;

  /// ローディング状態
  final bool isLoading;

  /// 横幅を親要素いっぱいに広げるか
  final bool isExpanded;

  /// ボタンのサイズ
  final AppButtonSize size;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null || isLoading;

    return SizedBox(
      width: isExpanded ? double.infinity : null,
      height: size.height,
      child: _buildButton(isDisabled),
    );
  }

  Widget _buildButton(bool isDisabled) {
    final child = _buildChild();

    switch (variant) {
      case AppButtonVariant.primary:
        return ElevatedButton(
          onPressed: isDisabled ? null : onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(size.minWidth, size.height),
            padding: size.padding,
          ),
          child: child,
        );

      case AppButtonVariant.secondary:
        return OutlinedButton(
          onPressed: isDisabled ? null : onPressed,
          style: OutlinedButton.styleFrom(
            minimumSize: Size(size.minWidth, size.height),
            padding: size.padding,
          ),
          child: child,
        );

      case AppButtonVariant.text:
        return TextButton(
          onPressed: isDisabled ? null : onPressed,
          style: TextButton.styleFrom(
            minimumSize: Size(size.minWidth, size.height),
            padding: size.padding,
          ),
          child: child,
        );
    }
  }

  Widget _buildChild() {
    if (isLoading) {
      return SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: variant == AppButtonVariant.primary
              ? AppColors.buttonPrimaryFg
              : AppColors.primary,
        ),
      );
    }

    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: size.iconSize),
          SizedBox(width: size.iconSpacing),
          Text(label, style: size.textStyle),
        ],
      );
    }

    return Text(label, style: size.textStyle);
  }
}

/// ボタンのサイズ
enum AppButtonSize {
  small(
    height: 40,
    minWidth: 64,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    iconSize: 18,
    iconSpacing: 6,
    textStyle: AppTypography.labelMedium,
  ),
  medium(
    height: 48,
    minWidth: 80,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    iconSize: 20,
    iconSpacing: 8,
    textStyle: AppTypography.labelLarge,
  ),
  large(
    height: 56,
    minWidth: 88,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    iconSize: 24,
    iconSpacing: 8,
    textStyle: AppTypography.labelLarge,
  );

  const AppButtonSize({
    required this.height,
    required this.minWidth,
    required this.padding,
    required this.iconSize,
    required this.iconSpacing,
    required this.textStyle,
  });

  final double height;
  final double minWidth;
  final EdgeInsets padding;
  final double iconSize;
  final double iconSpacing;
  final TextStyle textStyle;
}

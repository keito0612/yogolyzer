import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_radius.dart';
import '../../shared/constants/app_shadows.dart';
import '../../shared/constants/app_spacing.dart';

/// カードのバリアント
enum AppCardVariant {
  /// デフォルト（シャドウあり）
  elevated,

  /// アウトライン（ボーダーあり）
  outlined,

  /// 塗りつぶし（背景色のみ）
  filled,
}

/// Yogolyzer の共通カードウィジェット
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.variant = AppCardVariant.elevated,
    this.padding,
    this.margin,
    this.onTap,
    this.borderRadius,
    this.backgroundColor,
  });

  /// カードの中身
  final Widget child;

  /// カードのバリアント
  final AppCardVariant variant;

  /// 内側のパディング
  final EdgeInsetsGeometry? padding;

  /// 外側のマージン
  final EdgeInsetsGeometry? margin;

  /// タップ時のコールバック
  final VoidCallback? onTap;

  /// 角丸（nullでデフォルト）
  final BorderRadius? borderRadius;

  /// 背景色（nullでデフォルト）
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = borderRadius ?? AppRadius.cardAll;
    final effectiveBackgroundColor = backgroundColor ?? _getBackgroundColor();

    Widget card = Container(
      margin: margin,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: effectiveBorderRadius,
        border: _getBorder(),
        boxShadow: _getBoxShadow(),
      ),
      child: Padding(
        padding: padding ?? AppSpacing.cardPadding,
        child: child,
      ),
    );

    if (onTap != null) {
      card = Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: effectiveBorderRadius,
          child: card,
        ),
      );
    }

    return card;
  }

  Color _getBackgroundColor() {
    switch (variant) {
      case AppCardVariant.elevated:
      case AppCardVariant.outlined:
        return AppColors.cardBg;
      case AppCardVariant.filled:
        return AppColors.background;
    }
  }

  Border? _getBorder() {
    switch (variant) {
      case AppCardVariant.outlined:
        return Border.all(color: AppColors.cardBorder, width: 1);
      case AppCardVariant.elevated:
      case AppCardVariant.filled:
        return null;
    }
  }

  List<BoxShadow>? _getBoxShadow() {
    switch (variant) {
      case AppCardVariant.elevated:
        return AppShadows.card;
      case AppCardVariant.outlined:
      case AppCardVariant.filled:
        return null;
    }
  }
}

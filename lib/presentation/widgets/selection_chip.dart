import 'package:flutter/material.dart';

import '../../shared/constants/app_colors.dart';
import '../../shared/constants/app_radius.dart';
import '../../shared/constants/app_spacing.dart';
import '../../shared/constants/app_typography.dart';

/// 選択チップウィジェット
class SelectionChip extends StatelessWidget {
  const SelectionChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.icon,
    this.iconWidget,
    this.size = SelectionChipSize.medium,
  });

  /// チップのラベル
  final String label;

  /// 選択状態
  final bool isSelected;

  /// タップ時のコールバック
  final VoidCallback onTap;

  /// アイコン（IconData）
  final IconData? icon;

  /// アイコンウィジェット（カスタムアイコン用）
  final Widget? iconWidget;

  /// チップのサイズ
  final SelectionChipSize size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        constraints: BoxConstraints(
          minWidth: size.minWidth,
          minHeight: size.minHeight,
        ),
        padding: size.padding,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.chipSelectedBg : AppColors.chipUnselectedBg,
          borderRadius: AppRadius.chipAll,
          border: isSelected
              ? null
              : Border.all(color: AppColors.chipUnselectedBorder, width: 1),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null || iconWidget != null) ...[
              _buildIcon(),
              SizedBox(height: size.iconSpacing),
            ],
            Text(
              label,
              style: size.textStyle.copyWith(
                color: isSelected ? AppColors.chipSelectedFg : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (iconWidget != null) {
      return iconWidget!;
    }

    return Icon(
      icon,
      size: size.iconSize,
      color: isSelected ? AppColors.chipSelectedFg : AppColors.textSecondary,
    );
  }
}

/// 選択チップのサイズ
enum SelectionChipSize {
  small(
    minWidth: 64,
    minHeight: 40,
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    iconSize: 20,
    iconSpacing: 4,
    textStyle: AppTypography.bodySmall,
  ),
  medium(
    minWidth: 80,
    minHeight: 64,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    iconSize: 24,
    iconSpacing: 6,
    textStyle: AppTypography.bodySmall,
  ),
  large(
    minWidth: 100,
    minHeight: 80,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    iconSize: 28,
    iconSpacing: 8,
    textStyle: AppTypography.bodyMedium,
  );

  const SelectionChipSize({
    required this.minWidth,
    required this.minHeight,
    required this.padding,
    required this.iconSize,
    required this.iconSpacing,
    required this.textStyle,
  });

  final double minWidth;
  final double minHeight;
  final EdgeInsets padding;
  final double iconSize;
  final double iconSpacing;
  final TextStyle textStyle;
}

/// 選択チップのグリッドウィジェット
class SelectionChipGrid extends StatelessWidget {
  const SelectionChipGrid({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
    this.crossAxisCount = 3,
    this.spacing = AppSpacing.sm,
    this.chipSize = SelectionChipSize.medium,
  });

  /// チップのアイテムリスト
  final List<SelectionChipItem> items;

  /// 選択されているインデックス（-1で未選択）
  final int selectedIndex;

  /// 選択時のコールバック
  final ValueChanged<int> onSelected;

  /// 列数
  final int crossAxisCount;

  /// チップ間のスペース
  final double spacing;

  /// チップのサイズ
  final SelectionChipSize chipSize;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      children: List.generate(items.length, (index) {
        final item = items[index];
        return SelectionChip(
          label: item.label,
          icon: item.icon,
          iconWidget: item.iconWidget,
          isSelected: selectedIndex == index,
          onTap: () => onSelected(index),
          size: chipSize,
        );
      }),
    );
  }
}

/// 選択チップのアイテム
class SelectionChipItem {
  const SelectionChipItem({
    required this.label,
    this.icon,
    this.iconWidget,
    this.value,
  });

  final String label;
  final IconData? icon;
  final Widget? iconWidget;
  final dynamic value;
}

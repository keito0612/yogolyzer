import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_spacing.dart';
import '../../router/app_routes.dart';
import '../../view_models/select_location/select_location_view_model.dart';
import '../../widgets/app_button.dart';
import '../../widgets/selection_chip.dart';

/// 場所選択画面
class SelectLocationPage extends HookConsumerWidget {
  const SelectLocationPage({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectLocationViewModelProvider);
    final viewModel = ref.read(selectLocationViewModelProvider.notifier);

    // 初期化時に画像パスを設定
    useEffect(() {
      Future.microtask(() {
        viewModel.setImagePath(imagePath);
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('場所を選択'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 撮影画像サムネイル
                    _buildThumbnail(context),

                    const SizedBox(height: AppSpacing.lg),

                    // 説明テキスト
                    Text(
                      '汚れがある場所を選んでください',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    const SizedBox(height: AppSpacing.lg),

                    // 選択グリッド
                    _buildSelectionGrid(context, state, viewModel),

                    // 「その他」選択時のカスタムテキスト表示
                    if (state.selectedIndex == LocationType.other.index &&
                        state.customLocationText.isNotEmpty) ...[
                      const SizedBox(height: AppSpacing.md),
                      _buildCustomLocationDisplay(context, ref, state),
                    ],
                  ],
                ),
              ),
            ),

            // 次へボタン
            _buildNextButton(context, state, viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail(BuildContext context) {
    return Center(
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: imagePath.isNotEmpty
            ? Image.file(
                File(imagePath),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image, color: AppColors.textDisabled);
                },
              )
            : const Icon(Icons.image, color: AppColors.textDisabled),
      ),
    );
  }

  Widget _buildSelectionGrid(
    BuildContext context,
    SelectLocationState state,
    SelectLocationViewModel viewModel,
  ) {
    final items = LocationType.values.map((location) {
      return SelectionChipItem(
        label: location.label,
        iconWidget: Text(
          location.emoji,
          style: const TextStyle(fontSize: 24),
        ),
        value: location,
      );
    }).toList();

    return SelectionChipGrid(
      items: items,
      selectedIndex: state.selectedIndex,
      onSelected: (index) {
        viewModel.selectLocation(index);

        // 「その他」を選択したらBottomSheetを表示
        if (index == LocationType.other.index) {
          _showCustomLocationBottomSheet(context, viewModel, state.customLocationText);
        }
      },
      chipSize: SelectionChipSize.large,
    );
  }

  Widget _buildCustomLocationDisplay(
    BuildContext context,
    WidgetRef ref,
    SelectLocationState state,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.chipSelectedBg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.edit_note, color: AppColors.primary),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              state.customLocationText,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, size: 20),
            color: AppColors.primary,
            onPressed: () {
              _showCustomLocationBottomSheet(
                context,
                ref.read(selectLocationViewModelProvider.notifier),
                state.customLocationText,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton(
    BuildContext context,
    SelectLocationState state,
    SelectLocationViewModel viewModel,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: AppButton(
        label: '次へ',
        onPressed: state.isReadyToNext
            ? () {
                // 素材選択画面へ遷移（場所と画像パスを渡す）
                context.go(
                  AppRoutes.selectMaterial,
                  extra: {
                    'imagePath': state.imagePath,
                    'location': viewModel.selectedLocationName,
                    'locationType': viewModel.selectedLocationType,
                  },
                );
              }
            : null,
        isExpanded: true,
      ),
    );
  }

  void _showCustomLocationBottomSheet(
    BuildContext context,
    SelectLocationViewModel viewModel,
    String initialText,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return _CustomLocationBottomSheet(
          viewModel: viewModel,
          initialText: initialText,
        );
      },
    );
  }
}

/// カスタム場所入力のBottomSheet
class _CustomLocationBottomSheet extends HookWidget {
  const _CustomLocationBottomSheet({
    required this.viewModel,
    required this.initialText,
  });

  final SelectLocationViewModel viewModel;
  final String initialText;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initialText);

    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '場所を入力',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: '例: 階段、ガレージ、物置など',
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.done,
            onSubmitted: (value) {
              viewModel.setCustomLocationText(value.trim());
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('キャンセル'),
              ),
              const SizedBox(width: AppSpacing.sm),
              AppButton(
                label: '確定',
                onPressed: () {
                  viewModel.setCustomLocationText(controller.text.trim());
                  Navigator.pop(context);
                },
                size: AppButtonSize.small,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

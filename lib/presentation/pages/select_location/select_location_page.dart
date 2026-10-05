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
  const SelectLocationPage({super.key, required this.imagePath});

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
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(AppRoutes.home);
            }
          },
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
        iconWidget: Text(location.emoji, style: const TextStyle(fontSize: 24)),
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
          _showCustomLocationBottomSheet(
            context,
            state.customLocationText,
          );
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
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.sm,
        horizontal: AppSpacing.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.chipSelectedBg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              state.customLocationText,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.warningLight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, size: 20),
            color: AppColors.background,
            onPressed: () {
              _showCustomLocationBottomSheet(
                context,
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
                // push()を使用して前の画面をスタックに保持
                context.push(
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
    String initialText,
  ) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom,
          ),
          child: _CustomLocationBottomSheet(
            initialText: initialText,
          ),
        );
      },
    );
  }
}

/// カスタム場所入力のBottomSheet
class _CustomLocationBottomSheet extends HookConsumerWidget {
  const _CustomLocationBottomSheet({
    required this.initialText,
  });

  final String initialText;

  static const int _maxLength = 30;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: initialText);
    final textLength = useState(initialText.length);
    final state = ref.watch(selectLocationViewModelProvider);
    final viewModel = ref.read(selectLocationViewModelProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('場所を入力', style: Theme.of(context).textTheme.titleMedium),
              Text(
                '${textLength.value}/$_maxLength',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: textLength.value > _maxLength
                          ? AppColors.error
                          : AppColors.textSecondary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: controller,
            autofocus: true,
            maxLength: _maxLength,
            buildCounter: (context,
                    {required currentLength,
                    required isFocused,
                    required maxLength}) =>
                null, // カスタムカウンターを使用するため非表示
            decoration: InputDecoration(
              hintText: '例: 階段、ガレージ、物置など',
              border: const OutlineInputBorder(),
              errorText: state.validationError,
            ),
            textInputAction: TextInputAction.done,
            onChanged: (value) {
              textLength.value = value.length;
            },
            onSubmitted: (value) {
              viewModel.setCustomLocationText(value);
              if (state.validationError == null &&
                  value.trim().length >= 2 &&
                  value.trim().length <= _maxLength) {
                Navigator.pop(context);
              }
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  viewModel.clearValidationError();
                  Navigator.pop(context);
                },
                child: const Text('キャンセル'),
              ),
              const SizedBox(width: AppSpacing.sm),
              AppButton(
                label: '確定',
                onPressed: () {
                  viewModel.setCustomLocationText(controller.text);
                  // バリデーション後、エラーがなければ閉じる
                  final newState = ref.read(selectLocationViewModelProvider);
                  if (newState.validationError == null &&
                      newState.isReadyToNext) {
                    Navigator.pop(context);
                  }
                },
                size: AppButtonSize.small,
                isExpanded: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_spacing.dart';
import '../../router/app_routes.dart';
import '../../view_models/select_location/select_location_view_model.dart';
import '../../view_models/select_material/select_material_view_model.dart';
import '../../widgets/app_button.dart';
import '../../widgets/selection_chip.dart';

/// 素材選択画面
class SelectMaterialPage extends HookConsumerWidget {
  const SelectMaterialPage({
    super.key,
    required this.imagePath,
    required this.locationName,
    this.locationType,
  });

  final String imagePath;
  final String locationName;
  final LocationType? locationType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectMaterialViewModelProvider);
    final viewModel = ref.read(selectMaterialViewModelProvider.notifier);

    // 初期化
    useEffect(() {
      Future.microtask(() {
        viewModel.initialize(
          imagePath: imagePath,
          locationName: locationName,
          locationType: locationType,
        );
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('素材を選択'),
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
                    // 撮影画像サムネイル + 場所表示
                    _buildHeader(context, state),

                    const SizedBox(height: AppSpacing.lg),

                    // 説明テキスト
                    Text(
                      '素材を選んでください',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    const SizedBox(height: AppSpacing.lg),

                    // 選択グリッド
                    _buildSelectionGrid(state, viewModel),

                    const SizedBox(height: AppSpacing.md),

                    // ヒントテキスト
                    _buildHintText(context),
                  ],
                ),
              ),
            ),

            // 診断ボタン
            _buildDiagnoseButton(context, state, viewModel),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, SelectMaterialState state) {
    return Row(
      children: [
        // サムネイル
        Container(
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
                    return const Icon(
                      Icons.image,
                      color: AppColors.textDisabled,
                    );
                  },
                )
              : const Icon(Icons.image, color: AppColors.textDisabled),
        ),

        const SizedBox(width: AppSpacing.md),

        // 場所情報
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '場所',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                if (locationType != null) ...[
                  Text(
                    locationType!.emoji,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  locationName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectionGrid(
    SelectMaterialState state,
    SelectMaterialViewModel viewModel,
  ) {
    final items = state.availableMaterials.map((material) {
      return SelectionChipItem(
        label: material.label,
        value: material,
      );
    }).toList();

    return SelectionChipGrid(
      items: items,
      selectedIndex: state.selectedIndex,
      onSelected: viewModel.selectMaterial,
      crossAxisCount: 2,
      chipSize: SelectionChipSize.large,
    );
  }

  Widget _buildHintText(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.info.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            Icons.lightbulb_outline,
            size: 20,
            color: AppColors.info,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              '素材がわからない場合は「その他」を選んでください',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.info,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiagnoseButton(
    BuildContext context,
    SelectMaterialState state,
    SelectMaterialViewModel viewModel,
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
        label: '診断する',
        onPressed: state.isReadyToDiagnose
            ? () {
                // 診断中画面へ遷移
                context.go(
                  AppRoutes.diagnosing,
                  extra: {
                    'imagePath': state.imagePath,
                    'location': state.locationName,
                    'material': viewModel.selectedMaterialName,
                  },
                );
              }
            : null,
        isExpanded: true,
      ),
    );
  }
}

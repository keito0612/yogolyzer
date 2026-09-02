import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../select_location/select_location_view_model.dart';

part 'select_material_view_model.freezed.dart';

/// 素材の種類
enum MaterialType {
  // キッチン
  tile('タイル'),
  paintedWall('塗装壁'),
  wallpaper('壁紙'),
  stainless('ステンレス'),
  artificialMarble('人工大理石'),

  // 浴室
  resinPanel('樹脂パネル'),
  rubberPacking('ゴムパッキン'),
  mirror('鏡'),

  // トイレ
  toilet('便器（陶器）'),

  // リビング・寝室
  flooring('フローリング'),
  carpet('カーペット'),

  // 玄関・ベランダ
  concrete('コンクリート'),
  resin('樹脂'),

  // その他
  other('その他');

  const MaterialType(this.label);

  final String label;
}

/// 場所ごとの素材マッピング
class MaterialMapping {
  MaterialMapping._();

  static List<MaterialType> getMaterialsForLocation(LocationType? locationType) {
    if (locationType == null) {
      return MaterialType.values;
    }

    switch (locationType) {
      case LocationType.kitchen:
        return [
          MaterialType.tile,
          MaterialType.paintedWall,
          MaterialType.wallpaper,
          MaterialType.stainless,
          MaterialType.artificialMarble,
          MaterialType.other,
        ];
      case LocationType.bathroom:
        return [
          MaterialType.tile,
          MaterialType.resinPanel,
          MaterialType.rubberPacking,
          MaterialType.mirror,
          MaterialType.stainless,
          MaterialType.other,
        ];
      case LocationType.toilet:
        return [
          MaterialType.tile,
          MaterialType.wallpaper,
          MaterialType.paintedWall,
          MaterialType.toilet,
          MaterialType.other,
        ];
      case LocationType.livingRoom:
      case LocationType.bedroom:
        return [
          MaterialType.wallpaper,
          MaterialType.paintedWall,
          MaterialType.flooring,
          MaterialType.carpet,
          MaterialType.other,
        ];
      case LocationType.entrance:
        return [
          MaterialType.tile,
          MaterialType.concrete,
          MaterialType.paintedWall,
          MaterialType.other,
        ];
      case LocationType.balcony:
        return [
          MaterialType.concrete,
          MaterialType.tile,
          MaterialType.resin,
          MaterialType.other,
        ];
      case LocationType.other:
        // 「その他」の場所の場合は全素材を表示
        return [
          MaterialType.tile,
          MaterialType.paintedWall,
          MaterialType.wallpaper,
          MaterialType.stainless,
          MaterialType.flooring,
          MaterialType.concrete,
          MaterialType.other,
        ];
    }
  }
}

/// 素材選択画面の状態
@freezed
sealed class SelectMaterialState with _$SelectMaterialState {
  const factory SelectMaterialState({
    /// 撮影した画像のパス
    required String imagePath,

    /// 選択された場所名
    required String locationName,

    /// 選択された場所タイプ
    LocationType? locationType,

    /// 利用可能な素材リスト
    @Default([]) List<MaterialType> availableMaterials,

    /// 選択された素材のインデックス（-1で未選択）
    @Default(-1) int selectedIndex,

    /// 診断ボタンが有効か
    @Default(false) bool isReadyToDiagnose,
  }) = _SelectMaterialState;
}

/// 素材選択画面のViewModel
class SelectMaterialViewModel extends Notifier<SelectMaterialState> {
  @override
  SelectMaterialState build() {
    return const SelectMaterialState(
      imagePath: '',
      locationName: '',
    );
  }

  /// 初期データを設定
  void initialize({
    required String imagePath,
    required String locationName,
    LocationType? locationType,
  }) {
    final materials = MaterialMapping.getMaterialsForLocation(locationType);

    state = SelectMaterialState(
      imagePath: imagePath,
      locationName: locationName,
      locationType: locationType,
      availableMaterials: materials,
    );
  }

  /// 素材を選択
  void selectMaterial(int index) {
    state = state.copyWith(
      selectedIndex: index,
      isReadyToDiagnose: index >= 0,
    );
  }

  /// 選択された素材名を取得
  String? get selectedMaterialName {
    if (state.selectedIndex < 0 ||
        state.selectedIndex >= state.availableMaterials.length) {
      return null;
    }
    return state.availableMaterials[state.selectedIndex].label;
  }

  /// 選択された素材タイプを取得
  MaterialType? get selectedMaterialType {
    if (state.selectedIndex < 0 ||
        state.selectedIndex >= state.availableMaterials.length) {
      return null;
    }
    return state.availableMaterials[state.selectedIndex];
  }
}

/// SelectMaterialViewModelのプロバイダー
final selectMaterialViewModelProvider =
    NotifierProvider.autoDispose<SelectMaterialViewModel, SelectMaterialState>(
  SelectMaterialViewModel.new,
);

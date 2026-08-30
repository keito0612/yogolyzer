import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yogolyzer/presentation/view_models/select_location/select_location_view_model.dart';
import 'package:yogolyzer/presentation/view_models/select_material/select_material_view_model.dart';

void main() {
  group('MaterialType', () {
    test('すべての素材タイプが正しいラベルを持つこと', () {
      // Assert
      expect(MaterialType.tile.label, equals('タイル'));
      expect(MaterialType.paintedWall.label, equals('塗装壁'));
      expect(MaterialType.wallpaper.label, equals('壁紙'));
      expect(MaterialType.stainless.label, equals('ステンレス'));
      expect(MaterialType.artificialMarble.label, equals('人工大理石'));
      expect(MaterialType.resinPanel.label, equals('樹脂パネル'));
      expect(MaterialType.rubberPacking.label, equals('ゴムパッキン'));
      expect(MaterialType.mirror.label, equals('鏡'));
      expect(MaterialType.toilet.label, equals('便器（陶器）'));
      expect(MaterialType.flooring.label, equals('フローリング'));
      expect(MaterialType.carpet.label, equals('カーペット'));
      expect(MaterialType.concrete.label, equals('コンクリート'));
      expect(MaterialType.resin.label, equals('樹脂'));
      expect(MaterialType.other.label, equals('その他'));
    });

    test('素材タイプが14種類あること', () {
      expect(MaterialType.values.length, equals(14));
    });
  });

  group('MaterialMapping', () {
    test('キッチンの素材リストが正しいこと', () {
      // Act
      final materials =
          MaterialMapping.getMaterialsForLocation(LocationType.kitchen);

      // Assert
      expect(materials, contains(MaterialType.tile));
      expect(materials, contains(MaterialType.paintedWall));
      expect(materials, contains(MaterialType.wallpaper));
      expect(materials, contains(MaterialType.stainless));
      expect(materials, contains(MaterialType.artificialMarble));
      expect(materials, contains(MaterialType.other));
      expect(materials.length, equals(6));
    });

    test('浴室の素材リストが正しいこと', () {
      // Act
      final materials =
          MaterialMapping.getMaterialsForLocation(LocationType.bathroom);

      // Assert
      expect(materials, contains(MaterialType.tile));
      expect(materials, contains(MaterialType.resinPanel));
      expect(materials, contains(MaterialType.rubberPacking));
      expect(materials, contains(MaterialType.mirror));
      expect(materials, contains(MaterialType.stainless));
      expect(materials, contains(MaterialType.other));
      expect(materials.length, equals(6));
    });

    test('トイレの素材リストが正しいこと', () {
      // Act
      final materials =
          MaterialMapping.getMaterialsForLocation(LocationType.toilet);

      // Assert
      expect(materials, contains(MaterialType.tile));
      expect(materials, contains(MaterialType.wallpaper));
      expect(materials, contains(MaterialType.paintedWall));
      expect(materials, contains(MaterialType.toilet));
      expect(materials, contains(MaterialType.other));
      expect(materials.length, equals(5));
    });

    test('リビングの素材リストが正しいこと', () {
      // Act
      final materials =
          MaterialMapping.getMaterialsForLocation(LocationType.livingRoom);

      // Assert
      expect(materials, contains(MaterialType.wallpaper));
      expect(materials, contains(MaterialType.paintedWall));
      expect(materials, contains(MaterialType.flooring));
      expect(materials, contains(MaterialType.carpet));
      expect(materials, contains(MaterialType.other));
      expect(materials.length, equals(5));
    });

    test('寝室の素材リストがリビングと同じであること', () {
      // Act
      final livingRoomMaterials =
          MaterialMapping.getMaterialsForLocation(LocationType.livingRoom);
      final bedroomMaterials =
          MaterialMapping.getMaterialsForLocation(LocationType.bedroom);

      // Assert
      expect(bedroomMaterials, equals(livingRoomMaterials));
    });

    test('玄関の素材リストが正しいこと', () {
      // Act
      final materials =
          MaterialMapping.getMaterialsForLocation(LocationType.entrance);

      // Assert
      expect(materials, contains(MaterialType.tile));
      expect(materials, contains(MaterialType.concrete));
      expect(materials, contains(MaterialType.paintedWall));
      expect(materials, contains(MaterialType.other));
      expect(materials.length, equals(4));
    });

    test('ベランダの素材リストが正しいこと', () {
      // Act
      final materials =
          MaterialMapping.getMaterialsForLocation(LocationType.balcony);

      // Assert
      expect(materials, contains(MaterialType.concrete));
      expect(materials, contains(MaterialType.tile));
      expect(materials, contains(MaterialType.resin));
      expect(materials, contains(MaterialType.other));
      expect(materials.length, equals(4));
    });

    test('「その他」の場所では汎用素材リストが返ること', () {
      // Act
      final materials =
          MaterialMapping.getMaterialsForLocation(LocationType.other);

      // Assert
      expect(materials, contains(MaterialType.tile));
      expect(materials, contains(MaterialType.paintedWall));
      expect(materials, contains(MaterialType.wallpaper));
      expect(materials, contains(MaterialType.other));
      expect(materials.length, equals(7));
    });

    test('nullの場合は全素材が返ること', () {
      // Act
      final materials = MaterialMapping.getMaterialsForLocation(null);

      // Assert
      expect(materials.length, equals(MaterialType.values.length));
    });
  });

  group('SelectMaterialState', () {
    test('デフォルト値が正しく設定されること', () {
      // Arrange & Act
      const state = SelectMaterialState(
        imagePath: '/path/to/image.jpg',
        locationName: 'キッチン',
      );

      // Assert
      expect(state.imagePath, equals('/path/to/image.jpg'));
      expect(state.locationName, equals('キッチン'));
      expect(state.locationType, isNull);
      expect(state.availableMaterials, isEmpty);
      expect(state.selectedIndex, equals(-1));
      expect(state.isReadyToDiagnose, isFalse);
    });

    test('copyWithで一部のプロパティを変更できること', () {
      // Arrange
      const state = SelectMaterialState(
        imagePath: '/path/to/image.jpg',
        locationName: 'キッチン',
      );

      // Act
      final newState = state.copyWith(selectedIndex: 0);

      // Assert
      expect(newState.imagePath, equals('/path/to/image.jpg'));
      expect(newState.selectedIndex, equals(0));
    });
  });

  group('SelectMaterialViewModel', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('初期状態が正しいこと', () {
      // Arrange & Act
      final state = container.read(selectMaterialViewModelProvider);

      // Assert
      expect(state.imagePath, isEmpty);
      expect(state.locationName, isEmpty);
      expect(state.selectedIndex, equals(-1));
      expect(state.isReadyToDiagnose, isFalse);
    });

    test('initializeで正しく初期化されること', () {
      // Arrange
      final viewModel =
          container.read(selectMaterialViewModelProvider.notifier);

      // Act
      viewModel.initialize(
        imagePath: '/test/image.jpg',
        locationName: 'キッチン',
        locationType: LocationType.kitchen,
      );

      // Assert
      final state = container.read(selectMaterialViewModelProvider);
      expect(state.imagePath, equals('/test/image.jpg'));
      expect(state.locationName, equals('キッチン'));
      expect(state.locationType, equals(LocationType.kitchen));
      expect(state.availableMaterials.length, equals(6));
    });

    test('素材を選択するとselectedIndexが更新されること', () {
      // Arrange
      final viewModel =
          container.read(selectMaterialViewModelProvider.notifier);
      viewModel.initialize(
        imagePath: '/test/image.jpg',
        locationName: 'キッチン',
        locationType: LocationType.kitchen,
      );

      // Act
      viewModel.selectMaterial(0);

      // Assert
      final state = container.read(selectMaterialViewModelProvider);
      expect(state.selectedIndex, equals(0));
      expect(state.isReadyToDiagnose, isTrue);
    });

    test('selectedMaterialNameが正しく取得できること', () {
      // Arrange
      final viewModel =
          container.read(selectMaterialViewModelProvider.notifier);
      viewModel.initialize(
        imagePath: '/test/image.jpg',
        locationName: '浴室',
        locationType: LocationType.bathroom,
      );

      // Act
      viewModel.selectMaterial(1); // 樹脂パネル

      // Assert
      expect(viewModel.selectedMaterialName, equals('樹脂パネル'));
    });

    test('未選択時にselectedMaterialNameがnullを返すこと', () {
      // Arrange
      final viewModel =
          container.read(selectMaterialViewModelProvider.notifier);

      // Assert
      expect(viewModel.selectedMaterialName, isNull);
    });

    test('selectedMaterialTypeが正しく取得できること', () {
      // Arrange
      final viewModel =
          container.read(selectMaterialViewModelProvider.notifier);
      viewModel.initialize(
        imagePath: '/test/image.jpg',
        locationName: 'トイレ',
        locationType: LocationType.toilet,
      );

      // Act
      viewModel.selectMaterial(3); // 便器（陶器）

      // Assert
      expect(viewModel.selectedMaterialType, equals(MaterialType.toilet));
    });

    test('未選択時にselectedMaterialTypeがnullを返すこと', () {
      // Arrange
      final viewModel =
          container.read(selectMaterialViewModelProvider.notifier);

      // Assert
      expect(viewModel.selectedMaterialType, isNull);
    });

    test('範囲外のインデックスでselectedMaterialNameがnullを返すこと', () {
      // Arrange
      final viewModel =
          container.read(selectMaterialViewModelProvider.notifier);
      viewModel.initialize(
        imagePath: '/test/image.jpg',
        locationName: 'キッチン',
        locationType: LocationType.kitchen,
      );

      // Act
      viewModel.selectMaterial(100);

      // Assert
      expect(viewModel.selectedMaterialName, isNull);
    });

    test('場所タイプがnullでも初期化できること', () {
      // Arrange
      final viewModel =
          container.read(selectMaterialViewModelProvider.notifier);

      // Act
      viewModel.initialize(
        imagePath: '/test/image.jpg',
        locationName: 'カスタム場所',
        locationType: null,
      );

      // Assert
      final state = container.read(selectMaterialViewModelProvider);
      expect(state.locationName, equals('カスタム場所'));
      expect(state.availableMaterials.length, equals(14)); // 全素材
    });
  });
}

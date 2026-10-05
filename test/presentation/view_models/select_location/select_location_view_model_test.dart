import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yogolyzer/presentation/view_models/select_location/select_location_view_model.dart';

void main() {
  group('LocationType', () {
    test('すべての場所タイプが正しいラベルとアイコンを持つこと', () {
      // Assert
      expect(LocationType.kitchen.label, equals('キッチン'));
      expect(LocationType.kitchen.emoji, equals('🍳'));

      expect(LocationType.bathroom.label, equals('浴室'));
      expect(LocationType.bathroom.emoji, equals('🛁'));

      expect(LocationType.toilet.label, equals('トイレ'));
      expect(LocationType.toilet.emoji, equals('🚽'));

      expect(LocationType.livingRoom.label, equals('リビング'));
      expect(LocationType.livingRoom.emoji, equals('🛋️'));

      expect(LocationType.bedroom.label, equals('寝室'));
      expect(LocationType.bedroom.emoji, equals('🛏️'));

      expect(LocationType.entrance.label, equals('玄関'));
      expect(LocationType.entrance.emoji, equals('🚪'));

      expect(LocationType.balcony.label, equals('ベランダ'));
      expect(LocationType.balcony.emoji, equals('🏠'));

      expect(LocationType.other.label, equals('その他'));
      expect(LocationType.other.emoji, equals('✏️'));
    });

    test('場所タイプが8種類あること', () {
      expect(LocationType.values.length, equals(8));
    });
  });

  group('SelectLocationState', () {
    test('デフォルト値が正しく設定されること', () {
      // Arrange & Act
      const state = SelectLocationState(imagePath: '/path/to/image.jpg');

      // Assert
      expect(state.imagePath, equals('/path/to/image.jpg'));
      expect(state.selectedIndex, equals(-1));
      expect(state.customLocationText, isEmpty);
      expect(state.isReadyToNext, isFalse);
    });

    test('copyWithで一部のプロパティを変更できること', () {
      // Arrange
      const state = SelectLocationState(imagePath: '/path/to/image.jpg');

      // Act
      final newState = state.copyWith(selectedIndex: 0);

      // Assert
      expect(newState.imagePath, equals('/path/to/image.jpg'));
      expect(newState.selectedIndex, equals(0));
      expect(newState.customLocationText, isEmpty);
      expect(newState.isReadyToNext, isFalse);
    });

    test('copyWithで複数のプロパティを同時に変更できること', () {
      // Arrange
      const state = SelectLocationState(imagePath: '/path/to/image.jpg');

      // Act
      final newState = state.copyWith(
        selectedIndex: 7,
        customLocationText: '階段',
        isReadyToNext: true,
      );

      // Assert
      expect(newState.selectedIndex, equals(7));
      expect(newState.customLocationText, equals('階段'));
      expect(newState.isReadyToNext, isTrue);
    });
  });

  group('SelectLocationViewModel', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('初期状態が正しいこと', () {
      // Arrange & Act
      final state = container.read(selectLocationViewModelProvider);

      // Assert
      expect(state.imagePath, isEmpty);
      expect(state.selectedIndex, equals(-1));
      expect(state.customLocationText, isEmpty);
      expect(state.isReadyToNext, isFalse);
    });

    test('setImagePathで画像パスが設定されること', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);

      // Act
      viewModel.setImagePath('/test/image.jpg');

      // Assert
      final state = container.read(selectLocationViewModelProvider);
      expect(state.imagePath, equals('/test/image.jpg'));
    });

    test('場所を選択するとselectedIndexが更新されること', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);

      // Act
      viewModel.selectLocation(0); // キッチン

      // Assert
      final state = container.read(selectLocationViewModelProvider);
      expect(state.selectedIndex, equals(0));
      expect(state.isReadyToNext, isTrue);
    });

    test('キッチンを選択するとisReadyToNextがtrueになること', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);

      // Act
      viewModel.selectLocation(LocationType.kitchen.index);

      // Assert
      final state = container.read(selectLocationViewModelProvider);
      expect(state.isReadyToNext, isTrue);
    });

    test('「その他」を選択するとisReadyToNextがfalseのままになること', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);

      // Act
      viewModel.selectLocation(LocationType.other.index);

      // Assert
      final state = container.read(selectLocationViewModelProvider);
      expect(state.selectedIndex, equals(LocationType.other.index));
      expect(state.isReadyToNext, isFalse);
    });

    test('「その他」選択後にテキストを入力するとisReadyToNextがtrueになること', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);

      // Act
      viewModel.selectLocation(LocationType.other.index);
      viewModel.setCustomLocationText('階段');

      // Assert
      final state = container.read(selectLocationViewModelProvider);
      expect(state.customLocationText, equals('階段'));
      expect(state.isReadyToNext, isTrue);
    });

    test('「その他」から他の場所に変更してもカスタムテキストが保持されること', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);
      viewModel.selectLocation(LocationType.other.index);
      viewModel.setCustomLocationText('階段');

      // Act
      viewModel.selectLocation(LocationType.kitchen.index);

      // Assert
      final state = container.read(selectLocationViewModelProvider);
      expect(state.selectedIndex, equals(LocationType.kitchen.index));
      expect(state.customLocationText, equals('階段')); // テキストは保持される
      expect(state.isReadyToNext, isTrue);
    });

    test('「その他」に戻るとカスタムテキストが復元されてisReadyToNextがtrueになること', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);
      viewModel.selectLocation(LocationType.other.index);
      viewModel.setCustomLocationText('階段');
      viewModel.selectLocation(LocationType.kitchen.index);

      // Act
      viewModel.selectLocation(LocationType.other.index);

      // Assert
      final state = container.read(selectLocationViewModelProvider);
      expect(state.selectedIndex, equals(LocationType.other.index));
      expect(state.customLocationText, equals('階段')); // テキストは保持されている
      expect(state.isReadyToNext, isTrue); // テキストがあるのでtrue
    });

    test('selectedLocationNameが正しく取得できること - 通常の場所', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);

      // Act
      viewModel.selectLocation(LocationType.bathroom.index);

      // Assert
      expect(viewModel.selectedLocationName, equals('浴室'));
    });

    test('selectedLocationNameが正しく取得できること - その他', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);

      // Act
      viewModel.selectLocation(LocationType.other.index);
      viewModel.setCustomLocationText('ガレージ');

      // Assert
      expect(viewModel.selectedLocationName, equals('ガレージ'));
    });

    test('未選択時にselectedLocationNameがnullを返すこと', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);

      // Assert
      expect(viewModel.selectedLocationName, isNull);
    });

    test('selectedLocationTypeが正しく取得できること', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);

      // Act
      viewModel.selectLocation(LocationType.toilet.index);

      // Assert
      expect(viewModel.selectedLocationType, equals(LocationType.toilet));
    });

    test('未選択時にselectedLocationTypeがnullを返すこと', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);

      // Assert
      expect(viewModel.selectedLocationType, isNull);
    });

    test('「その他」でテキスト未入力時にselectedLocationNameがnullを返すこと', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);

      // Act
      viewModel.selectLocation(LocationType.other.index);

      // Assert
      expect(viewModel.selectedLocationName, isNull);
    });

    test('空文字を設定するとisReadyToNextがfalseになること', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);
      viewModel.selectLocation(LocationType.other.index);
      viewModel.setCustomLocationText('階段');

      // Act
      viewModel.setCustomLocationText('');

      // Assert
      final state = container.read(selectLocationViewModelProvider);
      expect(state.isReadyToNext, isFalse);
    });

    test('1文字のテキストを設定するとバリデーションエラーになること', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);
      viewModel.selectLocation(LocationType.other.index);

      // Act
      viewModel.setCustomLocationText('あ');

      // Assert
      final state = container.read(selectLocationViewModelProvider);
      expect(state.validationError, isNotNull);
      expect(state.isReadyToNext, isFalse);
    });

    test('2文字以上のテキストを設定するとバリデーションが成功すること', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);
      viewModel.selectLocation(LocationType.other.index);

      // Act
      viewModel.setCustomLocationText('階段');

      // Assert
      final state = container.read(selectLocationViewModelProvider);
      expect(state.validationError, isNull);
      expect(state.isReadyToNext, isTrue);
    });

    test('30文字を超えるテキストを設定するとバリデーションエラーになること', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);
      viewModel.selectLocation(LocationType.other.index);

      // Act - 31文字のテキスト
      viewModel.setCustomLocationText('あ' * 31);

      // Assert
      final state = container.read(selectLocationViewModelProvider);
      expect(state.validationError, isNotNull);
      expect(state.isReadyToNext, isFalse);
    });

    test('clearValidationErrorでエラーがクリアされること', () {
      // Arrange
      final viewModel =
          container.read(selectLocationViewModelProvider.notifier);
      viewModel.selectLocation(LocationType.other.index);
      viewModel.setCustomLocationText('あ'); // バリデーションエラー

      // Act
      viewModel.clearValidationError();

      // Assert
      final state = container.read(selectLocationViewModelProvider);
      expect(state.validationError, isNull);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:yogolyzer/presentation/view_models/camera/camera_view_model.dart';

void main() {
  group('CameraState', () {
    test('initializing状態が正しく作成されること', () {
      // Arrange & Act
      const state = CameraState.initializing();

      // Assert
      state.when(
        initializing: () {
          // 成功
        },
        ready: (controller, isFlashOn) => fail('initializingであるべき'),
        captured: (_) => fail('initializingであるべき'),
        error: (_) => fail('initializingであるべき'),
      );
    });

    test('captured状態がimagePathを保持すること', () {
      // Arrange
      const imagePath = '/path/to/image.jpg';

      // Act
      const state = CameraState.captured(imagePath: imagePath);

      // Assert
      state.when(
        initializing: () => fail('capturedであるべき'),
        ready: (controller, isFlashOn) => fail('capturedであるべき'),
        captured: (path) {
          expect(path, equals(imagePath));
        },
        error: (_) => fail('capturedであるべき'),
      );
    });

    test('error状態がmessageを保持すること', () {
      // Arrange
      const errorMessage = 'カメラの初期化に失敗しました';

      // Act
      const state = CameraState.error(message: errorMessage);

      // Assert
      state.when(
        initializing: () => fail('errorであるべき'),
        ready: (controller, isFlashOn) => fail('errorであるべき'),
        captured: (_) => fail('errorであるべき'),
        error: (message) {
          expect(message, equals(errorMessage));
        },
      );
    });

    test('maybeWhenで特定の状態のみ処理できること', () {
      // Arrange
      const state = CameraState.captured(imagePath: '/path/to/image.jpg');

      // Act
      final result = state.maybeWhen(
        captured: (path) => 'captured: $path',
        orElse: () => 'other',
      );

      // Assert
      expect(result, equals('captured: /path/to/image.jpg'));
    });

    test('maybeWhenで該当しない状態はorElseが呼ばれること', () {
      // Arrange
      const state = CameraState.initializing();

      // Act
      final result = state.maybeWhen(
        captured: (path) => 'captured: $path',
        orElse: () => 'other',
      );

      // Assert
      expect(result, equals('other'));
    });

    test('whenOrNullで該当する状態のみ処理されること', () {
      // Arrange
      const state = CameraState.error(message: 'エラー');
      var errorCalled = false;

      // Act
      state.whenOrNull(
        error: (message) {
          errorCalled = true;
        },
      );

      // Assert
      expect(errorCalled, isTrue);
    });

    test('whenOrNullで該当しない状態はnullが返ること', () {
      // Arrange
      const state = CameraState.initializing();

      // Act
      final result = state.whenOrNull(
        captured: (path) => 'captured',
      );

      // Assert
      expect(result, isNull);
    });
  });

  // 注意: CameraViewModelの実際のカメラ操作をテストするには
  // カメラのモックが必要です。ここでは状態のテストのみ行います。
  // 実機テストまたはintegration_testで完全なテストを行うことを推奨します。
}

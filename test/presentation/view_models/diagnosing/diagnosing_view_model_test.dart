import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:yogolyzer/presentation/view_models/diagnosing/diagnosing_view_model.dart';

void main() {
  group('DiagnosingState', () {
    test('diagnosing状態が正しく作成されること', () {
      // Arrange & Act
      const state = DiagnosingState.diagnosing(
        imagePath: '/path/to/image.jpg',
        location: 'キッチン',
        material: 'タイル',
      );

      // Assert
      state.when(
        diagnosing: (imagePath, location, material) {
          expect(imagePath, equals('/path/to/image.jpg'));
          expect(location, equals('キッチン'));
          expect(material, equals('タイル'));
        },
        completed: (_) => fail('diagnosingであるべき'),
        error: (_, __) => fail('diagnosingであるべき'),
      );
    });

    test('completed状態が正しく作成されること', () {
      // Arrange & Act
      const state = DiagnosingState.completed(diagnosisId: '12345');

      // Assert
      state.when(
        diagnosing: (a, b, c) => fail('completedであるべき'),
        completed: (diagnosisId) {
          expect(diagnosisId, equals('12345'));
        },
        error: (_, __) => fail('completedであるべき'),
      );
    });

    test('error状態が正しく作成されること', () {
      // Arrange & Act
      const state = DiagnosingState.error(message: 'エラーが発生しました');

      // Assert
      state.when(
        diagnosing: (a, b, c) => fail('errorであるべき'),
        completed: (_) => fail('errorであるべき'),
        error: (message, canRetry) {
          expect(message, equals('エラーが発生しました'));
          expect(canRetry, isTrue);
        },
      );
    });

    test('whenOrNullで特定の状態のみ処理できること', () {
      // Arrange
      const state = DiagnosingState.completed(diagnosisId: '12345');

      // Act
      final result = state.whenOrNull(
        completed: (id) => 'completed: $id',
      );

      // Assert
      expect(result, equals('completed: 12345'));
    });

    test('whenOrNullで該当しない状態はnullを返すこと', () {
      // Arrange
      const state = DiagnosingState.diagnosing(
        imagePath: '',
        location: '',
        material: '',
      );

      // Act
      final result = state.whenOrNull(
        completed: (id) => 'completed',
      );

      // Assert
      expect(result, isNull);
    });

    test('maybeWhenで該当しない状態はorElseが呼ばれること', () {
      // Arrange
      const state = DiagnosingState.error(message: 'エラー');

      // Act
      final result = state.maybeWhen(
        diagnosing: (a, b, c) => 'diagnosing',
        orElse: () => 'other',
      );

      // Assert
      expect(result, equals('other'));
    });
  });

  group('DiagnosingViewModel', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
      // プロバイダーをlistenしてautoDisposeを防ぐ
      container.listen(diagnosingViewModelProvider, (prev, next) {});
    });

    tearDown(() {
      container.dispose();
    });

    test('初期状態がdiagnosingであること', () {
      // Arrange & Act
      final state = container.read(diagnosingViewModelProvider);

      // Assert
      state.when(
        diagnosing: (imagePath, location, material) {
          expect(imagePath, isEmpty);
          expect(location, isEmpty);
          expect(material, isEmpty);
        },
        completed: (_) => fail('diagnosingであるべき'),
        error: (_, __) => fail('diagnosingであるべき'),
      );
    });

    test('startDiagnosisで診断が開始されること', () async {
      // Arrange
      final viewModel = container.read(diagnosingViewModelProvider.notifier);

      // Act - 診断開始（完了を待たない）
      final future = viewModel.startDiagnosis(
        imagePath: '/test/image.jpg',
        location: 'キッチン',
        material: 'タイル',
      );

      // Assert - 診断中状態になっている
      final state = container.read(diagnosingViewModelProvider);
      state.when(
        diagnosing: (imagePath, location, material) {
          expect(imagePath, equals('/test/image.jpg'));
          expect(location, equals('キッチン'));
          expect(material, equals('タイル'));
        },
        completed: (_) => fail('diagnosingであるべき'),
        error: (_, __) => fail('diagnosingであるべき'),
      );

      // クリーンアップ
      await future;
    });

    test('startDiagnosis完了後にcompleted状態になること', () async {
      // Arrange
      final viewModel = container.read(diagnosingViewModelProvider.notifier);

      // Act
      await viewModel.startDiagnosis(
        imagePath: '/test/image.jpg',
        location: 'キッチン',
        material: 'タイル',
      );

      // Assert
      final state = container.read(diagnosingViewModelProvider);
      state.when(
        diagnosing: (a, b, c) => fail('completedであるべき'),
        completed: (diagnosisId) {
          expect(diagnosisId, isNotEmpty);
        },
        error: (_, __) => fail('completedであるべき'),
      );
    });
  });
}

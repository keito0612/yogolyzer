import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yogolyzer/presentation/view_models/diagnosis_result/diagnosis_result_view_model.dart';

void main() {
  group('DiagnosisResult', () {
    test('should create with all required fields', () {
      // Arrange & Act
      final result = DiagnosisResult(
        id: 'test-id',
        imagePath: '/path/to/image.jpg',
        location: 'キッチン',
        material: 'タイル',
        stainType: '油汚れ',
        confidence: 0.85,
        recommendedDetergents: const [],
        diyRecipe: null,
        cleaningSteps: const [],
        cautions: const [],
        createdAt: DateTime(2026, 8, 31),
      );

      // Assert
      expect(result.id, 'test-id');
      expect(result.imagePath, '/path/to/image.jpg');
      expect(result.location, 'キッチン');
      expect(result.material, 'タイル');
      expect(result.stainType, '油汚れ');
      expect(result.confidence, 0.85);
    });

    test('should support copyWith', () {
      // Arrange
      final result = DiagnosisResult(
        id: 'test-id',
        imagePath: '/path/to/image.jpg',
        location: 'キッチン',
        material: 'タイル',
        stainType: '油汚れ',
        confidence: 0.85,
        recommendedDetergents: const [],
        diyRecipe: null,
        cleaningSteps: const [],
        cautions: const [],
        createdAt: DateTime(2026, 8, 31),
      );

      // Act
      final updated = result.copyWith(stainType: 'カビ');

      // Assert
      expect(updated.stainType, 'カビ');
      expect(updated.id, 'test-id'); // unchanged
    });
  });

  group('Detergent', () {
    test('should create with all required fields', () {
      // Arrange & Act
      const detergent = Detergent(
        name: 'カビキラー',
        brand: 'ジョンソン',
        reason: 'カビ除去に効果的',
      );

      // Assert
      expect(detergent.name, 'カビキラー');
      expect(detergent.brand, 'ジョンソン');
      expect(detergent.reason, 'カビ除去に効果的');
    });
  });

  group('DiyRecipe', () {
    test('should create with all required fields', () {
      // Arrange & Act
      const recipe = DiyRecipe(
        name: '重曹スプレー',
        ingredients: ['重曹 大さじ2', '水 200ml'],
        instructions: ['重曹を水に溶かす', 'スプレーボトルに入れる'],
        usage: '汚れに吹きかけて5分放置',
        cautions: ['目立たない場所でテスト'],
      );

      // Assert
      expect(recipe.name, '重曹スプレー');
      expect(recipe.ingredients.length, 2);
      expect(recipe.instructions.length, 2);
    });
  });

  group('DiagnosisResultState', () {
    test('loading state should be created correctly', () {
      // Arrange & Act
      const state = DiagnosisResultState.loading();

      // Assert
      expect(state, isA<DiagnosisResultStateLoading>());
    });

    test('loaded state should contain result and isSaved', () {
      // Arrange
      final result = DiagnosisResult(
        id: 'test-id',
        imagePath: '',
        location: 'キッチン',
        material: 'タイル',
        stainType: '油汚れ',
        confidence: 0.85,
        recommendedDetergents: const [],
        diyRecipe: null,
        cleaningSteps: const [],
        cautions: const [],
        createdAt: DateTime.now(),
      );

      // Act
      final state = DiagnosisResultState.loaded(
        result: result,
        isSaved: false,
      );

      // Assert
      expect(state, isA<DiagnosisResultStateLoaded>());
      final loadedState = state as DiagnosisResultStateLoaded;
      expect(loadedState.result.id, 'test-id');
      expect(loadedState.isSaved, false);
    });

    test('error state should contain message', () {
      // Arrange & Act
      const state = DiagnosisResultState.error(message: 'エラーが発生しました');

      // Assert
      expect(state, isA<DiagnosisResultStateError>());
      final errorState = state as DiagnosisResultStateError;
      expect(errorState.message, 'エラーが発生しました');
    });

    test('when should pattern match correctly', () {
      // Arrange
      const state = DiagnosisResultState.loading();

      // Act
      final result = state.when(
        loading: () => 'loading',
        loaded: (r, s) => 'loaded',
        error: (m) => 'error',
      );

      // Assert
      expect(result, 'loading');
    });
  });

  group('DiagnosisResultViewModel', () {
    late ProviderContainer container;
    late DiagnosisResultViewModel viewModel;

    setUp(() {
      container = ProviderContainer();
      // プロバイダーをlistenしてautoDisposeを防ぐ
      container.listen(diagnosisResultViewModelProvider, (prev, next) {});
      viewModel = container.read(diagnosisResultViewModelProvider.notifier);
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state should be loading', () {
      // Assert
      final state = container.read(diagnosisResultViewModelProvider);
      expect(state, isA<DiagnosisResultStateLoading>());
    });

    test('loadResult should transition to loaded state', () async {
      // Act
      await viewModel.loadResult('test-diagnosis-id');

      // Assert
      final state = container.read(diagnosisResultViewModelProvider);
      expect(state, isA<DiagnosisResultStateLoaded>());
    });

    test('loadResult should set correct diagnosis id', () async {
      // Arrange
      const diagnosisId = 'test-diagnosis-123';

      // Act
      await viewModel.loadResult(diagnosisId);

      // Assert
      final state = container.read(diagnosisResultViewModelProvider);
      final loadedState = state as DiagnosisResultStateLoaded;
      expect(loadedState.result.id, diagnosisId);
    });

    test('loadResult should set isSaved to false initially', () async {
      // Act
      await viewModel.loadResult('test-id');

      // Assert
      final state = container.read(diagnosisResultViewModelProvider);
      final loadedState = state as DiagnosisResultStateLoaded;
      expect(loadedState.isSaved, false);
    });

    test('saveResult should set isSaved to true', () async {
      // Arrange
      await viewModel.loadResult('test-id');

      // Act
      await viewModel.saveResult();

      // Assert
      final state = container.read(diagnosisResultViewModelProvider);
      final loadedState = state as DiagnosisResultStateLoaded;
      expect(loadedState.isSaved, true);
    });

    test('saveResult should do nothing when state is not loaded', () async {
      // State is loading initially

      // Act
      await viewModel.saveResult();

      // Assert - state should still be loading
      final state = container.read(diagnosisResultViewModelProvider);
      expect(state, isA<DiagnosisResultStateLoading>());
    });
  });

  group('DiagnosisResultViewModel.getConfidenceLevel', () {
    test('should return success for confidence >= 0.8', () {
      expect(DiagnosisResultViewModel.getConfidenceLevel(0.8), 'success');
      expect(DiagnosisResultViewModel.getConfidenceLevel(0.85), 'success');
      expect(DiagnosisResultViewModel.getConfidenceLevel(1.0), 'success');
    });

    test('should return warning for confidence >= 0.6 and < 0.8', () {
      expect(DiagnosisResultViewModel.getConfidenceLevel(0.6), 'warning');
      expect(DiagnosisResultViewModel.getConfidenceLevel(0.7), 'warning');
      expect(DiagnosisResultViewModel.getConfidenceLevel(0.79), 'warning');
    });

    test('should return error for confidence < 0.6', () {
      expect(DiagnosisResultViewModel.getConfidenceLevel(0.0), 'error');
      expect(DiagnosisResultViewModel.getConfidenceLevel(0.5), 'error');
      expect(DiagnosisResultViewModel.getConfidenceLevel(0.59), 'error');
    });
  });
}

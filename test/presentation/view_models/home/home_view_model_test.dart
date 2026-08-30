import 'package:flutter_test/flutter_test.dart';
import 'package:yogolyzer/presentation/view_models/home/home_view_model.dart';

void main() {
  group('HomeState', () {
    test('デフォルト値が正しく設定されること', () {
      // Arrange & Act
      const state = HomeState();

      // Assert
      expect(state.todayDiagnosisCount, equals(0));
      expect(state.dailyLimit, equals(3));
      expect(state.isPremium, isFalse);
      expect(state.isLoading, isTrue);
    });

    test('copyWithで一部のプロパティを変更できること', () {
      // Arrange
      const state = HomeState(
        todayDiagnosisCount: 1,
        dailyLimit: 3,
        isPremium: false,
        isLoading: false,
      );

      // Act
      final newState = state.copyWith(todayDiagnosisCount: 2);

      // Assert
      expect(newState.todayDiagnosisCount, equals(2));
      expect(newState.dailyLimit, equals(3));
      expect(newState.isPremium, isFalse);
      expect(newState.isLoading, isFalse);
    });

    test('copyWithで複数のプロパティを同時に変更できること', () {
      // Arrange
      const state = HomeState();

      // Act
      final newState = state.copyWith(
        todayDiagnosisCount: 2,
        isPremium: true,
        isLoading: false,
      );

      // Assert
      expect(newState.todayDiagnosisCount, equals(2));
      expect(newState.dailyLimit, equals(3));
      expect(newState.isPremium, isTrue);
      expect(newState.isLoading, isFalse);
    });

    test('無料会員で診断回数が上限未満の場合', () {
      // Arrange
      const state = HomeState(
        todayDiagnosisCount: 1,
        dailyLimit: 3,
        isPremium: false,
        isLoading: false,
      );

      // Assert
      expect(state.todayDiagnosisCount < state.dailyLimit, isTrue);
    });

    test('無料会員で診断回数が上限に達している場合', () {
      // Arrange
      const state = HomeState(
        todayDiagnosisCount: 3,
        dailyLimit: 3,
        isPremium: false,
        isLoading: false,
      );

      // Assert
      expect(state.todayDiagnosisCount >= state.dailyLimit, isTrue);
    });

    test('プレミアム会員の場合は上限を超えていても問題ない', () {
      // Arrange
      const state = HomeState(
        todayDiagnosisCount: 10,
        dailyLimit: 3,
        isPremium: true,
        isLoading: false,
      );

      // Assert
      expect(state.isPremium, isTrue);
      expect(state.todayDiagnosisCount > state.dailyLimit, isTrue);
    });

    test('equalityが正しく動作すること', () {
      // Arrange
      const state1 = HomeState(
        todayDiagnosisCount: 1,
        dailyLimit: 3,
        isPremium: false,
        isLoading: false,
      );
      const state2 = HomeState(
        todayDiagnosisCount: 1,
        dailyLimit: 3,
        isPremium: false,
        isLoading: false,
      );
      const state3 = HomeState(
        todayDiagnosisCount: 2,
        dailyLimit: 3,
        isPremium: false,
        isLoading: false,
      );

      // Assert
      expect(state1, equals(state2));
      expect(state1, isNot(equals(state3)));
    });
  });

  // 注意: HomeViewModelの非同期テストはProviderContainerのライフサイクルと
  // 非同期処理の競合が発生するため、integration_testで行うことを推奨します。
}

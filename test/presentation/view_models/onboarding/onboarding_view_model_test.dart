import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yogolyzer/presentation/view_models/onboarding/onboarding_view_model.dart';

void main() {
  group('OnboardingViewModel', () {
    late ProviderContainer container;

    setUp(() {
      // SharedPreferencesのモック設定
      SharedPreferences.setMockInitialValues({});
      container = ProviderContainer();
      // プロバイダーをlistenしてautoDisposeを防ぐ
      container.listen(onboardingViewModelProvider, (prev, next) {});
    });

    tearDown(() {
      container.dispose();
    });

    test('初期状態はcurrentPage=0のviewingであること', () {
      // Arrange & Act
      final state = container.read(onboardingViewModelProvider);

      // Assert
      state.when(
        viewing: (currentPage) {
          expect(currentPage, equals(0));
        },
        completed: () {
          fail('初期状態はviewingであるべき');
        },
      );
    });

    test('onPageChangedでページが変更されること', () {
      // Arrange
      final viewModel = container.read(onboardingViewModelProvider.notifier);

      // Act
      viewModel.onPageChanged(1);

      // Assert
      final state = container.read(onboardingViewModelProvider);
      state.when(
        viewing: (currentPage) {
          expect(currentPage, equals(1));
        },
        completed: () {
          fail('viewingであるべき');
        },
      );
    });

    test('nextPageで次のページに進むこと', () {
      // Arrange
      final viewModel = container.read(onboardingViewModelProvider.notifier);

      // Act
      viewModel.nextPage();

      // Assert
      final state = container.read(onboardingViewModelProvider);
      state.when(
        viewing: (currentPage) {
          expect(currentPage, equals(1));
        },
        completed: () {
          fail('viewingであるべき');
        },
      );
    });

    test('最後のページでnextPageを呼んでも進まないこと', () {
      // Arrange
      final viewModel = container.read(onboardingViewModelProvider.notifier);
      viewModel.onPageChanged(OnboardingViewModel.totalPages - 1);

      // Act
      viewModel.nextPage();

      // Assert
      final state = container.read(onboardingViewModelProvider);
      state.when(
        viewing: (currentPage) {
          expect(currentPage, equals(OnboardingViewModel.totalPages - 1));
        },
        completed: () {
          fail('viewingであるべき');
        },
      );
    });

    test('currentPageが正しく取得できること', () {
      // Arrange
      final viewModel = container.read(onboardingViewModelProvider.notifier);
      viewModel.onPageChanged(2);

      // Act & Assert
      expect(viewModel.currentPage, equals(2));
    });

    test('isLastPageが最後のページでtrueを返すこと', () {
      // Arrange
      final viewModel = container.read(onboardingViewModelProvider.notifier);

      // Act & Assert
      expect(viewModel.isLastPage, isFalse);

      viewModel.onPageChanged(OnboardingViewModel.totalPages - 1);
      expect(viewModel.isLastPage, isTrue);
    });

    test('completeで状態がcompletedに変わること', () async {
      // Arrange
      final viewModel = container.read(onboardingViewModelProvider.notifier);

      // Act
      await viewModel.complete();

      // Assert
      final state = container.read(onboardingViewModelProvider);
      state.when(
        viewing: (_) {
          fail('completedであるべき');
        },
        completed: () {
          // 成功
        },
      );
    });

    test('skipで状態がcompletedに変わること', () async {
      // Arrange
      final viewModel = container.read(onboardingViewModelProvider.notifier);

      // Act
      await viewModel.skip();

      // Assert
      final state = container.read(onboardingViewModelProvider);
      state.when(
        viewing: (_) {
          fail('completedであるべき');
        },
        completed: () {
          // 成功
        },
      );
    });

    test('completeでSharedPreferencesにフラグが保存されること', () async {
      // Arrange
      final viewModel = container.read(onboardingViewModelProvider.notifier);

      // Act
      await viewModel.complete();

      // Assert
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('hasCompletedOnboarding'), isTrue);
    });
  });

  group('OnboardingState', () {
    test('totalPagesが3であること', () {
      expect(OnboardingViewModel.totalPages, equals(3));
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yogolyzer/presentation/view_models/history/history_view_model.dart';

void main() {
  group('HistoryItem', () {
    test('should create with all required fields', () {
      // Arrange & Act
      final item = HistoryItem(
        id: 'test-id',
        imagePath: '/path/to/image.jpg',
        stainType: '油汚れ',
        location: 'キッチン',
        material: 'タイル',
        createdAt: DateTime(2026, 8, 31, 10, 30),
      );

      // Assert
      expect(item.id, 'test-id');
      expect(item.imagePath, '/path/to/image.jpg');
      expect(item.stainType, '油汚れ');
      expect(item.location, 'キッチン');
      expect(item.material, 'タイル');
      expect(item.createdAt, DateTime(2026, 8, 31, 10, 30));
    });

    test('should support copyWith', () {
      // Arrange
      final item = HistoryItem(
        id: 'test-id',
        imagePath: '/path/to/image.jpg',
        stainType: '油汚れ',
        location: 'キッチン',
        material: 'タイル',
        createdAt: DateTime(2026, 8, 31, 10, 30),
      );

      // Act
      final updated = item.copyWith(stainType: 'カビ');

      // Assert
      expect(updated.stainType, 'カビ');
      expect(updated.id, 'test-id'); // unchanged
    });
  });

  group('HistoryGroup', () {
    test('should create with label and items', () {
      // Arrange
      final items = [
        HistoryItem(
          id: '1',
          imagePath: '',
          stainType: '油汚れ',
          location: 'キッチン',
          material: 'タイル',
          createdAt: DateTime.now(),
        ),
      ];

      // Act
      final group = HistoryGroup(
        label: '今日',
        items: items,
      );

      // Assert
      expect(group.label, '今日');
      expect(group.items.length, 1);
    });
  });

  group('HistoryState', () {
    test('loading state should be created correctly', () {
      // Arrange & Act
      const state = HistoryState.loading();

      // Assert
      expect(state, isA<HistoryStateLoading>());
    });

    test('loaded state should contain groups', () {
      // Arrange
      final groups = [
        HistoryGroup(
          label: '今日',
          items: [
            HistoryItem(
              id: '1',
              imagePath: '',
              stainType: '油汚れ',
              location: 'キッチン',
              material: 'タイル',
              createdAt: DateTime.now(),
            ),
          ],
        ),
      ];

      // Act
      final state = HistoryState.loaded(groups: groups);

      // Assert
      expect(state, isA<HistoryStateLoaded>());
      final loadedState = state as HistoryStateLoaded;
      expect(loadedState.groups.length, 1);
      expect(loadedState.groups[0].label, '今日');
    });

    test('empty state should be created correctly', () {
      // Arrange & Act
      const state = HistoryState.empty();

      // Assert
      expect(state, isA<HistoryStateEmpty>());
    });

    test('error state should contain message', () {
      // Arrange & Act
      const state = HistoryState.error(message: 'エラーが発生しました');

      // Assert
      expect(state, isA<HistoryStateError>());
      final errorState = state as HistoryStateError;
      expect(errorState.message, 'エラーが発生しました');
    });

    test('when should pattern match correctly', () {
      // Arrange
      const state = HistoryState.loading();

      // Act
      final result = state.when(
        loading: () => 'loading',
        loaded: (g) => 'loaded',
        empty: () => 'empty',
        error: (m) => 'error',
      );

      // Assert
      expect(result, 'loading');
    });
  });

  group('HistoryViewModel', () {
    late ProviderContainer container;
    late HistoryViewModel viewModel;

    setUp(() {
      container = ProviderContainer();
      viewModel = container.read(historyViewModelProvider.notifier);
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state should be loading', () {
      // Assert
      final state = container.read(historyViewModelProvider);
      expect(state, isA<HistoryStateLoading>());
    });

    test('loadHistory should transition to loaded state', () async {
      // Act
      await viewModel.loadHistory();

      // Assert
      final state = container.read(historyViewModelProvider);
      expect(state, isA<HistoryStateLoaded>());
    });

    test('loaded state should have grouped items by date', () async {
      // Act
      await viewModel.loadHistory();

      // Assert
      final state = container.read(historyViewModelProvider);
      final loadedState = state as HistoryStateLoaded;

      // Mock data has items from "今日" and "昨日"
      expect(loadedState.groups.length, 2);
      expect(loadedState.groups[0].label, '今日');
      expect(loadedState.groups[1].label, '昨日');
    });

    test('today items should be sorted by time descending', () async {
      // Act
      await viewModel.loadHistory();

      // Assert
      final state = container.read(historyViewModelProvider);
      final loadedState = state as HistoryStateLoaded;
      final todayGroup = loadedState.groups[0];

      // Items should be sorted by createdAt descending
      for (int i = 0; i < todayGroup.items.length - 1; i++) {
        expect(
          todayGroup.items[i].createdAt.isAfter(todayGroup.items[i + 1].createdAt),
          true,
        );
      }
    });

    test('deleteHistory should remove item from state', () async {
      // Arrange
      await viewModel.loadHistory();
      final initialState =
          container.read(historyViewModelProvider) as HistoryStateLoaded;
      final initialTotalItems = initialState.groups
          .fold<int>(0, (sum, group) => sum + group.items.length);

      // Act
      final success = await viewModel.deleteHistory('1');

      // Assert
      expect(success, true);

      final state = container.read(historyViewModelProvider);
      final loadedState = state as HistoryStateLoaded;
      final totalItems = loadedState.groups
          .fold<int>(0, (sum, group) => sum + group.items.length);
      expect(totalItems, initialTotalItems - 1);
    });

    test('deleteHistory should return false when not in loaded state', () async {
      // Don't call loadHistory - state is still loading

      // Act
      final success = await viewModel.deleteHistory('1');

      // Assert
      expect(success, false);
    });

    test('reload should refresh the data', () async {
      // Arrange - load initial data
      await viewModel.loadHistory();

      // Act
      await viewModel.reload();

      // Assert
      final state = container.read(historyViewModelProvider);
      expect(state, isA<HistoryStateLoaded>());
    });
  });

  group('HistoryViewModel.formatTime', () {
    test('should format time with leading zeros', () {
      expect(
        HistoryViewModel.formatTime(DateTime(2026, 8, 31, 9, 5)),
        '09:05',
      );
    });

    test('should format afternoon time correctly', () {
      expect(
        HistoryViewModel.formatTime(DateTime(2026, 8, 31, 15, 30)),
        '15:30',
      );
    });

    test('should format midnight correctly', () {
      expect(
        HistoryViewModel.formatTime(DateTime(2026, 8, 31, 0, 0)),
        '00:00',
      );
    });
  });
}

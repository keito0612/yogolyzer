import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_view_model.freezed.dart';

/// 履歴アイテム
@freezed
abstract class HistoryItem with _$HistoryItem {
  const factory HistoryItem({
    required String id,
    required String imagePath,
    required String stainType,
    required String location,
    required String material,
    required DateTime createdAt,
  }) = _HistoryItem;
}

/// 日付グループ
@freezed
abstract class HistoryGroup with _$HistoryGroup {
  const factory HistoryGroup({
    required String label,
    required List<HistoryItem> items,
  }) = _HistoryGroup;
}

/// 履歴画面の状態
@freezed
sealed class HistoryState with _$HistoryState {
  /// 読み込み中
  const factory HistoryState.loading() = HistoryStateLoading;

  /// 読み込み完了
  const factory HistoryState.loaded({
    required List<HistoryGroup> groups,
  }) = HistoryStateLoaded;

  /// 空の状態
  const factory HistoryState.empty() = HistoryStateEmpty;

  /// エラー
  const factory HistoryState.error({
    required String message,
  }) = HistoryStateError;
}

/// 履歴画面のViewModel
class HistoryViewModel extends Notifier<HistoryState> {
  @override
  HistoryState build() {
    return const HistoryState.loading();
  }

  /// 履歴を読み込む
  Future<void> loadHistory() async {
    state = const HistoryState.loading();
    try {
      // TODO: 実際のDB呼び出しに置き換える
      await Future.delayed(const Duration(milliseconds: 300));

      // モックデータ
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final yesterday = today.subtract(const Duration(days: 1));

      final mockItems = [
        HistoryItem(
          id: '1',
          imagePath: '',
          stainType: '油汚れ + カビ',
          location: 'キッチン',
          material: 'タイル',
          createdAt: today.add(const Duration(hours: 10, minutes: 30)),
        ),
        HistoryItem(
          id: '2',
          imagePath: '',
          stainType: '水垢',
          location: '浴室',
          material: '鏡',
          createdAt: today.add(const Duration(hours: 9, minutes: 15)),
        ),
        HistoryItem(
          id: '3',
          imagePath: '',
          stainType: 'カビ',
          location: '浴室',
          material: 'ゴムパッキン',
          createdAt: yesterday.add(const Duration(hours: 15, minutes: 45)),
        ),
        HistoryItem(
          id: '4',
          imagePath: '',
          stainType: '黄ばみ',
          location: 'トイレ',
          material: '便器',
          createdAt: yesterday.add(const Duration(hours: 11, minutes: 20)),
        ),
      ];

      if (mockItems.isEmpty) {
        state = const HistoryState.empty();
        return;
      }

      final groups = _groupByDate(mockItems);
      state = HistoryState.loaded(groups: groups);
    } catch (e) {
      state = HistoryState.error(message: '履歴の読み込みに失敗しました: $e');
    }
  }

  /// 日付でグループ化
  List<HistoryGroup> _groupByDate(List<HistoryItem> items) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    final Map<String, List<HistoryItem>> grouped = {};

    for (final item in items) {
      final itemDate = DateTime(
        item.createdAt.year,
        item.createdAt.month,
        item.createdAt.day,
      );

      String label;
      if (itemDate == today) {
        label = '今日';
      } else if (itemDate == yesterday) {
        label = '昨日';
      } else {
        label = '${itemDate.month}/${itemDate.day}';
      }

      grouped.putIfAbsent(label, () => []).add(item);
    }

    // グループを日付順（新しい順）でソート
    final sortedKeys = grouped.keys.toList()
      ..sort((a, b) {
        // 「今日」「昨日」を優先
        if (a == '今日') return -1;
        if (b == '今日') return 1;
        if (a == '昨日') return -1;
        if (b == '昨日') return 1;
        // それ以外は日付の降順
        return b.compareTo(a);
      });

    return sortedKeys.map((label) {
      final groupItems = grouped[label]!
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return HistoryGroup(label: label, items: groupItems);
    }).toList();
  }

  /// 履歴を削除
  Future<bool> deleteHistory(String id) async {
    final currentState = state;
    if (currentState is! HistoryStateLoaded) return false;

    try {
      // TODO: 実際のDB削除処理に置き換える
      await Future.delayed(const Duration(milliseconds: 200));

      // ローカル状態を更新
      final updatedGroups = currentState.groups.map((group) {
        final updatedItems =
            group.items.where((item) => item.id != id).toList();
        return group.copyWith(items: updatedItems);
      }).where((group) => group.items.isNotEmpty).toList();

      if (updatedGroups.isEmpty) {
        state = const HistoryState.empty();
      } else {
        state = HistoryState.loaded(groups: updatedGroups);
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  /// 履歴をリロード
  Future<void> reload() async {
    await loadHistory();
  }

  /// 時刻をフォーマット
  static String formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

/// HistoryViewModelのプロバイダー
final historyViewModelProvider =
    NotifierProvider<HistoryViewModel, HistoryState>(
  HistoryViewModel.new,
);

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../diagnosis_result/diagnosis_result_view_model.dart';

part 'history_detail_view_model.freezed.dart';

/// 履歴詳細画面の状態
@freezed
sealed class HistoryDetailState with _$HistoryDetailState {
  /// 読み込み中
  const factory HistoryDetailState.loading() = HistoryDetailStateLoading;

  /// 読み込み完了
  const factory HistoryDetailState.loaded({
    required DiagnosisResult result,
  }) = HistoryDetailStateLoaded;

  /// 削除中
  const factory HistoryDetailState.deleting({
    required DiagnosisResult result,
  }) = HistoryDetailStateDeleting;

  /// 削除完了
  const factory HistoryDetailState.deleted() = HistoryDetailStateDeleted;

  /// エラー
  const factory HistoryDetailState.error({
    required String message,
  }) = HistoryDetailStateError;
}

/// 履歴詳細画面のViewModel
class HistoryDetailViewModel extends Notifier<HistoryDetailState> {
  @override
  HistoryDetailState build() {
    return const HistoryDetailState.loading();
  }

  /// 履歴詳細を読み込む
  Future<void> loadDetail(String historyId) async {
    state = const HistoryDetailState.loading();

    try {
      // TODO: 実際のDB呼び出しに置き換える
      await Future.delayed(const Duration(milliseconds: 300));

      if (!ref.mounted) return;

      // モックデータ
      final result = DiagnosisResult(
        id: historyId,
        imagePath: '',
        location: 'キッチン',
        material: 'タイル',
        stainType: '油汚れ + カビ',
        confidence: 0.85,
        recommendedDetergents: const [
          Detergent(
            name: 'カビキラー',
            brand: 'ジョンソン',
            reason: 'カビ除去に効果的',
          ),
          Detergent(
            name: 'マジックリン',
            brand: '花王',
            reason: '油汚れをしっかり落とす',
          ),
        ],
        diyRecipe: const DiyRecipe(
          name: '重曹スプレー',
          ingredients: [
            '重曹 大さじ2',
            '水 200ml',
            '食器用洗剤 数滴',
          ],
          instructions: [
            '重曹を水に溶かす',
            '食器用洗剤を加えて混ぜる',
            'スプレーボトルに入れる',
          ],
          usage: '汚れに吹きかけて5分放置後、柔らかい布で拭き取る',
          cautions: [
            '使用前に目立たない場所でテストしてください',
            '手荒れが気になる場合はゴム手袋を使用してください',
          ],
        ),
        cleaningSteps: const [
          'まずカビキラーでカビを除去',
          '5分放置後、水で洗い流す',
          'マジックリンを油汚れに吹きかける',
          '3分放置後、スポンジで擦る',
          '水拭きで仕上げる',
        ],
        cautions: const [
          '換気をしっかり行ってください',
          '塗装壁は色落ちの可能性があります',
          '目立たない場所でテストしてから使用してください',
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      );

      state = HistoryDetailState.loaded(result: result);
    } catch (e) {
      if (!ref.mounted) return;
      state = HistoryDetailState.error(message: '履歴の読み込みに失敗しました: $e');
    }
  }

  /// 履歴を削除
  Future<bool> deleteHistory() async {
    final currentState = state;
    if (currentState is! HistoryDetailStateLoaded) return false;

    state = HistoryDetailState.deleting(result: currentState.result);

    try {
      // TODO: 実際のDB削除処理に置き換える
      await Future.delayed(const Duration(milliseconds: 300));

      if (!ref.mounted) return false;

      state = const HistoryDetailState.deleted();
      return true;
    } catch (e) {
      if (!ref.mounted) return false;
      state = HistoryDetailState.loaded(result: currentState.result);
      return false;
    }
  }

  /// 日時をフォーマット
  static String formatDateTime(DateTime dateTime) {
    final year = dateTime.year;
    final month = dateTime.month.toString().padLeft(2, '0');
    final day = dateTime.day.toString().padLeft(2, '0');
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$year/$month/$day $hour:$minute';
  }
}

/// HistoryDetailViewModelのプロバイダー
final historyDetailViewModelProvider =
    NotifierProvider.autoDispose<HistoryDetailViewModel, HistoryDetailState>(
  HistoryDetailViewModel.new,
);

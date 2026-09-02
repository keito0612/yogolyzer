import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnosis_result_view_model.freezed.dart';

/// 洗剤情報
@freezed
abstract class Detergent with _$Detergent {
  const factory Detergent({
    required String name,
    required String brand,
    required String reason,
  }) = _Detergent;
}

/// 自作レシピ
@freezed
abstract class DiyRecipe with _$DiyRecipe {
  const factory DiyRecipe({
    required String name,
    required List<String> ingredients,
    required List<String> instructions,
    required String usage,
    required List<String> cautions,
  }) = _DiyRecipe;
}

/// 診断結果データ
@freezed
abstract class DiagnosisResult with _$DiagnosisResult {
  const factory DiagnosisResult({
    required String id,
    required String imagePath,
    required String location,
    required String material,
    required String stainType,
    required double confidence,
    required List<Detergent> recommendedDetergents,
    required DiyRecipe? diyRecipe,
    required List<String> cleaningSteps,
    required List<String> cautions,
    required DateTime createdAt,
  }) = _DiagnosisResult;
}

/// 診断結果画面の状態
@freezed
sealed class DiagnosisResultState with _$DiagnosisResultState {
  /// 読み込み中
  const factory DiagnosisResultState.loading() = DiagnosisResultStateLoading;

  /// 読み込み完了
  const factory DiagnosisResultState.loaded({
    required DiagnosisResult result,
    required bool isSaved,
  }) = DiagnosisResultStateLoaded;

  /// エラー
  const factory DiagnosisResultState.error({
    required String message,
  }) = DiagnosisResultStateError;
}

/// 診断結果画面のViewModel
class DiagnosisResultViewModel extends Notifier<DiagnosisResultState> {
  @override
  DiagnosisResultState build() {
    return const DiagnosisResultState.loading();
  }

  /// 診断結果を読み込む
  Future<void> loadResult(String diagnosisId) async {
    state = const DiagnosisResultState.loading();

    try {
      // TODO: 実際のAPI/DB呼び出しに置き換える
      // 現在はモック処理
      await Future.delayed(const Duration(milliseconds: 500));

      if (!ref.mounted) return;

      // モックの診断結果
      final result = DiagnosisResult(
        id: diagnosisId,
        imagePath: '', // 実際は保存された画像パス
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
        createdAt: DateTime.now(),
      );

      state = DiagnosisResultState.loaded(
        result: result,
        isSaved: false,
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = DiagnosisResultState.error(message: '診断結果の読み込みに失敗しました: $e');
    }
  }

  /// 診断結果を保存
  Future<void> saveResult() async {
    final currentState = state;
    if (currentState is! DiagnosisResultStateLoaded) return;

    try {
      // TODO: 実際のDB保存処理に置き換える
      await Future.delayed(const Duration(milliseconds: 300));

      if (!ref.mounted) return;

      state = currentState.copyWith(isSaved: true);
    } catch (e) {
      // エラー時は何もしない（UIでスナックバー表示など）
    }
  }

  /// 信頼度に基づく色を取得
  /// - 80%以上: success
  /// - 60-80%: warning
  /// - 60%未満: error
  static String getConfidenceLevel(double confidence) {
    if (confidence >= 0.8) {
      return 'success';
    } else if (confidence >= 0.6) {
      return 'warning';
    } else {
      return 'error';
    }
  }
}

/// DiagnosisResultViewModelのプロバイダー
final diagnosisResultViewModelProvider =
    NotifierProvider.autoDispose<DiagnosisResultViewModel, DiagnosisResultState>(
  DiagnosisResultViewModel.new,
);

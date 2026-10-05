import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../application/services/diagnosis_service.dart';
import '../../../domain/entities/diagnosis.dart' as domain;
import '../../../infrastructure/providers/service_providers.dart';

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
    @Default('') String usage,
    @Default([]) List<String> cautions,
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

  /// 削除中
  const factory DiagnosisResultState.deleting({
    required DiagnosisResult result,
  }) = DiagnosisResultStateDeleting;

  /// 削除完了
  const factory DiagnosisResultState.deleted() = DiagnosisResultStateDeleted;

  /// エラー
  const factory DiagnosisResultState.error({
    required String message,
  }) = DiagnosisResultStateError;
}

/// 診断結果画面のViewModel
class DiagnosisResultViewModel extends Notifier<DiagnosisResultState> {
  late final DiagnosisService _diagnosisService;
  domain.Diagnosis? _currentDiagnosis;

  @override
  DiagnosisResultState build() {
    _diagnosisService = ref.watch(diagnosisServiceProvider);
    return const DiagnosisResultState.loading();
  }

  /// 診断結果を読み込む
  Future<void> loadResult(String diagnosisId) async {
    state = const DiagnosisResultState.loading();

    try {
      final diagnosis = await _diagnosisService.getDiagnosis(diagnosisId);

      if (!ref.mounted) return;

      if (diagnosis == null) {
        state = const DiagnosisResultState.error(
          message: '診断結果が見つかりません',
        );
        return;
      }

      _currentDiagnosis = diagnosis;

      // ドメインエンティティをViewModelのモデルに変換
      final result = _mapToResult(diagnosis);

      state = DiagnosisResultState.loaded(
        result: result,
        isSaved: diagnosis.isSynced,
      );
    } catch (e) {
      if (!ref.mounted) return;
      state = DiagnosisResultState.error(message: '診断結果の読み込みに失敗しました: $e');
    }
  }

  /// ドメインエンティティをViewModelのモデルに変換
  DiagnosisResult _mapToResult(domain.Diagnosis diagnosis) {
    return DiagnosisResult(
      id: diagnosis.id,
      imagePath: diagnosis.imagePath,
      location: diagnosis.location,
      material: diagnosis.material,
      stainType: diagnosis.stainType,
      confidence: diagnosis.confidence,
      recommendedDetergents: diagnosis.recommendedDetergents
          .map((d) => Detergent(
                name: d.name,
                brand: d.brand,
                reason: d.reason,
              ))
          .toList(),
      diyRecipe: diagnosis.diyRecipe != null
          ? DiyRecipe(
              name: diagnosis.diyRecipe!.name,
              ingredients: diagnosis.diyRecipe!.ingredients,
              instructions: diagnosis.diyRecipe!.instructions,
              usage: diagnosis.diyRecipe!.usage,
              cautions: diagnosis.diyRecipe!.cautions,
            )
          : null,
      cleaningSteps: diagnosis.cleaningSteps,
      cautions: diagnosis.cautions,
      createdAt: diagnosis.createdAt,
    );
  }

  /// 診断結果を保存
  Future<void> saveResult() async {
    final currentState = state;
    if (currentState is! DiagnosisResultStateLoaded) return;
    if (_currentDiagnosis == null) return;

    try {
      // 既に保存済み（isSyncedがtrue）の場合は何もしない
      if (_currentDiagnosis!.isSynced) {
        state = currentState.copyWith(isSaved: true);
        return;
      }

      // TODO: クラウド同期が必要な場合は実装
      // 現時点ではローカル保存は診断時に完了しているため、
      // isSavedをtrueにするだけ

      if (!ref.mounted) return;

      state = currentState.copyWith(isSaved: true);
    } catch (e) {
      // エラー時は何もしない（UIでスナックバー表示など）
    }
  }

  /// 診断結果を削除
  Future<bool> deleteResult() async {
    final currentState = state;
    DiagnosisResult? result;
    if (currentState is DiagnosisResultStateLoaded) {
      result = currentState.result;
    } else {
      return false;
    }
    if (_currentDiagnosis == null) return false;

    state = DiagnosisResultState.deleting(result: result);

    try {
      await _diagnosisService.deleteDiagnosis(_currentDiagnosis!.id);

      if (!ref.mounted) return false;

      state = const DiagnosisResultState.deleted();
      return true;
    } catch (e) {
      if (!ref.mounted) return false;
      state = DiagnosisResultState.loaded(result: result, isSaved: true);
      return false;
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

/// DiagnosisResultViewModelのプロバイダー
final diagnosisResultViewModelProvider =
    NotifierProvider.autoDispose<DiagnosisResultViewModel, DiagnosisResultState>(
  DiagnosisResultViewModel.new,
);

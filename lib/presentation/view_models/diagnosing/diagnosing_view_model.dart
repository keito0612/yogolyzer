import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnosing_view_model.freezed.dart';

/// 診断中画面の状態
@freezed
sealed class DiagnosingState with _$DiagnosingState {
  /// 診断中
  const factory DiagnosingState.diagnosing({
    required String imagePath,
    required String location,
    required String material,
  }) = DiagnosingStateDiagnosing;

  /// 診断完了
  const factory DiagnosingState.completed({
    required String diagnosisId,
  }) = DiagnosingStateCompleted;

  /// エラー
  const factory DiagnosingState.error({
    required String message,
  }) = DiagnosingStateError;
}

/// 診断中画面のViewModel
class DiagnosingViewModel extends Notifier<DiagnosingState> {
  @override
  DiagnosingState build() {
    return const DiagnosingState.diagnosing(
      imagePath: '',
      location: '',
      material: '',
    );
  }

  /// 診断を開始
  Future<void> startDiagnosis({
    required String imagePath,
    required String location,
    required String material,
  }) async {
    state = DiagnosingState.diagnosing(
      imagePath: imagePath,
      location: location,
      material: material,
    );

    try {
      // TODO: 実際のAPI呼び出しに置き換える
      // 現在はモック処理（3秒待機）
      await Future.delayed(const Duration(seconds: 3));

      if (!ref.mounted) return;

      // モックの診断結果ID
      final diagnosisId = DateTime.now().millisecondsSinceEpoch.toString();

      state = DiagnosingState.completed(diagnosisId: diagnosisId);
    } catch (e) {
      if (!ref.mounted) return;
      state = DiagnosingState.error(message: '診断に失敗しました: $e');
    }
  }

  /// リトライ
  Future<void> retry() async {
    final currentState = state;
    if (currentState is DiagnosingStateDiagnosing) {
      await startDiagnosis(
        imagePath: currentState.imagePath,
        location: currentState.location,
        material: currentState.material,
      );
    }
  }
}

/// DiagnosingViewModelのプロバイダー
final diagnosingViewModelProvider =
    NotifierProvider.autoDispose<DiagnosingViewModel, DiagnosingState>(
  DiagnosingViewModel.new,
);

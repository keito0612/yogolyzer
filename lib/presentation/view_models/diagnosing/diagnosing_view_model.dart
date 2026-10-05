import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../application/services/diagnosis_service.dart';
import '../../../infrastructure/datasources/remote/api_exception.dart';
import '../../../infrastructure/providers/service_providers.dart';
import '../../../shared/utils/validators.dart';

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
    @Default(true) bool canRetry,
    @Default(false) bool isRateLimitExceeded,
  }) = DiagnosingStateError;
}

/// 診断中画面のViewModel
class DiagnosingViewModel extends Notifier<DiagnosingState> {
  late final DiagnosisService _diagnosisService;

  // リトライ用に保持
  String _lastImagePath = '';
  String _lastLocation = '';
  String _lastMaterial = '';

  @override
  DiagnosingState build() {
    _diagnosisService = ref.watch(diagnosisServiceProvider);
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
    // リトライ用に保持
    _lastImagePath = imagePath;
    _lastLocation = location;
    _lastMaterial = material;

    // バリデーション
    final validation = await Validators.validateDiagnosisRequest(
      imagePath: imagePath,
      location: location,
      material: material,
    );

    if (!validation.isValid) {
      state = DiagnosingState.error(
        message: validation.errorMessage ?? '入力内容に問題があります',
        canRetry: false,
      );
      return;
    }

    state = DiagnosingState.diagnosing(
      imagePath: imagePath,
      location: location,
      material: material,
    );

    try {
      final diagnosis = await _diagnosisService.analyze(
        imagePath: imagePath,
        location: location,
        material: material,
      );

      if (!ref.mounted) return;

      state = DiagnosingState.completed(diagnosisId: diagnosis.id);
    } on RateLimitException catch (e) {
      // レート制限: リトライ不可、プレミアムモーダル表示
      if (!ref.mounted) return;
      state = DiagnosingState.error(
        message: e.message,
        canRetry: false,
        isRateLimitExceeded: true,
      );
    } on ApiException catch (e) {
      // その他のAPI例外: メッセージ表示、リトライ可能
      if (!ref.mounted) return;
      state = DiagnosingState.error(
        message: e.message,
        canRetry: true,
      );
    } catch (e) {
      // 予期しないエラー
      if (!ref.mounted) return;
      state = DiagnosingState.error(
        message: '診断に失敗しました: $e',
        canRetry: true,
      );
    }
  }

  /// リトライ
  Future<void> retry() async {
    if (_lastImagePath.isEmpty) return;

    await startDiagnosis(
      imagePath: _lastImagePath,
      location: _lastLocation,
      material: _lastMaterial,
    );
  }
}

/// DiagnosingViewModelのプロバイダー
final diagnosingViewModelProvider =
    NotifierProvider.autoDispose<DiagnosingViewModel, DiagnosingState>(
  DiagnosingViewModel.new,
);

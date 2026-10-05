import '../../domain/entities/diagnosis.dart';
import '../../domain/repositories/i_diagnosis_repository.dart';
import '../../domain/repositories/i_settings_repository.dart';
import '../../infrastructure/datasources/remote/api_exception.dart';
import '../../infrastructure/datasources/remote/diagnosis_remote_data_source.dart';
import '../../shared/utils/validators.dart';

/// 診断サービス
class DiagnosisService {
  DiagnosisService({
    required DiagnosisRemoteDataSource diagnosisRemoteDataSource,
    required IDiagnosisRepository diagnosisRepository,
    required ISettingsRepository settingsRepository,
  })  : _diagnosisRemoteDataSource = diagnosisRemoteDataSource,
        _diagnosisRepository = diagnosisRepository,
        _settingsRepository = settingsRepository;

  final DiagnosisRemoteDataSource _diagnosisRemoteDataSource;
  final IDiagnosisRepository _diagnosisRepository;
  final ISettingsRepository _settingsRepository;

  /// AI診断を実行
  Future<Diagnosis> analyze({
    required String imagePath,
    required String location,
    required String material,
  }) async {
    // 入力バリデーション
    final validation = await Validators.validateDiagnosisRequest(
      imagePath: imagePath,
      location: location,
      material: material,
    );
    if (!validation.isValid) {
      throw ValidationException(validation.errorMessage ?? '入力内容に問題があります');
    }

    // レート制限チェック
    final canDiagnose = await _settingsRepository.canDiagnose();
    if (!canDiagnose) {
      throw const RateLimitException('本日の診断回数上限に達しました');
    }

    // デバイスIDを取得
    final deviceId = await _settingsRepository.getDeviceId();

    // API呼び出し（エラー時はカウントしない）
    final Diagnosis diagnosis;
    try {
      diagnosis = await _diagnosisRemoteDataSource.analyze(
        imagePath: imagePath,
        location: location,
        material: material,
        deviceId: deviceId,
      );
    } catch (e) {
      // API呼び出しでエラーが発生した場合はカウントせずに再throw
      rethrow;
    }

    // ローカルDBに保存
    await _diagnosisRepository.save(diagnosis);

    // 診断が成功した場合のみカウントをインクリメント
    await _settingsRepository.incrementDiagnosisCount();

    return diagnosis;
  }

  /// 診断履歴を取得
  Future<List<Diagnosis>> getHistory() async {
    return _diagnosisRepository.getAll();
  }

  /// 診断詳細を取得
  Future<Diagnosis?> getDiagnosis(String id) async {
    return _diagnosisRepository.getById(id);
  }

  /// 診断を削除
  Future<void> deleteDiagnosis(String id) async {
    await _diagnosisRepository.deleteById(id);
  }

  /// 今日の診断可能回数を取得
  Future<int> getRemainingDiagnosisCount() async {
    final isPremium = await _settingsRepository.isPremium();
    if (isPremium) return -1; // 無制限

    final count = await _settingsRepository.getDailyDiagnosisCount();
    const maxFreeCount = 3;
    return maxFreeCount - count;
  }

  /// プレミアム会員かどうか
  Future<bool> isPremium() async {
    return _settingsRepository.isPremium();
  }
}

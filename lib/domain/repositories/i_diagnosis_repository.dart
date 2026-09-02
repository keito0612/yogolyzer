import '../entities/diagnosis.dart';

/// 診断リポジトリのインターフェース
abstract interface class IDiagnosisRepository {
  /// 全件取得（新しい順）
  Future<List<Diagnosis>> getAll();

  /// IDで取得
  Future<Diagnosis?> getById(String id);

  /// 未同期のデータを取得
  Future<List<Diagnosis>> getUnsynced();

  /// 件数を取得
  Future<int> getCount();

  /// 保存
  Future<void> save(Diagnosis diagnosis);

  /// 同期済みに更新
  Future<void> markAsSynced(String id, String cloudId);

  /// 削除
  Future<void> deleteById(String id);

  /// 全削除
  Future<void> deleteAll();

  /// ストリームで監視
  Stream<List<Diagnosis>> watchAll();
}

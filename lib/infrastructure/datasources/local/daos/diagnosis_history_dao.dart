import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/diagnosis_history_table.dart';

part 'diagnosis_history_dao.g.dart';

/// 診断履歴DAO
@DriftAccessor(tables: [DiagnosisHistoryTable])
class DiagnosisHistoryDao extends DatabaseAccessor<AppDatabase>
    with _$DiagnosisHistoryDaoMixin {
  DiagnosisHistoryDao(super.db);

  /// 全件取得（新しい順）
  Future<List<DiagnosisHistoryTableData>> getAll() {
    return (select(diagnosisHistoryTable)
          ..orderBy([
            (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
          ]))
        .get();
  }

  /// IDで取得
  Future<DiagnosisHistoryTableData?> getById(String id) {
    return (select(diagnosisHistoryTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// 未同期のデータを取得
  Future<List<DiagnosisHistoryTableData>> getUnsynced() {
    return (select(diagnosisHistoryTable)..where((t) => t.isSynced.equals(false)))
        .get();
  }

  /// 件数を取得
  Future<int> getCount() async {
    final count = countAll();
    final query = selectOnly(diagnosisHistoryTable)..addColumns([count]);
    final result = await query.getSingle();
    return result.read(count) ?? 0;
  }

  /// 挿入
  Future<void> insert(DiagnosisHistoryTableCompanion entry) {
    return into(diagnosisHistoryTable).insert(entry);
  }

  /// 更新
  Future<bool> updateById(String id, DiagnosisHistoryTableCompanion entry) {
    return (update(diagnosisHistoryTable)..where((t) => t.id.equals(id)))
        .write(entry)
        .then((rows) => rows > 0);
  }

  /// 同期済みに更新
  Future<bool> markAsSynced(String id, String cloudId) {
    return updateById(
      id,
      DiagnosisHistoryTableCompanion(
        isSynced: const Value(true),
        cloudId: Value(cloudId),
      ),
    );
  }

  /// 削除
  Future<int> deleteById(String id) {
    return (delete(diagnosisHistoryTable)..where((t) => t.id.equals(id))).go();
  }

  /// 全削除
  Future<int> deleteAll() {
    return delete(diagnosisHistoryTable).go();
  }

  /// ストリームで監視
  Stream<List<DiagnosisHistoryTableData>> watchAll() {
    return (select(diagnosisHistoryTable)
          ..orderBy([
            (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
          ]))
        .watch();
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_history_dao.dart';

// ignore_for_file: type=lint
mixin _$DiagnosisHistoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $DiagnosisHistoryTableTable get diagnosisHistoryTable =>
      attachedDatabase.diagnosisHistoryTable;
  DiagnosisHistoryDaoManager get managers => DiagnosisHistoryDaoManager(this);
}

class DiagnosisHistoryDaoManager {
  final _$DiagnosisHistoryDaoMixin _db;
  DiagnosisHistoryDaoManager(this._db);
  $$DiagnosisHistoryTableTableTableManager get diagnosisHistoryTable =>
      $$DiagnosisHistoryTableTableTableManager(
        _db.attachedDatabase,
        _db.diagnosisHistoryTable,
      );
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DiagnosisHistoryTableTable extends DiagnosisHistoryTable
    with TableInfo<$DiagnosisHistoryTableTable, DiagnosisHistoryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiagnosisHistoryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cloudIdMeta = const VerificationMeta(
    'cloudId',
  );
  @override
  late final GeneratedColumn<String> cloudId = GeneratedColumn<String>(
    'cloud_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _materialMeta = const VerificationMeta(
    'material',
  );
  @override
  late final GeneratedColumn<String> material = GeneratedColumn<String>(
    'material',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stainTypeMeta = const VerificationMeta(
    'stainType',
  );
  @override
  late final GeneratedColumn<String> stainType = GeneratedColumn<String>(
    'stain_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _diagnosisResultMeta = const VerificationMeta(
    'diagnosisResult',
  );
  @override
  late final GeneratedColumn<String> diagnosisResult = GeneratedColumn<String>(
    'diagnosis_result',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    cloudId,
    imagePath,
    location,
    material,
    stainType,
    diagnosisResult,
    isSynced,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_diagnosis_history';
  @override
  VerificationContext validateIntegrity(
    Insertable<DiagnosisHistoryTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('cloud_id')) {
      context.handle(
        _cloudIdMeta,
        cloudId.isAcceptableOrUnknown(data['cloud_id']!, _cloudIdMeta),
      );
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('material')) {
      context.handle(
        _materialMeta,
        material.isAcceptableOrUnknown(data['material']!, _materialMeta),
      );
    } else if (isInserting) {
      context.missing(_materialMeta);
    }
    if (data.containsKey('stain_type')) {
      context.handle(
        _stainTypeMeta,
        stainType.isAcceptableOrUnknown(data['stain_type']!, _stainTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_stainTypeMeta);
    }
    if (data.containsKey('diagnosis_result')) {
      context.handle(
        _diagnosisResultMeta,
        diagnosisResult.isAcceptableOrUnknown(
          data['diagnosis_result']!,
          _diagnosisResultMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_diagnosisResultMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiagnosisHistoryTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiagnosisHistoryTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      cloudId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cloud_id'],
      ),
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      )!,
      material: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material'],
      )!,
      stainType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stain_type'],
      )!,
      diagnosisResult: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}diagnosis_result'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DiagnosisHistoryTableTable createAlias(String alias) {
    return $DiagnosisHistoryTableTable(attachedDatabase, alias);
  }
}

class DiagnosisHistoryTableData extends DataClass
    implements Insertable<DiagnosisHistoryTableData> {
  /// ID（UUID）
  final String id;

  /// クラウド同期後のID（NULL可）
  final String? cloudId;

  /// ローカル画像パス
  final String imagePath;

  /// 場所
  final String location;

  /// 素材
  final String material;

  /// 汚れの種類
  final String stainType;

  /// 診断結果（JSON）
  final String diagnosisResult;

  /// クラウド同期済みか
  final bool isSynced;

  /// 診断日時
  final DateTime createdAt;
  const DiagnosisHistoryTableData({
    required this.id,
    this.cloudId,
    required this.imagePath,
    required this.location,
    required this.material,
    required this.stainType,
    required this.diagnosisResult,
    required this.isSynced,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || cloudId != null) {
      map['cloud_id'] = Variable<String>(cloudId);
    }
    map['image_path'] = Variable<String>(imagePath);
    map['location'] = Variable<String>(location);
    map['material'] = Variable<String>(material);
    map['stain_type'] = Variable<String>(stainType);
    map['diagnosis_result'] = Variable<String>(diagnosisResult);
    map['is_synced'] = Variable<bool>(isSynced);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DiagnosisHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return DiagnosisHistoryTableCompanion(
      id: Value(id),
      cloudId: cloudId == null && nullToAbsent
          ? const Value.absent()
          : Value(cloudId),
      imagePath: Value(imagePath),
      location: Value(location),
      material: Value(material),
      stainType: Value(stainType),
      diagnosisResult: Value(diagnosisResult),
      isSynced: Value(isSynced),
      createdAt: Value(createdAt),
    );
  }

  factory DiagnosisHistoryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiagnosisHistoryTableData(
      id: serializer.fromJson<String>(json['id']),
      cloudId: serializer.fromJson<String?>(json['cloudId']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      location: serializer.fromJson<String>(json['location']),
      material: serializer.fromJson<String>(json['material']),
      stainType: serializer.fromJson<String>(json['stainType']),
      diagnosisResult: serializer.fromJson<String>(json['diagnosisResult']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'cloudId': serializer.toJson<String?>(cloudId),
      'imagePath': serializer.toJson<String>(imagePath),
      'location': serializer.toJson<String>(location),
      'material': serializer.toJson<String>(material),
      'stainType': serializer.toJson<String>(stainType),
      'diagnosisResult': serializer.toJson<String>(diagnosisResult),
      'isSynced': serializer.toJson<bool>(isSynced),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DiagnosisHistoryTableData copyWith({
    String? id,
    Value<String?> cloudId = const Value.absent(),
    String? imagePath,
    String? location,
    String? material,
    String? stainType,
    String? diagnosisResult,
    bool? isSynced,
    DateTime? createdAt,
  }) => DiagnosisHistoryTableData(
    id: id ?? this.id,
    cloudId: cloudId.present ? cloudId.value : this.cloudId,
    imagePath: imagePath ?? this.imagePath,
    location: location ?? this.location,
    material: material ?? this.material,
    stainType: stainType ?? this.stainType,
    diagnosisResult: diagnosisResult ?? this.diagnosisResult,
    isSynced: isSynced ?? this.isSynced,
    createdAt: createdAt ?? this.createdAt,
  );
  DiagnosisHistoryTableData copyWithCompanion(
    DiagnosisHistoryTableCompanion data,
  ) {
    return DiagnosisHistoryTableData(
      id: data.id.present ? data.id.value : this.id,
      cloudId: data.cloudId.present ? data.cloudId.value : this.cloudId,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      location: data.location.present ? data.location.value : this.location,
      material: data.material.present ? data.material.value : this.material,
      stainType: data.stainType.present ? data.stainType.value : this.stainType,
      diagnosisResult: data.diagnosisResult.present
          ? data.diagnosisResult.value
          : this.diagnosisResult,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DiagnosisHistoryTableData(')
          ..write('id: $id, ')
          ..write('cloudId: $cloudId, ')
          ..write('imagePath: $imagePath, ')
          ..write('location: $location, ')
          ..write('material: $material, ')
          ..write('stainType: $stainType, ')
          ..write('diagnosisResult: $diagnosisResult, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    cloudId,
    imagePath,
    location,
    material,
    stainType,
    diagnosisResult,
    isSynced,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiagnosisHistoryTableData &&
          other.id == this.id &&
          other.cloudId == this.cloudId &&
          other.imagePath == this.imagePath &&
          other.location == this.location &&
          other.material == this.material &&
          other.stainType == this.stainType &&
          other.diagnosisResult == this.diagnosisResult &&
          other.isSynced == this.isSynced &&
          other.createdAt == this.createdAt);
}

class DiagnosisHistoryTableCompanion
    extends UpdateCompanion<DiagnosisHistoryTableData> {
  final Value<String> id;
  final Value<String?> cloudId;
  final Value<String> imagePath;
  final Value<String> location;
  final Value<String> material;
  final Value<String> stainType;
  final Value<String> diagnosisResult;
  final Value<bool> isSynced;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const DiagnosisHistoryTableCompanion({
    this.id = const Value.absent(),
    this.cloudId = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.location = const Value.absent(),
    this.material = const Value.absent(),
    this.stainType = const Value.absent(),
    this.diagnosisResult = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DiagnosisHistoryTableCompanion.insert({
    required String id,
    this.cloudId = const Value.absent(),
    required String imagePath,
    required String location,
    required String material,
    required String stainType,
    required String diagnosisResult,
    this.isSynced = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       imagePath = Value(imagePath),
       location = Value(location),
       material = Value(material),
       stainType = Value(stainType),
       diagnosisResult = Value(diagnosisResult),
       createdAt = Value(createdAt);
  static Insertable<DiagnosisHistoryTableData> custom({
    Expression<String>? id,
    Expression<String>? cloudId,
    Expression<String>? imagePath,
    Expression<String>? location,
    Expression<String>? material,
    Expression<String>? stainType,
    Expression<String>? diagnosisResult,
    Expression<bool>? isSynced,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cloudId != null) 'cloud_id': cloudId,
      if (imagePath != null) 'image_path': imagePath,
      if (location != null) 'location': location,
      if (material != null) 'material': material,
      if (stainType != null) 'stain_type': stainType,
      if (diagnosisResult != null) 'diagnosis_result': diagnosisResult,
      if (isSynced != null) 'is_synced': isSynced,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DiagnosisHistoryTableCompanion copyWith({
    Value<String>? id,
    Value<String?>? cloudId,
    Value<String>? imagePath,
    Value<String>? location,
    Value<String>? material,
    Value<String>? stainType,
    Value<String>? diagnosisResult,
    Value<bool>? isSynced,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return DiagnosisHistoryTableCompanion(
      id: id ?? this.id,
      cloudId: cloudId ?? this.cloudId,
      imagePath: imagePath ?? this.imagePath,
      location: location ?? this.location,
      material: material ?? this.material,
      stainType: stainType ?? this.stainType,
      diagnosisResult: diagnosisResult ?? this.diagnosisResult,
      isSynced: isSynced ?? this.isSynced,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (cloudId.present) {
      map['cloud_id'] = Variable<String>(cloudId.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (material.present) {
      map['material'] = Variable<String>(material.value);
    }
    if (stainType.present) {
      map['stain_type'] = Variable<String>(stainType.value);
    }
    if (diagnosisResult.present) {
      map['diagnosis_result'] = Variable<String>(diagnosisResult.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiagnosisHistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('cloudId: $cloudId, ')
          ..write('imagePath: $imagePath, ')
          ..write('location: $location, ')
          ..write('material: $material, ')
          ..write('stainType: $stainType, ')
          ..write('diagnosisResult: $diagnosisResult, ')
          ..write('isSynced: $isSynced, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingsTableTable extends SettingsTable
    with TableInfo<$SettingsTableTable, SettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isLoggedInMeta = const VerificationMeta(
    'isLoggedIn',
  );
  @override
  late final GeneratedColumn<bool> isLoggedIn = GeneratedColumn<bool>(
    'is_logged_in',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_logged_in" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isPremiumMeta = const VerificationMeta(
    'isPremium',
  );
  @override
  late final GeneratedColumn<bool> isPremium = GeneratedColumn<bool>(
    'is_premium',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_premium" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _dailyDiagnosisCountMeta =
      const VerificationMeta('dailyDiagnosisCount');
  @override
  late final GeneratedColumn<int> dailyDiagnosisCount = GeneratedColumn<int>(
    'daily_diagnosis_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastDiagnosisDateMeta = const VerificationMeta(
    'lastDiagnosisDate',
  );
  @override
  late final GeneratedColumn<DateTime> lastDiagnosisDate =
      GeneratedColumn<DateTime>(
        'last_diagnosis_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    deviceId,
    isLoggedIn,
    userId,
    isPremium,
    dailyDiagnosisCount,
    lastDiagnosisDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'local_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<SettingsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('is_logged_in')) {
      context.handle(
        _isLoggedInMeta,
        isLoggedIn.isAcceptableOrUnknown(
          data['is_logged_in']!,
          _isLoggedInMeta,
        ),
      );
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('is_premium')) {
      context.handle(
        _isPremiumMeta,
        isPremium.isAcceptableOrUnknown(data['is_premium']!, _isPremiumMeta),
      );
    }
    if (data.containsKey('daily_diagnosis_count')) {
      context.handle(
        _dailyDiagnosisCountMeta,
        dailyDiagnosisCount.isAcceptableOrUnknown(
          data['daily_diagnosis_count']!,
          _dailyDiagnosisCountMeta,
        ),
      );
    }
    if (data.containsKey('last_diagnosis_date')) {
      context.handle(
        _lastDiagnosisDateMeta,
        lastDiagnosisDate.isAcceptableOrUnknown(
          data['last_diagnosis_date']!,
          _lastDiagnosisDateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
      isLoggedIn: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_logged_in'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}user_id'],
      ),
      isPremium: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_premium'],
      )!,
      dailyDiagnosisCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_diagnosis_count'],
      )!,
      lastDiagnosisDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_diagnosis_date'],
      ),
    );
  }

  @override
  $SettingsTableTable createAlias(String alias) {
    return $SettingsTableTable(attachedDatabase, alias);
  }
}

class SettingsTableData extends DataClass
    implements Insertable<SettingsTableData> {
  /// ID（1固定）
  final int id;

  /// デバイスID
  final String deviceId;

  /// ログイン状態
  final bool isLoggedIn;

  /// ユーザーID（NULL可）
  final String? userId;

  /// プレミアム会員か
  final bool isPremium;

  /// 今日の診断回数
  final int dailyDiagnosisCount;

  /// 最後に診断した日（NULL可）
  final DateTime? lastDiagnosisDate;
  const SettingsTableData({
    required this.id,
    required this.deviceId,
    required this.isLoggedIn,
    this.userId,
    required this.isPremium,
    required this.dailyDiagnosisCount,
    this.lastDiagnosisDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['device_id'] = Variable<String>(deviceId);
    map['is_logged_in'] = Variable<bool>(isLoggedIn);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<String>(userId);
    }
    map['is_premium'] = Variable<bool>(isPremium);
    map['daily_diagnosis_count'] = Variable<int>(dailyDiagnosisCount);
    if (!nullToAbsent || lastDiagnosisDate != null) {
      map['last_diagnosis_date'] = Variable<DateTime>(lastDiagnosisDate);
    }
    return map;
  }

  SettingsTableCompanion toCompanion(bool nullToAbsent) {
    return SettingsTableCompanion(
      id: Value(id),
      deviceId: Value(deviceId),
      isLoggedIn: Value(isLoggedIn),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
      isPremium: Value(isPremium),
      dailyDiagnosisCount: Value(dailyDiagnosisCount),
      lastDiagnosisDate: lastDiagnosisDate == null && nullToAbsent
          ? const Value.absent()
          : Value(lastDiagnosisDate),
    );
  }

  factory SettingsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsTableData(
      id: serializer.fromJson<int>(json['id']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      isLoggedIn: serializer.fromJson<bool>(json['isLoggedIn']),
      userId: serializer.fromJson<String?>(json['userId']),
      isPremium: serializer.fromJson<bool>(json['isPremium']),
      dailyDiagnosisCount: serializer.fromJson<int>(
        json['dailyDiagnosisCount'],
      ),
      lastDiagnosisDate: serializer.fromJson<DateTime?>(
        json['lastDiagnosisDate'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deviceId': serializer.toJson<String>(deviceId),
      'isLoggedIn': serializer.toJson<bool>(isLoggedIn),
      'userId': serializer.toJson<String?>(userId),
      'isPremium': serializer.toJson<bool>(isPremium),
      'dailyDiagnosisCount': serializer.toJson<int>(dailyDiagnosisCount),
      'lastDiagnosisDate': serializer.toJson<DateTime?>(lastDiagnosisDate),
    };
  }

  SettingsTableData copyWith({
    int? id,
    String? deviceId,
    bool? isLoggedIn,
    Value<String?> userId = const Value.absent(),
    bool? isPremium,
    int? dailyDiagnosisCount,
    Value<DateTime?> lastDiagnosisDate = const Value.absent(),
  }) => SettingsTableData(
    id: id ?? this.id,
    deviceId: deviceId ?? this.deviceId,
    isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    userId: userId.present ? userId.value : this.userId,
    isPremium: isPremium ?? this.isPremium,
    dailyDiagnosisCount: dailyDiagnosisCount ?? this.dailyDiagnosisCount,
    lastDiagnosisDate: lastDiagnosisDate.present
        ? lastDiagnosisDate.value
        : this.lastDiagnosisDate,
  );
  SettingsTableData copyWithCompanion(SettingsTableCompanion data) {
    return SettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      isLoggedIn: data.isLoggedIn.present
          ? data.isLoggedIn.value
          : this.isLoggedIn,
      userId: data.userId.present ? data.userId.value : this.userId,
      isPremium: data.isPremium.present ? data.isPremium.value : this.isPremium,
      dailyDiagnosisCount: data.dailyDiagnosisCount.present
          ? data.dailyDiagnosisCount.value
          : this.dailyDiagnosisCount,
      lastDiagnosisDate: data.lastDiagnosisDate.present
          ? data.lastDiagnosisDate.value
          : this.lastDiagnosisDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingsTableData(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('isLoggedIn: $isLoggedIn, ')
          ..write('userId: $userId, ')
          ..write('isPremium: $isPremium, ')
          ..write('dailyDiagnosisCount: $dailyDiagnosisCount, ')
          ..write('lastDiagnosisDate: $lastDiagnosisDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    deviceId,
    isLoggedIn,
    userId,
    isPremium,
    dailyDiagnosisCount,
    lastDiagnosisDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsTableData &&
          other.id == this.id &&
          other.deviceId == this.deviceId &&
          other.isLoggedIn == this.isLoggedIn &&
          other.userId == this.userId &&
          other.isPremium == this.isPremium &&
          other.dailyDiagnosisCount == this.dailyDiagnosisCount &&
          other.lastDiagnosisDate == this.lastDiagnosisDate);
}

class SettingsTableCompanion extends UpdateCompanion<SettingsTableData> {
  final Value<int> id;
  final Value<String> deviceId;
  final Value<bool> isLoggedIn;
  final Value<String?> userId;
  final Value<bool> isPremium;
  final Value<int> dailyDiagnosisCount;
  final Value<DateTime?> lastDiagnosisDate;
  const SettingsTableCompanion({
    this.id = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.isLoggedIn = const Value.absent(),
    this.userId = const Value.absent(),
    this.isPremium = const Value.absent(),
    this.dailyDiagnosisCount = const Value.absent(),
    this.lastDiagnosisDate = const Value.absent(),
  });
  SettingsTableCompanion.insert({
    this.id = const Value.absent(),
    required String deviceId,
    this.isLoggedIn = const Value.absent(),
    this.userId = const Value.absent(),
    this.isPremium = const Value.absent(),
    this.dailyDiagnosisCount = const Value.absent(),
    this.lastDiagnosisDate = const Value.absent(),
  }) : deviceId = Value(deviceId);
  static Insertable<SettingsTableData> custom({
    Expression<int>? id,
    Expression<String>? deviceId,
    Expression<bool>? isLoggedIn,
    Expression<String>? userId,
    Expression<bool>? isPremium,
    Expression<int>? dailyDiagnosisCount,
    Expression<DateTime>? lastDiagnosisDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deviceId != null) 'device_id': deviceId,
      if (isLoggedIn != null) 'is_logged_in': isLoggedIn,
      if (userId != null) 'user_id': userId,
      if (isPremium != null) 'is_premium': isPremium,
      if (dailyDiagnosisCount != null)
        'daily_diagnosis_count': dailyDiagnosisCount,
      if (lastDiagnosisDate != null) 'last_diagnosis_date': lastDiagnosisDate,
    });
  }

  SettingsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? deviceId,
    Value<bool>? isLoggedIn,
    Value<String?>? userId,
    Value<bool>? isPremium,
    Value<int>? dailyDiagnosisCount,
    Value<DateTime?>? lastDiagnosisDate,
  }) {
    return SettingsTableCompanion(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      userId: userId ?? this.userId,
      isPremium: isPremium ?? this.isPremium,
      dailyDiagnosisCount: dailyDiagnosisCount ?? this.dailyDiagnosisCount,
      lastDiagnosisDate: lastDiagnosisDate ?? this.lastDiagnosisDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (isLoggedIn.present) {
      map['is_logged_in'] = Variable<bool>(isLoggedIn.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (isPremium.present) {
      map['is_premium'] = Variable<bool>(isPremium.value);
    }
    if (dailyDiagnosisCount.present) {
      map['daily_diagnosis_count'] = Variable<int>(dailyDiagnosisCount.value);
    }
    if (lastDiagnosisDate.present) {
      map['last_diagnosis_date'] = Variable<DateTime>(lastDiagnosisDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('isLoggedIn: $isLoggedIn, ')
          ..write('userId: $userId, ')
          ..write('isPremium: $isPremium, ')
          ..write('dailyDiagnosisCount: $dailyDiagnosisCount, ')
          ..write('lastDiagnosisDate: $lastDiagnosisDate')
          ..write(')'))
        .toString();
  }
}

class $CachedDetergentsTableTable extends CachedDetergentsTable
    with TableInfo<$CachedDetergentsTableTable, CachedDetergentsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedDetergentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
    'brand',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, brand, type, data, cachedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_detergents';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedDetergentsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
        _brandMeta,
        brand.isAcceptableOrUnknown(data['brand']!, _brandMeta),
      );
    } else if (isInserting) {
      context.missing(_brandMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedDetergentsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedDetergentsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      brand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}brand'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedDetergentsTableTable createAlias(String alias) {
    return $CachedDetergentsTableTable(attachedDatabase, alias);
  }
}

class CachedDetergentsTableData extends DataClass
    implements Insertable<CachedDetergentsTableData> {
  /// ID（UUID）
  final String id;

  /// 商品名
  final String name;

  /// ブランド名
  final String brand;

  /// 種類（alkaline/acidic/neutral）
  final String type;

  /// 全データ（JSON）
  final String data;

  /// キャッシュ日時
  final DateTime cachedAt;
  const CachedDetergentsTableData({
    required this.id,
    required this.name,
    required this.brand,
    required this.type,
    required this.data,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['brand'] = Variable<String>(brand);
    map['type'] = Variable<String>(type);
    map['data'] = Variable<String>(data);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedDetergentsTableCompanion toCompanion(bool nullToAbsent) {
    return CachedDetergentsTableCompanion(
      id: Value(id),
      name: Value(name),
      brand: Value(brand),
      type: Value(type),
      data: Value(data),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedDetergentsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedDetergentsTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      brand: serializer.fromJson<String>(json['brand']),
      type: serializer.fromJson<String>(json['type']),
      data: serializer.fromJson<String>(json['data']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'brand': serializer.toJson<String>(brand),
      'type': serializer.toJson<String>(type),
      'data': serializer.toJson<String>(data),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedDetergentsTableData copyWith({
    String? id,
    String? name,
    String? brand,
    String? type,
    String? data,
    DateTime? cachedAt,
  }) => CachedDetergentsTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    brand: brand ?? this.brand,
    type: type ?? this.type,
    data: data ?? this.data,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedDetergentsTableData copyWithCompanion(
    CachedDetergentsTableCompanion data,
  ) {
    return CachedDetergentsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      brand: data.brand.present ? data.brand.value : this.brand,
      type: data.type.present ? data.type.value : this.type,
      data: data.data.present ? data.data.value : this.data,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedDetergentsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('type: $type, ')
          ..write('data: $data, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, brand, type, data, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedDetergentsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.brand == this.brand &&
          other.type == this.type &&
          other.data == this.data &&
          other.cachedAt == this.cachedAt);
}

class CachedDetergentsTableCompanion
    extends UpdateCompanion<CachedDetergentsTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> brand;
  final Value<String> type;
  final Value<String> data;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedDetergentsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.brand = const Value.absent(),
    this.type = const Value.absent(),
    this.data = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedDetergentsTableCompanion.insert({
    required String id,
    required String name,
    required String brand,
    required String type,
    required String data,
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       brand = Value(brand),
       type = Value(type),
       data = Value(data),
       cachedAt = Value(cachedAt);
  static Insertable<CachedDetergentsTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? brand,
    Expression<String>? type,
    Expression<String>? data,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (brand != null) 'brand': brand,
      if (type != null) 'type': type,
      if (data != null) 'data': data,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedDetergentsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? brand,
    Value<String>? type,
    Value<String>? data,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return CachedDetergentsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      type: type ?? this.type,
      data: data ?? this.data,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedDetergentsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('type: $type, ')
          ..write('data: $data, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedRecipesTableTable extends CachedRecipesTable
    with TableInfo<$CachedRecipesTableTable, CachedRecipesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedRecipesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isPremiumMeta = const VerificationMeta(
    'isPremium',
  );
  @override
  late final GeneratedColumn<bool> isPremium = GeneratedColumn<bool>(
    'is_premium',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_premium" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, data, isPremium, cachedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_recipes';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedRecipesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('is_premium')) {
      context.handle(
        _isPremiumMeta,
        isPremium.isAcceptableOrUnknown(data['is_premium']!, _isPremiumMeta),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedRecipesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedRecipesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
      )!,
      isPremium: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_premium'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedRecipesTableTable createAlias(String alias) {
    return $CachedRecipesTableTable(attachedDatabase, alias);
  }
}

class CachedRecipesTableData extends DataClass
    implements Insertable<CachedRecipesTableData> {
  /// ID（UUID）
  final String id;

  /// レシピ名
  final String name;

  /// 全データ（JSON）
  final String data;

  /// プレミアム限定か
  final bool isPremium;

  /// キャッシュ日時
  final DateTime cachedAt;
  const CachedRecipesTableData({
    required this.id,
    required this.name,
    required this.data,
    required this.isPremium,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['data'] = Variable<String>(data);
    map['is_premium'] = Variable<bool>(isPremium);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedRecipesTableCompanion toCompanion(bool nullToAbsent) {
    return CachedRecipesTableCompanion(
      id: Value(id),
      name: Value(name),
      data: Value(data),
      isPremium: Value(isPremium),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedRecipesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedRecipesTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      data: serializer.fromJson<String>(json['data']),
      isPremium: serializer.fromJson<bool>(json['isPremium']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'data': serializer.toJson<String>(data),
      'isPremium': serializer.toJson<bool>(isPremium),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedRecipesTableData copyWith({
    String? id,
    String? name,
    String? data,
    bool? isPremium,
    DateTime? cachedAt,
  }) => CachedRecipesTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    data: data ?? this.data,
    isPremium: isPremium ?? this.isPremium,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedRecipesTableData copyWithCompanion(CachedRecipesTableCompanion data) {
    return CachedRecipesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      data: data.data.present ? data.data.value : this.data,
      isPremium: data.isPremium.present ? data.isPremium.value : this.isPremium,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedRecipesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('data: $data, ')
          ..write('isPremium: $isPremium, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, data, isPremium, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedRecipesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.data == this.data &&
          other.isPremium == this.isPremium &&
          other.cachedAt == this.cachedAt);
}

class CachedRecipesTableCompanion
    extends UpdateCompanion<CachedRecipesTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> data;
  final Value<bool> isPremium;
  final Value<DateTime> cachedAt;
  final Value<int> rowid;
  const CachedRecipesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.data = const Value.absent(),
    this.isPremium = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedRecipesTableCompanion.insert({
    required String id,
    required String name,
    required String data,
    this.isPremium = const Value.absent(),
    required DateTime cachedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       data = Value(data),
       cachedAt = Value(cachedAt);
  static Insertable<CachedRecipesTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? data,
    Expression<bool>? isPremium,
    Expression<DateTime>? cachedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (data != null) 'data': data,
      if (isPremium != null) 'is_premium': isPremium,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedRecipesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? data,
    Value<bool>? isPremium,
    Value<DateTime>? cachedAt,
    Value<int>? rowid,
  }) {
    return CachedRecipesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      data: data ?? this.data,
      isPremium: isPremium ?? this.isPremium,
      cachedAt: cachedAt ?? this.cachedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (isPremium.present) {
      map['is_premium'] = Variable<bool>(isPremium.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedRecipesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('data: $data, ')
          ..write('isPremium: $isPremium, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DiagnosisHistoryTableTable diagnosisHistoryTable =
      $DiagnosisHistoryTableTable(this);
  late final $SettingsTableTable settingsTable = $SettingsTableTable(this);
  late final $CachedDetergentsTableTable cachedDetergentsTable =
      $CachedDetergentsTableTable(this);
  late final $CachedRecipesTableTable cachedRecipesTable =
      $CachedRecipesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    diagnosisHistoryTable,
    settingsTable,
    cachedDetergentsTable,
    cachedRecipesTable,
  ];
}

typedef $$DiagnosisHistoryTableTableCreateCompanionBuilder =
    DiagnosisHistoryTableCompanion Function({
      required String id,
      Value<String?> cloudId,
      required String imagePath,
      required String location,
      required String material,
      required String stainType,
      required String diagnosisResult,
      Value<bool> isSynced,
      required DateTime createdAt,
      Value<int> rowid,
    });
typedef $$DiagnosisHistoryTableTableUpdateCompanionBuilder =
    DiagnosisHistoryTableCompanion Function({
      Value<String> id,
      Value<String?> cloudId,
      Value<String> imagePath,
      Value<String> location,
      Value<String> material,
      Value<String> stainType,
      Value<String> diagnosisResult,
      Value<bool> isSynced,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

class $$DiagnosisHistoryTableTableFilterComposer
    extends Composer<_$AppDatabase, $DiagnosisHistoryTableTable> {
  $$DiagnosisHistoryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cloudId => $composableBuilder(
    column: $table.cloudId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get material => $composableBuilder(
    column: $table.material,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stainType => $composableBuilder(
    column: $table.stainType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get diagnosisResult => $composableBuilder(
    column: $table.diagnosisResult,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DiagnosisHistoryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DiagnosisHistoryTableTable> {
  $$DiagnosisHistoryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cloudId => $composableBuilder(
    column: $table.cloudId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get material => $composableBuilder(
    column: $table.material,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stainType => $composableBuilder(
    column: $table.stainType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get diagnosisResult => $composableBuilder(
    column: $table.diagnosisResult,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DiagnosisHistoryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiagnosisHistoryTableTable> {
  $$DiagnosisHistoryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get cloudId =>
      $composableBuilder(column: $table.cloudId, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get material =>
      $composableBuilder(column: $table.material, builder: (column) => column);

  GeneratedColumn<String> get stainType =>
      $composableBuilder(column: $table.stainType, builder: (column) => column);

  GeneratedColumn<String> get diagnosisResult => $composableBuilder(
    column: $table.diagnosisResult,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DiagnosisHistoryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DiagnosisHistoryTableTable,
          DiagnosisHistoryTableData,
          $$DiagnosisHistoryTableTableFilterComposer,
          $$DiagnosisHistoryTableTableOrderingComposer,
          $$DiagnosisHistoryTableTableAnnotationComposer,
          $$DiagnosisHistoryTableTableCreateCompanionBuilder,
          $$DiagnosisHistoryTableTableUpdateCompanionBuilder,
          (
            DiagnosisHistoryTableData,
            BaseReferences<
              _$AppDatabase,
              $DiagnosisHistoryTableTable,
              DiagnosisHistoryTableData
            >,
          ),
          DiagnosisHistoryTableData,
          PrefetchHooks Function()
        > {
  $$DiagnosisHistoryTableTableTableManager(
    _$AppDatabase db,
    $DiagnosisHistoryTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiagnosisHistoryTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$DiagnosisHistoryTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$DiagnosisHistoryTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> cloudId = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<String> material = const Value.absent(),
                Value<String> stainType = const Value.absent(),
                Value<String> diagnosisResult = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DiagnosisHistoryTableCompanion(
                id: id,
                cloudId: cloudId,
                imagePath: imagePath,
                location: location,
                material: material,
                stainType: stainType,
                diagnosisResult: diagnosisResult,
                isSynced: isSynced,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> cloudId = const Value.absent(),
                required String imagePath,
                required String location,
                required String material,
                required String stainType,
                required String diagnosisResult,
                Value<bool> isSynced = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => DiagnosisHistoryTableCompanion.insert(
                id: id,
                cloudId: cloudId,
                imagePath: imagePath,
                location: location,
                material: material,
                stainType: stainType,
                diagnosisResult: diagnosisResult,
                isSynced: isSynced,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DiagnosisHistoryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DiagnosisHistoryTableTable,
      DiagnosisHistoryTableData,
      $$DiagnosisHistoryTableTableFilterComposer,
      $$DiagnosisHistoryTableTableOrderingComposer,
      $$DiagnosisHistoryTableTableAnnotationComposer,
      $$DiagnosisHistoryTableTableCreateCompanionBuilder,
      $$DiagnosisHistoryTableTableUpdateCompanionBuilder,
      (
        DiagnosisHistoryTableData,
        BaseReferences<
          _$AppDatabase,
          $DiagnosisHistoryTableTable,
          DiagnosisHistoryTableData
        >,
      ),
      DiagnosisHistoryTableData,
      PrefetchHooks Function()
    >;
typedef $$SettingsTableTableCreateCompanionBuilder =
    SettingsTableCompanion Function({
      Value<int> id,
      required String deviceId,
      Value<bool> isLoggedIn,
      Value<String?> userId,
      Value<bool> isPremium,
      Value<int> dailyDiagnosisCount,
      Value<DateTime?> lastDiagnosisDate,
    });
typedef $$SettingsTableTableUpdateCompanionBuilder =
    SettingsTableCompanion Function({
      Value<int> id,
      Value<String> deviceId,
      Value<bool> isLoggedIn,
      Value<String?> userId,
      Value<bool> isPremium,
      Value<int> dailyDiagnosisCount,
      Value<DateTime?> lastDiagnosisDate,
    });

class $$SettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTableTable> {
  $$SettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isLoggedIn => $composableBuilder(
    column: $table.isLoggedIn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPremium => $composableBuilder(
    column: $table.isPremium,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyDiagnosisCount => $composableBuilder(
    column: $table.dailyDiagnosisCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastDiagnosisDate => $composableBuilder(
    column: $table.lastDiagnosisDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTableTable> {
  $$SettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isLoggedIn => $composableBuilder(
    column: $table.isLoggedIn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPremium => $composableBuilder(
    column: $table.isPremium,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyDiagnosisCount => $composableBuilder(
    column: $table.dailyDiagnosisCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastDiagnosisDate => $composableBuilder(
    column: $table.lastDiagnosisDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTableTable> {
  $$SettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<bool> get isLoggedIn => $composableBuilder(
    column: $table.isLoggedIn,
    builder: (column) => column,
  );

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<bool> get isPremium =>
      $composableBuilder(column: $table.isPremium, builder: (column) => column);

  GeneratedColumn<int> get dailyDiagnosisCount => $composableBuilder(
    column: $table.dailyDiagnosisCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastDiagnosisDate => $composableBuilder(
    column: $table.lastDiagnosisDate,
    builder: (column) => column,
  );
}

class $$SettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTableTable,
          SettingsTableData,
          $$SettingsTableTableFilterComposer,
          $$SettingsTableTableOrderingComposer,
          $$SettingsTableTableAnnotationComposer,
          $$SettingsTableTableCreateCompanionBuilder,
          $$SettingsTableTableUpdateCompanionBuilder,
          (
            SettingsTableData,
            BaseReferences<
              _$AppDatabase,
              $SettingsTableTable,
              SettingsTableData
            >,
          ),
          SettingsTableData,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableTableManager(_$AppDatabase db, $SettingsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<bool> isLoggedIn = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<bool> isPremium = const Value.absent(),
                Value<int> dailyDiagnosisCount = const Value.absent(),
                Value<DateTime?> lastDiagnosisDate = const Value.absent(),
              }) => SettingsTableCompanion(
                id: id,
                deviceId: deviceId,
                isLoggedIn: isLoggedIn,
                userId: userId,
                isPremium: isPremium,
                dailyDiagnosisCount: dailyDiagnosisCount,
                lastDiagnosisDate: lastDiagnosisDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String deviceId,
                Value<bool> isLoggedIn = const Value.absent(),
                Value<String?> userId = const Value.absent(),
                Value<bool> isPremium = const Value.absent(),
                Value<int> dailyDiagnosisCount = const Value.absent(),
                Value<DateTime?> lastDiagnosisDate = const Value.absent(),
              }) => SettingsTableCompanion.insert(
                id: id,
                deviceId: deviceId,
                isLoggedIn: isLoggedIn,
                userId: userId,
                isPremium: isPremium,
                dailyDiagnosisCount: dailyDiagnosisCount,
                lastDiagnosisDate: lastDiagnosisDate,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTableTable,
      SettingsTableData,
      $$SettingsTableTableFilterComposer,
      $$SettingsTableTableOrderingComposer,
      $$SettingsTableTableAnnotationComposer,
      $$SettingsTableTableCreateCompanionBuilder,
      $$SettingsTableTableUpdateCompanionBuilder,
      (
        SettingsTableData,
        BaseReferences<_$AppDatabase, $SettingsTableTable, SettingsTableData>,
      ),
      SettingsTableData,
      PrefetchHooks Function()
    >;
typedef $$CachedDetergentsTableTableCreateCompanionBuilder =
    CachedDetergentsTableCompanion Function({
      required String id,
      required String name,
      required String brand,
      required String type,
      required String data,
      required DateTime cachedAt,
      Value<int> rowid,
    });
typedef $$CachedDetergentsTableTableUpdateCompanionBuilder =
    CachedDetergentsTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> brand,
      Value<String> type,
      Value<String> data,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$CachedDetergentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $CachedDetergentsTableTable> {
  $$CachedDetergentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedDetergentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedDetergentsTableTable> {
  $$CachedDetergentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get brand => $composableBuilder(
    column: $table.brand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedDetergentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedDetergentsTableTable> {
  $$CachedDetergentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedDetergentsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedDetergentsTableTable,
          CachedDetergentsTableData,
          $$CachedDetergentsTableTableFilterComposer,
          $$CachedDetergentsTableTableOrderingComposer,
          $$CachedDetergentsTableTableAnnotationComposer,
          $$CachedDetergentsTableTableCreateCompanionBuilder,
          $$CachedDetergentsTableTableUpdateCompanionBuilder,
          (
            CachedDetergentsTableData,
            BaseReferences<
              _$AppDatabase,
              $CachedDetergentsTableTable,
              CachedDetergentsTableData
            >,
          ),
          CachedDetergentsTableData,
          PrefetchHooks Function()
        > {
  $$CachedDetergentsTableTableTableManager(
    _$AppDatabase db,
    $CachedDetergentsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedDetergentsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CachedDetergentsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CachedDetergentsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> brand = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedDetergentsTableCompanion(
                id: id,
                name: name,
                brand: brand,
                type: type,
                data: data,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String brand,
                required String type,
                required String data,
                required DateTime cachedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedDetergentsTableCompanion.insert(
                id: id,
                name: name,
                brand: brand,
                type: type,
                data: data,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedDetergentsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedDetergentsTableTable,
      CachedDetergentsTableData,
      $$CachedDetergentsTableTableFilterComposer,
      $$CachedDetergentsTableTableOrderingComposer,
      $$CachedDetergentsTableTableAnnotationComposer,
      $$CachedDetergentsTableTableCreateCompanionBuilder,
      $$CachedDetergentsTableTableUpdateCompanionBuilder,
      (
        CachedDetergentsTableData,
        BaseReferences<
          _$AppDatabase,
          $CachedDetergentsTableTable,
          CachedDetergentsTableData
        >,
      ),
      CachedDetergentsTableData,
      PrefetchHooks Function()
    >;
typedef $$CachedRecipesTableTableCreateCompanionBuilder =
    CachedRecipesTableCompanion Function({
      required String id,
      required String name,
      required String data,
      Value<bool> isPremium,
      required DateTime cachedAt,
      Value<int> rowid,
    });
typedef $$CachedRecipesTableTableUpdateCompanionBuilder =
    CachedRecipesTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> data,
      Value<bool> isPremium,
      Value<DateTime> cachedAt,
      Value<int> rowid,
    });

class $$CachedRecipesTableTableFilterComposer
    extends Composer<_$AppDatabase, $CachedRecipesTableTable> {
  $$CachedRecipesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPremium => $composableBuilder(
    column: $table.isPremium,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedRecipesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedRecipesTableTable> {
  $$CachedRecipesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPremium => $composableBuilder(
    column: $table.isPremium,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedRecipesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedRecipesTableTable> {
  $$CachedRecipesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<bool> get isPremium =>
      $composableBuilder(column: $table.isPremium, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$CachedRecipesTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedRecipesTableTable,
          CachedRecipesTableData,
          $$CachedRecipesTableTableFilterComposer,
          $$CachedRecipesTableTableOrderingComposer,
          $$CachedRecipesTableTableAnnotationComposer,
          $$CachedRecipesTableTableCreateCompanionBuilder,
          $$CachedRecipesTableTableUpdateCompanionBuilder,
          (
            CachedRecipesTableData,
            BaseReferences<
              _$AppDatabase,
              $CachedRecipesTableTable,
              CachedRecipesTableData
            >,
          ),
          CachedRecipesTableData,
          PrefetchHooks Function()
        > {
  $$CachedRecipesTableTableTableManager(
    _$AppDatabase db,
    $CachedRecipesTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedRecipesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedRecipesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedRecipesTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> data = const Value.absent(),
                Value<bool> isPremium = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedRecipesTableCompanion(
                id: id,
                name: name,
                data: data,
                isPremium: isPremium,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String data,
                Value<bool> isPremium = const Value.absent(),
                required DateTime cachedAt,
                Value<int> rowid = const Value.absent(),
              }) => CachedRecipesTableCompanion.insert(
                id: id,
                name: name,
                data: data,
                isPremium: isPremium,
                cachedAt: cachedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedRecipesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedRecipesTableTable,
      CachedRecipesTableData,
      $$CachedRecipesTableTableFilterComposer,
      $$CachedRecipesTableTableOrderingComposer,
      $$CachedRecipesTableTableAnnotationComposer,
      $$CachedRecipesTableTableCreateCompanionBuilder,
      $$CachedRecipesTableTableUpdateCompanionBuilder,
      (
        CachedRecipesTableData,
        BaseReferences<
          _$AppDatabase,
          $CachedRecipesTableTable,
          CachedRecipesTableData
        >,
      ),
      CachedRecipesTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DiagnosisHistoryTableTableTableManager get diagnosisHistoryTable =>
      $$DiagnosisHistoryTableTableTableManager(_db, _db.diagnosisHistoryTable);
  $$SettingsTableTableTableManager get settingsTable =>
      $$SettingsTableTableTableManager(_db, _db.settingsTable);
  $$CachedDetergentsTableTableTableManager get cachedDetergentsTable =>
      $$CachedDetergentsTableTableTableManager(_db, _db.cachedDetergentsTable);
  $$CachedRecipesTableTableTableManager get cachedRecipesTable =>
      $$CachedRecipesTableTableTableManager(_db, _db.cachedRecipesTable);
}

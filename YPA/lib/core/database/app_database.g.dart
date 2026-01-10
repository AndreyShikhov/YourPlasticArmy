// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FactionsTable extends Factions with TableInfo<$FactionsTable, Faction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, code, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'factions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Faction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Faction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Faction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $FactionsTable createAlias(String alias) {
    return $FactionsTable(attachedDatabase, alias);
  }
}

class Faction extends DataClass implements Insertable<Faction> {
  final int id;

  /// Stable technical identifier for SQL & seeds
  final String code;

  /// Display name (UI, localization later)
  final String name;
  const Faction({required this.id, required this.code, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    return map;
  }

  FactionsCompanion toCompanion(bool nullToAbsent) {
    return FactionsCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
    );
  }

  factory Faction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Faction(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
    };
  }

  Faction copyWith({int? id, String? code, String? name}) => Faction(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
  );
  Faction copyWithCompanion(FactionsCompanion data) {
    return Faction(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Faction(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Faction &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name);
}

class FactionsCompanion extends UpdateCompanion<Faction> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  const FactionsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
  });
  FactionsCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
  }) : code = Value(code),
       name = Value(name);
  static Insertable<Faction> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
    });
  }

  FactionsCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
  }) {
    return FactionsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FactionsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ArmiesTable extends Armies with TableInfo<$ArmiesTable, Army> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArmiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _armyCodeMeta = const VerificationMeta(
    'armyCode',
  );
  @override
  late final GeneratedColumn<String> armyCode = GeneratedColumn<String>(
    'army_code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _factionIdMeta = const VerificationMeta(
    'factionId',
  );
  @override
  late final GeneratedColumn<int> factionId = GeneratedColumn<int>(
    'faction_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES factions (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, armyCode, name, factionId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'armies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Army> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('army_code')) {
      context.handle(
        _armyCodeMeta,
        armyCode.isAcceptableOrUnknown(data['army_code']!, _armyCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_armyCodeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('faction_id')) {
      context.handle(
        _factionIdMeta,
        factionId.isAcceptableOrUnknown(data['faction_id']!, _factionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_factionIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Army map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Army(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      armyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}army_code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      factionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}faction_id'],
      )!,
    );
  }

  @override
  $ArmiesTable createAlias(String alias) {
    return $ArmiesTable(attachedDatabase, alias);
  }
}

class Army extends DataClass implements Insertable<Army> {
  final int id;

  /// space_marines, orks
  final String armyCode;

  /// Space Marines, Orks
  final String name;

  /// Imperium / Chaos / Xenos
  final int factionId;
  const Army({
    required this.id,
    required this.armyCode,
    required this.name,
    required this.factionId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['army_code'] = Variable<String>(armyCode);
    map['name'] = Variable<String>(name);
    map['faction_id'] = Variable<int>(factionId);
    return map;
  }

  ArmiesCompanion toCompanion(bool nullToAbsent) {
    return ArmiesCompanion(
      id: Value(id),
      armyCode: Value(armyCode),
      name: Value(name),
      factionId: Value(factionId),
    );
  }

  factory Army.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Army(
      id: serializer.fromJson<int>(json['id']),
      armyCode: serializer.fromJson<String>(json['armyCode']),
      name: serializer.fromJson<String>(json['name']),
      factionId: serializer.fromJson<int>(json['factionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'armyCode': serializer.toJson<String>(armyCode),
      'name': serializer.toJson<String>(name),
      'factionId': serializer.toJson<int>(factionId),
    };
  }

  Army copyWith({int? id, String? armyCode, String? name, int? factionId}) =>
      Army(
        id: id ?? this.id,
        armyCode: armyCode ?? this.armyCode,
        name: name ?? this.name,
        factionId: factionId ?? this.factionId,
      );
  Army copyWithCompanion(ArmiesCompanion data) {
    return Army(
      id: data.id.present ? data.id.value : this.id,
      armyCode: data.armyCode.present ? data.armyCode.value : this.armyCode,
      name: data.name.present ? data.name.value : this.name,
      factionId: data.factionId.present ? data.factionId.value : this.factionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Army(')
          ..write('id: $id, ')
          ..write('armyCode: $armyCode, ')
          ..write('name: $name, ')
          ..write('factionId: $factionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, armyCode, name, factionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Army &&
          other.id == this.id &&
          other.armyCode == this.armyCode &&
          other.name == this.name &&
          other.factionId == this.factionId);
}

class ArmiesCompanion extends UpdateCompanion<Army> {
  final Value<int> id;
  final Value<String> armyCode;
  final Value<String> name;
  final Value<int> factionId;
  const ArmiesCompanion({
    this.id = const Value.absent(),
    this.armyCode = const Value.absent(),
    this.name = const Value.absent(),
    this.factionId = const Value.absent(),
  });
  ArmiesCompanion.insert({
    this.id = const Value.absent(),
    required String armyCode,
    required String name,
    required int factionId,
  }) : armyCode = Value(armyCode),
       name = Value(name),
       factionId = Value(factionId);
  static Insertable<Army> custom({
    Expression<int>? id,
    Expression<String>? armyCode,
    Expression<String>? name,
    Expression<int>? factionId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (armyCode != null) 'army_code': armyCode,
      if (name != null) 'name': name,
      if (factionId != null) 'faction_id': factionId,
    });
  }

  ArmiesCompanion copyWith({
    Value<int>? id,
    Value<String>? armyCode,
    Value<String>? name,
    Value<int>? factionId,
  }) {
    return ArmiesCompanion(
      id: id ?? this.id,
      armyCode: armyCode ?? this.armyCode,
      name: name ?? this.name,
      factionId: factionId ?? this.factionId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (armyCode.present) {
      map['army_code'] = Variable<String>(armyCode.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (factionId.present) {
      map['faction_id'] = Variable<int>(factionId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArmiesCompanion(')
          ..write('id: $id, ')
          ..write('armyCode: $armyCode, ')
          ..write('name: $name, ')
          ..write('factionId: $factionId')
          ..write(')'))
        .toString();
  }
}

class $CodexesTable extends Codexes with TableInfo<$CodexesTable, Codexe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CodexesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _armyIdMeta = const VerificationMeta('armyId');
  @override
  late final GeneratedColumn<int> armyId = GeneratedColumn<int>(
    'army_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES armies (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, code, name, armyId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'codexes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Codexe> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('army_id')) {
      context.handle(
        _armyIdMeta,
        armyId.isAcceptableOrUnknown(data['army_id']!, _armyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_armyIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Codexe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Codexe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      armyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}army_id'],
      )!,
    );
  }

  @override
  $CodexesTable createAlias(String alias) {
    return $CodexesTable(attachedDatabase, alias);
  }
}

class Codexe extends DataClass implements Insertable<Codexe> {
  final String id;

  /// ultramarines, blood_angels
  final String code;

  /// Ultramarines, Blood Angels
  final String name;

  /// Codex belongs to Army
  final int armyId;
  const Codexe({
    required this.id,
    required this.code,
    required this.name,
    required this.armyId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['army_id'] = Variable<int>(armyId);
    return map;
  }

  CodexesCompanion toCompanion(bool nullToAbsent) {
    return CodexesCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      armyId: Value(armyId),
    );
  }

  factory Codexe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Codexe(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      armyId: serializer.fromJson<int>(json['armyId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'armyId': serializer.toJson<int>(armyId),
    };
  }

  Codexe copyWith({String? id, String? code, String? name, int? armyId}) =>
      Codexe(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        armyId: armyId ?? this.armyId,
      );
  Codexe copyWithCompanion(CodexesCompanion data) {
    return Codexe(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      armyId: data.armyId.present ? data.armyId.value : this.armyId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Codexe(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('armyId: $armyId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name, armyId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Codexe &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.armyId == this.armyId);
}

class CodexesCompanion extends UpdateCompanion<Codexe> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> name;
  final Value<int> armyId;
  final Value<int> rowid;
  const CodexesCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.armyId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CodexesCompanion.insert({
    required String id,
    required String code,
    required String name,
    required int armyId,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       name = Value(name),
       armyId = Value(armyId);
  static Insertable<Codexe> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<int>? armyId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (armyId != null) 'army_id': armyId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CodexesCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<String>? name,
    Value<int>? armyId,
    Value<int>? rowid,
  }) {
    return CodexesCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      armyId: armyId ?? this.armyId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (armyId.present) {
      map['army_id'] = Variable<int>(armyId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CodexesCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('armyId: $armyId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoleTable extends Role with TableInfo<$RoleTable, RoleData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, code, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'role';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoleData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoleData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoleData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $RoleTable createAlias(String alias) {
    return $RoleTable(attachedDatabase, alias);
  }
}

class RoleData extends DataClass implements Insertable<RoleData> {
  final int id;

  /// hq, troops, elite, fast_attack
  final String code;

  /// HQ, Troops, Elite
  final String name;
  const RoleData({required this.id, required this.code, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    return map;
  }

  RoleCompanion toCompanion(bool nullToAbsent) {
    return RoleCompanion(id: Value(id), code: Value(code), name: Value(name));
  }

  factory RoleData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoleData(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
    };
  }

  RoleData copyWith({int? id, String? code, String? name}) => RoleData(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
  );
  RoleData copyWithCompanion(RoleCompanion data) {
    return RoleData(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoleData(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoleData &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name);
}

class RoleCompanion extends UpdateCompanion<RoleData> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  const RoleCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
  });
  RoleCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
  }) : code = Value(code),
       name = Value(name);
  static Insertable<RoleData> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
    });
  }

  RoleCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
  }) {
    return RoleCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoleCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $UnitsTable extends Units with TableInfo<$UnitsTable, UnitRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitsTable(this.attachedDatabase, [this._alias]);
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
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _armyIdMeta = const VerificationMeta('armyId');
  @override
  late final GeneratedColumn<int> armyId = GeneratedColumn<int>(
    'army_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES armies (id)',
    ),
  );
  static const VerificationMeta _codexIdMeta = const VerificationMeta(
    'codexId',
  );
  @override
  late final GeneratedColumn<String> codexId = GeneratedColumn<String>(
    'codex_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES codexes (id)',
    ),
  );
  static const VerificationMeta _roleIdMeta = const VerificationMeta('roleId');
  @override
  late final GeneratedColumn<int> roleId = GeneratedColumn<int>(
    'role_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES role (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<UnitStats, String> stats =
      GeneratedColumn<String>(
        'stats',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<UnitStats>($UnitsTable.$converterstats);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    armyId,
    codexId,
    roleId,
    stats,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'units';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnitRow> instance, {
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
    if (data.containsKey('army_id')) {
      context.handle(
        _armyIdMeta,
        armyId.isAcceptableOrUnknown(data['army_id']!, _armyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_armyIdMeta);
    }
    if (data.containsKey('codex_id')) {
      context.handle(
        _codexIdMeta,
        codexId.isAcceptableOrUnknown(data['codex_id']!, _codexIdMeta),
      );
    }
    if (data.containsKey('role_id')) {
      context.handle(
        _roleIdMeta,
        roleId.isAcceptableOrUnknown(data['role_id']!, _roleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roleIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UnitRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnitRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      armyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}army_id'],
      )!,
      codexId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codex_id'],
      ),
      roleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}role_id'],
      )!,
      stats: $UnitsTable.$converterstats.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}stats'],
        )!,
      ),
    );
  }

  @override
  $UnitsTable createAlias(String alias) {
    return $UnitsTable(attachedDatabase, alias);
  }

  static TypeConverter<UnitStats, String> $converterstats =
      const UnitStatsConverter();
}

class UnitRow extends DataClass implements Insertable<UnitRow> {
  final String id;
  final String name;

  /// Always required
  final int armyId;

  /// Nullable (orks, demons, etc.)
  final String? codexId;
  final int roleId;

  /// Stats stored as JSON
  final UnitStats stats;
  const UnitRow({
    required this.id,
    required this.name,
    required this.armyId,
    this.codexId,
    required this.roleId,
    required this.stats,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['army_id'] = Variable<int>(armyId);
    if (!nullToAbsent || codexId != null) {
      map['codex_id'] = Variable<String>(codexId);
    }
    map['role_id'] = Variable<int>(roleId);
    {
      map['stats'] = Variable<String>($UnitsTable.$converterstats.toSql(stats));
    }
    return map;
  }

  UnitsCompanion toCompanion(bool nullToAbsent) {
    return UnitsCompanion(
      id: Value(id),
      name: Value(name),
      armyId: Value(armyId),
      codexId: codexId == null && nullToAbsent
          ? const Value.absent()
          : Value(codexId),
      roleId: Value(roleId),
      stats: Value(stats),
    );
  }

  factory UnitRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnitRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      armyId: serializer.fromJson<int>(json['armyId']),
      codexId: serializer.fromJson<String?>(json['codexId']),
      roleId: serializer.fromJson<int>(json['roleId']),
      stats: serializer.fromJson<UnitStats>(json['stats']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'armyId': serializer.toJson<int>(armyId),
      'codexId': serializer.toJson<String?>(codexId),
      'roleId': serializer.toJson<int>(roleId),
      'stats': serializer.toJson<UnitStats>(stats),
    };
  }

  UnitRow copyWith({
    String? id,
    String? name,
    int? armyId,
    Value<String?> codexId = const Value.absent(),
    int? roleId,
    UnitStats? stats,
  }) => UnitRow(
    id: id ?? this.id,
    name: name ?? this.name,
    armyId: armyId ?? this.armyId,
    codexId: codexId.present ? codexId.value : this.codexId,
    roleId: roleId ?? this.roleId,
    stats: stats ?? this.stats,
  );
  UnitRow copyWithCompanion(UnitsCompanion data) {
    return UnitRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      armyId: data.armyId.present ? data.armyId.value : this.armyId,
      codexId: data.codexId.present ? data.codexId.value : this.codexId,
      roleId: data.roleId.present ? data.roleId.value : this.roleId,
      stats: data.stats.present ? data.stats.value : this.stats,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnitRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('armyId: $armyId, ')
          ..write('codexId: $codexId, ')
          ..write('roleId: $roleId, ')
          ..write('stats: $stats')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, armyId, codexId, roleId, stats);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnitRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.armyId == this.armyId &&
          other.codexId == this.codexId &&
          other.roleId == this.roleId &&
          other.stats == this.stats);
}

class UnitsCompanion extends UpdateCompanion<UnitRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> armyId;
  final Value<String?> codexId;
  final Value<int> roleId;
  final Value<UnitStats> stats;
  final Value<int> rowid;
  const UnitsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.armyId = const Value.absent(),
    this.codexId = const Value.absent(),
    this.roleId = const Value.absent(),
    this.stats = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnitsCompanion.insert({
    required String id,
    required String name,
    required int armyId,
    this.codexId = const Value.absent(),
    required int roleId,
    required UnitStats stats,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       armyId = Value(armyId),
       roleId = Value(roleId),
       stats = Value(stats);
  static Insertable<UnitRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? armyId,
    Expression<String>? codexId,
    Expression<int>? roleId,
    Expression<String>? stats,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (armyId != null) 'army_id': armyId,
      if (codexId != null) 'codex_id': codexId,
      if (roleId != null) 'role_id': roleId,
      if (stats != null) 'stats': stats,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnitsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<int>? armyId,
    Value<String?>? codexId,
    Value<int>? roleId,
    Value<UnitStats>? stats,
    Value<int>? rowid,
  }) {
    return UnitsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      armyId: armyId ?? this.armyId,
      codexId: codexId ?? this.codexId,
      roleId: roleId ?? this.roleId,
      stats: stats ?? this.stats,
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
    if (armyId.present) {
      map['army_id'] = Variable<int>(armyId.value);
    }
    if (codexId.present) {
      map['codex_id'] = Variable<String>(codexId.value);
    }
    if (roleId.present) {
      map['role_id'] = Variable<int>(roleId.value);
    }
    if (stats.present) {
      map['stats'] = Variable<String>(
        $UnitsTable.$converterstats.toSql(stats.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('armyId: $armyId, ')
          ..write('codexId: $codexId, ')
          ..write('roleId: $roleId, ')
          ..write('stats: $stats, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DetachmentsTable extends Detachments
    with TableInfo<$DetachmentsTable, DetachmentRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DetachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _armyIdMeta = const VerificationMeta('armyId');
  @override
  late final GeneratedColumn<int> armyId = GeneratedColumn<int>(
    'army_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES armies (id)',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ruleNameMeta = const VerificationMeta(
    'ruleName',
  );
  @override
  late final GeneratedColumn<String> ruleName = GeneratedColumn<String>(
    'rule_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(minTextLength: 1),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ruleShortMeta = const VerificationMeta(
    'ruleShort',
  );
  @override
  late final GeneratedColumn<String> ruleShort = GeneratedColumn<String>(
    'rule_short',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ruleFullMeta = const VerificationMeta(
    'ruleFull',
  );
  @override
  late final GeneratedColumn<String> ruleFull = GeneratedColumn<String>(
    'rule_full',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    armyId,
    code,
    name,
    description,
    ruleName,
    ruleShort,
    ruleFull,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'detachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<DetachmentRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('army_id')) {
      context.handle(
        _armyIdMeta,
        armyId.isAcceptableOrUnknown(data['army_id']!, _armyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_armyIdMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('rule_name')) {
      context.handle(
        _ruleNameMeta,
        ruleName.isAcceptableOrUnknown(data['rule_name']!, _ruleNameMeta),
      );
    } else if (isInserting) {
      context.missing(_ruleNameMeta);
    }
    if (data.containsKey('rule_short')) {
      context.handle(
        _ruleShortMeta,
        ruleShort.isAcceptableOrUnknown(data['rule_short']!, _ruleShortMeta),
      );
    } else if (isInserting) {
      context.missing(_ruleShortMeta);
    }
    if (data.containsKey('rule_full')) {
      context.handle(
        _ruleFullMeta,
        ruleFull.isAcceptableOrUnknown(data['rule_full']!, _ruleFullMeta),
      );
    } else if (isInserting) {
      context.missing(_ruleFullMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DetachmentRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DetachmentRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      armyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}army_id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      ruleName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rule_name'],
      )!,
      ruleShort: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rule_short'],
      )!,
      ruleFull: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rule_full'],
      )!,
    );
  }

  @override
  $DetachmentsTable createAlias(String alias) {
    return $DetachmentsTable(attachedDatabase, alias);
  }
}

class DetachmentRow extends DataClass implements Insertable<DetachmentRow> {
  final String id;
  final int armyId;
  final String code;
  final String name;
  final String description;
  final String ruleName;
  final String ruleShort;
  final String ruleFull;
  const DetachmentRow({
    required this.id,
    required this.armyId,
    required this.code,
    required this.name,
    required this.description,
    required this.ruleName,
    required this.ruleShort,
    required this.ruleFull,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['army_id'] = Variable<int>(armyId);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['rule_name'] = Variable<String>(ruleName);
    map['rule_short'] = Variable<String>(ruleShort);
    map['rule_full'] = Variable<String>(ruleFull);
    return map;
  }

  DetachmentsCompanion toCompanion(bool nullToAbsent) {
    return DetachmentsCompanion(
      id: Value(id),
      armyId: Value(armyId),
      code: Value(code),
      name: Value(name),
      description: Value(description),
      ruleName: Value(ruleName),
      ruleShort: Value(ruleShort),
      ruleFull: Value(ruleFull),
    );
  }

  factory DetachmentRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DetachmentRow(
      id: serializer.fromJson<String>(json['id']),
      armyId: serializer.fromJson<int>(json['armyId']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      ruleName: serializer.fromJson<String>(json['ruleName']),
      ruleShort: serializer.fromJson<String>(json['ruleShort']),
      ruleFull: serializer.fromJson<String>(json['ruleFull']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'armyId': serializer.toJson<int>(armyId),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'ruleName': serializer.toJson<String>(ruleName),
      'ruleShort': serializer.toJson<String>(ruleShort),
      'ruleFull': serializer.toJson<String>(ruleFull),
    };
  }

  DetachmentRow copyWith({
    String? id,
    int? armyId,
    String? code,
    String? name,
    String? description,
    String? ruleName,
    String? ruleShort,
    String? ruleFull,
  }) => DetachmentRow(
    id: id ?? this.id,
    armyId: armyId ?? this.armyId,
    code: code ?? this.code,
    name: name ?? this.name,
    description: description ?? this.description,
    ruleName: ruleName ?? this.ruleName,
    ruleShort: ruleShort ?? this.ruleShort,
    ruleFull: ruleFull ?? this.ruleFull,
  );
  DetachmentRow copyWithCompanion(DetachmentsCompanion data) {
    return DetachmentRow(
      id: data.id.present ? data.id.value : this.id,
      armyId: data.armyId.present ? data.armyId.value : this.armyId,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      ruleName: data.ruleName.present ? data.ruleName.value : this.ruleName,
      ruleShort: data.ruleShort.present ? data.ruleShort.value : this.ruleShort,
      ruleFull: data.ruleFull.present ? data.ruleFull.value : this.ruleFull,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DetachmentRow(')
          ..write('id: $id, ')
          ..write('armyId: $armyId, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('ruleName: $ruleName, ')
          ..write('ruleShort: $ruleShort, ')
          ..write('ruleFull: $ruleFull')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    armyId,
    code,
    name,
    description,
    ruleName,
    ruleShort,
    ruleFull,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetachmentRow &&
          other.id == this.id &&
          other.armyId == this.armyId &&
          other.code == this.code &&
          other.name == this.name &&
          other.description == this.description &&
          other.ruleName == this.ruleName &&
          other.ruleShort == this.ruleShort &&
          other.ruleFull == this.ruleFull);
}

class DetachmentsCompanion extends UpdateCompanion<DetachmentRow> {
  final Value<String> id;
  final Value<int> armyId;
  final Value<String> code;
  final Value<String> name;
  final Value<String> description;
  final Value<String> ruleName;
  final Value<String> ruleShort;
  final Value<String> ruleFull;
  final Value<int> rowid;
  const DetachmentsCompanion({
    this.id = const Value.absent(),
    this.armyId = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.ruleName = const Value.absent(),
    this.ruleShort = const Value.absent(),
    this.ruleFull = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DetachmentsCompanion.insert({
    required String id,
    required int armyId,
    required String code,
    required String name,
    required String description,
    required String ruleName,
    required String ruleShort,
    required String ruleFull,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       armyId = Value(armyId),
       code = Value(code),
       name = Value(name),
       description = Value(description),
       ruleName = Value(ruleName),
       ruleShort = Value(ruleShort),
       ruleFull = Value(ruleFull);
  static Insertable<DetachmentRow> custom({
    Expression<String>? id,
    Expression<int>? armyId,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? ruleName,
    Expression<String>? ruleShort,
    Expression<String>? ruleFull,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (armyId != null) 'army_id': armyId,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (ruleName != null) 'rule_name': ruleName,
      if (ruleShort != null) 'rule_short': ruleShort,
      if (ruleFull != null) 'rule_full': ruleFull,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DetachmentsCompanion copyWith({
    Value<String>? id,
    Value<int>? armyId,
    Value<String>? code,
    Value<String>? name,
    Value<String>? description,
    Value<String>? ruleName,
    Value<String>? ruleShort,
    Value<String>? ruleFull,
    Value<int>? rowid,
  }) {
    return DetachmentsCompanion(
      id: id ?? this.id,
      armyId: armyId ?? this.armyId,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      ruleName: ruleName ?? this.ruleName,
      ruleShort: ruleShort ?? this.ruleShort,
      ruleFull: ruleFull ?? this.ruleFull,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (armyId.present) {
      map['army_id'] = Variable<int>(armyId.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (ruleName.present) {
      map['rule_name'] = Variable<String>(ruleName.value);
    }
    if (ruleShort.present) {
      map['rule_short'] = Variable<String>(ruleShort.value);
    }
    if (ruleFull.present) {
      map['rule_full'] = Variable<String>(ruleFull.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DetachmentsCompanion(')
          ..write('id: $id, ')
          ..write('armyId: $armyId, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('ruleName: $ruleName, ')
          ..write('ruleShort: $ruleShort, ')
          ..write('ruleFull: $ruleFull, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CodexDetachmentsTable extends CodexDetachments
    with TableInfo<$CodexDetachmentsTable, CodexDetachment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CodexDetachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codexIdMeta = const VerificationMeta(
    'codexId',
  );
  @override
  late final GeneratedColumn<String> codexId = GeneratedColumn<String>(
    'codex_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES codexes (id)',
    ),
  );
  static const VerificationMeta _detachmentIdMeta = const VerificationMeta(
    'detachmentId',
  );
  @override
  late final GeneratedColumn<String> detachmentId = GeneratedColumn<String>(
    'detachment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES detachments (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [codexId, detachmentId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'codex_detachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<CodexDetachment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codex_id')) {
      context.handle(
        _codexIdMeta,
        codexId.isAcceptableOrUnknown(data['codex_id']!, _codexIdMeta),
      );
    } else if (isInserting) {
      context.missing(_codexIdMeta);
    }
    if (data.containsKey('detachment_id')) {
      context.handle(
        _detachmentIdMeta,
        detachmentId.isAcceptableOrUnknown(
          data['detachment_id']!,
          _detachmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_detachmentIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codexId, detachmentId};
  @override
  CodexDetachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CodexDetachment(
      codexId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codex_id'],
      )!,
      detachmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}detachment_id'],
      )!,
    );
  }

  @override
  $CodexDetachmentsTable createAlias(String alias) {
    return $CodexDetachmentsTable(attachedDatabase, alias);
  }
}

class CodexDetachment extends DataClass implements Insertable<CodexDetachment> {
  final String codexId;
  final String detachmentId;
  const CodexDetachment({required this.codexId, required this.detachmentId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['codex_id'] = Variable<String>(codexId);
    map['detachment_id'] = Variable<String>(detachmentId);
    return map;
  }

  CodexDetachmentsCompanion toCompanion(bool nullToAbsent) {
    return CodexDetachmentsCompanion(
      codexId: Value(codexId),
      detachmentId: Value(detachmentId),
    );
  }

  factory CodexDetachment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CodexDetachment(
      codexId: serializer.fromJson<String>(json['codexId']),
      detachmentId: serializer.fromJson<String>(json['detachmentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codexId': serializer.toJson<String>(codexId),
      'detachmentId': serializer.toJson<String>(detachmentId),
    };
  }

  CodexDetachment copyWith({String? codexId, String? detachmentId}) =>
      CodexDetachment(
        codexId: codexId ?? this.codexId,
        detachmentId: detachmentId ?? this.detachmentId,
      );
  CodexDetachment copyWithCompanion(CodexDetachmentsCompanion data) {
    return CodexDetachment(
      codexId: data.codexId.present ? data.codexId.value : this.codexId,
      detachmentId: data.detachmentId.present
          ? data.detachmentId.value
          : this.detachmentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CodexDetachment(')
          ..write('codexId: $codexId, ')
          ..write('detachmentId: $detachmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codexId, detachmentId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CodexDetachment &&
          other.codexId == this.codexId &&
          other.detachmentId == this.detachmentId);
}

class CodexDetachmentsCompanion extends UpdateCompanion<CodexDetachment> {
  final Value<String> codexId;
  final Value<String> detachmentId;
  final Value<int> rowid;
  const CodexDetachmentsCompanion({
    this.codexId = const Value.absent(),
    this.detachmentId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CodexDetachmentsCompanion.insert({
    required String codexId,
    required String detachmentId,
    this.rowid = const Value.absent(),
  }) : codexId = Value(codexId),
       detachmentId = Value(detachmentId);
  static Insertable<CodexDetachment> custom({
    Expression<String>? codexId,
    Expression<String>? detachmentId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (codexId != null) 'codex_id': codexId,
      if (detachmentId != null) 'detachment_id': detachmentId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CodexDetachmentsCompanion copyWith({
    Value<String>? codexId,
    Value<String>? detachmentId,
    Value<int>? rowid,
  }) {
    return CodexDetachmentsCompanion(
      codexId: codexId ?? this.codexId,
      detachmentId: detachmentId ?? this.detachmentId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codexId.present) {
      map['codex_id'] = Variable<String>(codexId.value);
    }
    if (detachmentId.present) {
      map['detachment_id'] = Variable<String>(detachmentId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CodexDetachmentsCompanion(')
          ..write('codexId: $codexId, ')
          ..write('detachmentId: $detachmentId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EnhancementsTable extends Enhancements
    with TableInfo<$EnhancementsTable, Enhancement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnhancementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
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
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detachmentIdMeta = const VerificationMeta(
    'detachmentId',
  );
  @override
  late final GeneratedColumn<String> detachmentId = GeneratedColumn<String>(
    'detachment_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES detachments (id)',
    ),
  );
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
    'points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    description,
    detachmentId,
    points,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'enhancements';
  @override
  VerificationContext validateIntegrity(
    Insertable<Enhancement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('detachment_id')) {
      context.handle(
        _detachmentIdMeta,
        detachmentId.isAcceptableOrUnknown(
          data['detachment_id']!,
          _detachmentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_detachmentIdMeta);
    }
    if (data.containsKey('points')) {
      context.handle(
        _pointsMeta,
        points.isAcceptableOrUnknown(data['points']!, _pointsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {code, detachmentId},
  ];
  @override
  Enhancement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Enhancement(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      detachmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}detachment_id'],
      )!,
      points: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points'],
      )!,
    );
  }

  @override
  $EnhancementsTable createAlias(String alias) {
    return $EnhancementsTable(attachedDatabase, alias);
  }
}

class Enhancement extends DataClass implements Insertable<Enhancement> {
  final String id;
  final String code;
  final String name;
  final String description;
  final String detachmentId;
  final int points;
  const Enhancement({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.detachmentId,
    required this.points,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['detachment_id'] = Variable<String>(detachmentId);
    map['points'] = Variable<int>(points);
    return map;
  }

  EnhancementsCompanion toCompanion(bool nullToAbsent) {
    return EnhancementsCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      description: Value(description),
      detachmentId: Value(detachmentId),
      points: Value(points),
    );
  }

  factory Enhancement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Enhancement(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      detachmentId: serializer.fromJson<String>(json['detachmentId']),
      points: serializer.fromJson<int>(json['points']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'detachmentId': serializer.toJson<String>(detachmentId),
      'points': serializer.toJson<int>(points),
    };
  }

  Enhancement copyWith({
    String? id,
    String? code,
    String? name,
    String? description,
    String? detachmentId,
    int? points,
  }) => Enhancement(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    description: description ?? this.description,
    detachmentId: detachmentId ?? this.detachmentId,
    points: points ?? this.points,
  );
  Enhancement copyWithCompanion(EnhancementsCompanion data) {
    return Enhancement(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      detachmentId: data.detachmentId.present
          ? data.detachmentId.value
          : this.detachmentId,
      points: data.points.present ? data.points.value : this.points,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Enhancement(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('detachmentId: $detachmentId, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, code, name, description, detachmentId, points);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Enhancement &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.description == this.description &&
          other.detachmentId == this.detachmentId &&
          other.points == this.points);
}

class EnhancementsCompanion extends UpdateCompanion<Enhancement> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> description;
  final Value<String> detachmentId;
  final Value<int> points;
  final Value<int> rowid;
  const EnhancementsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.detachmentId = const Value.absent(),
    this.points = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EnhancementsCompanion.insert({
    required String id,
    required String code,
    required String name,
    required String description,
    required String detachmentId,
    this.points = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       name = Value(name),
       description = Value(description),
       detachmentId = Value(detachmentId);
  static Insertable<Enhancement> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? detachmentId,
    Expression<int>? points,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (detachmentId != null) 'detachment_id': detachmentId,
      if (points != null) 'points': points,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EnhancementsCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String>? description,
    Value<String>? detachmentId,
    Value<int>? points,
    Value<int>? rowid,
  }) {
    return EnhancementsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      detachmentId: detachmentId ?? this.detachmentId,
      points: points ?? this.points,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (detachmentId.present) {
      map['detachment_id'] = Variable<String>(detachmentId.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnhancementsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('detachmentId: $detachmentId, ')
          ..write('points: $points, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StrategemsTable extends Strategems
    with TableInfo<$StrategemsTable, Strategem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StrategemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
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
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cpCostMeta = const VerificationMeta('cpCost');
  @override
  late final GeneratedColumn<int> cpCost = GeneratedColumn<int>(
    'cp_cost',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phaseMeta = const VerificationMeta('phase');
  @override
  late final GeneratedColumn<String> phase = GeneratedColumn<String>(
    'phase',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetMeta = const VerificationMeta('target');
  @override
  late final GeneratedColumn<String> target = GeneratedColumn<String>(
    'target',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _effectMeta = const VerificationMeta('effect');
  @override
  late final GeneratedColumn<String> effect = GeneratedColumn<String>(
    'effect',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codexIdMeta = const VerificationMeta(
    'codexId',
  );
  @override
  late final GeneratedColumn<String> codexId = GeneratedColumn<String>(
    'codex_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES codexes (id)',
    ),
  );
  static const VerificationMeta _detachmentIdMeta = const VerificationMeta(
    'detachmentId',
  );
  @override
  late final GeneratedColumn<String> detachmentId = GeneratedColumn<String>(
    'detachment_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES detachments (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    description,
    cpCost,
    phase,
    target,
    effect,
    codexId,
    detachmentId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'strategems';
  @override
  VerificationContext validateIntegrity(
    Insertable<Strategem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('cp_cost')) {
      context.handle(
        _cpCostMeta,
        cpCost.isAcceptableOrUnknown(data['cp_cost']!, _cpCostMeta),
      );
    } else if (isInserting) {
      context.missing(_cpCostMeta);
    }
    if (data.containsKey('phase')) {
      context.handle(
        _phaseMeta,
        phase.isAcceptableOrUnknown(data['phase']!, _phaseMeta),
      );
    } else if (isInserting) {
      context.missing(_phaseMeta);
    }
    if (data.containsKey('target')) {
      context.handle(
        _targetMeta,
        target.isAcceptableOrUnknown(data['target']!, _targetMeta),
      );
    } else if (isInserting) {
      context.missing(_targetMeta);
    }
    if (data.containsKey('effect')) {
      context.handle(
        _effectMeta,
        effect.isAcceptableOrUnknown(data['effect']!, _effectMeta),
      );
    } else if (isInserting) {
      context.missing(_effectMeta);
    }
    if (data.containsKey('codex_id')) {
      context.handle(
        _codexIdMeta,
        codexId.isAcceptableOrUnknown(data['codex_id']!, _codexIdMeta),
      );
    } else if (isInserting) {
      context.missing(_codexIdMeta);
    }
    if (data.containsKey('detachment_id')) {
      context.handle(
        _detachmentIdMeta,
        detachmentId.isAcceptableOrUnknown(
          data['detachment_id']!,
          _detachmentIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Strategem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Strategem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      cpCost: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cp_cost'],
      )!,
      phase: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phase'],
      )!,
      target: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target'],
      )!,
      effect: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}effect'],
      )!,
      codexId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codex_id'],
      )!,
      detachmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}detachment_id'],
      ),
    );
  }

  @override
  $StrategemsTable createAlias(String alias) {
    return $StrategemsTable(attachedDatabase, alias);
  }
}

class Strategem extends DataClass implements Insertable<Strategem> {
  final int id;
  final String code;
  final String name;
  final String description;
  final int cpCost;
  final String phase;
  final String target;
  final String effect;

  /// FK → Codex
  /// Исправлено: text() так как Codexes.id это UUID строка
  final String codexId;

  /// FK → Detachment (optional)
  final String? detachmentId;
  const Strategem({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.cpCost,
    required this.phase,
    required this.target,
    required this.effect,
    required this.codexId,
    this.detachmentId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['cp_cost'] = Variable<int>(cpCost);
    map['phase'] = Variable<String>(phase);
    map['target'] = Variable<String>(target);
    map['effect'] = Variable<String>(effect);
    map['codex_id'] = Variable<String>(codexId);
    if (!nullToAbsent || detachmentId != null) {
      map['detachment_id'] = Variable<String>(detachmentId);
    }
    return map;
  }

  StrategemsCompanion toCompanion(bool nullToAbsent) {
    return StrategemsCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      description: Value(description),
      cpCost: Value(cpCost),
      phase: Value(phase),
      target: Value(target),
      effect: Value(effect),
      codexId: Value(codexId),
      detachmentId: detachmentId == null && nullToAbsent
          ? const Value.absent()
          : Value(detachmentId),
    );
  }

  factory Strategem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Strategem(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      cpCost: serializer.fromJson<int>(json['cpCost']),
      phase: serializer.fromJson<String>(json['phase']),
      target: serializer.fromJson<String>(json['target']),
      effect: serializer.fromJson<String>(json['effect']),
      codexId: serializer.fromJson<String>(json['codexId']),
      detachmentId: serializer.fromJson<String?>(json['detachmentId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'cpCost': serializer.toJson<int>(cpCost),
      'phase': serializer.toJson<String>(phase),
      'target': serializer.toJson<String>(target),
      'effect': serializer.toJson<String>(effect),
      'codexId': serializer.toJson<String>(codexId),
      'detachmentId': serializer.toJson<String?>(detachmentId),
    };
  }

  Strategem copyWith({
    int? id,
    String? code,
    String? name,
    String? description,
    int? cpCost,
    String? phase,
    String? target,
    String? effect,
    String? codexId,
    Value<String?> detachmentId = const Value.absent(),
  }) => Strategem(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    description: description ?? this.description,
    cpCost: cpCost ?? this.cpCost,
    phase: phase ?? this.phase,
    target: target ?? this.target,
    effect: effect ?? this.effect,
    codexId: codexId ?? this.codexId,
    detachmentId: detachmentId.present ? detachmentId.value : this.detachmentId,
  );
  Strategem copyWithCompanion(StrategemsCompanion data) {
    return Strategem(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      cpCost: data.cpCost.present ? data.cpCost.value : this.cpCost,
      phase: data.phase.present ? data.phase.value : this.phase,
      target: data.target.present ? data.target.value : this.target,
      effect: data.effect.present ? data.effect.value : this.effect,
      codexId: data.codexId.present ? data.codexId.value : this.codexId,
      detachmentId: data.detachmentId.present
          ? data.detachmentId.value
          : this.detachmentId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Strategem(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('cpCost: $cpCost, ')
          ..write('phase: $phase, ')
          ..write('target: $target, ')
          ..write('effect: $effect, ')
          ..write('codexId: $codexId, ')
          ..write('detachmentId: $detachmentId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    code,
    name,
    description,
    cpCost,
    phase,
    target,
    effect,
    codexId,
    detachmentId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Strategem &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.description == this.description &&
          other.cpCost == this.cpCost &&
          other.phase == this.phase &&
          other.target == this.target &&
          other.effect == this.effect &&
          other.codexId == this.codexId &&
          other.detachmentId == this.detachmentId);
}

class StrategemsCompanion extends UpdateCompanion<Strategem> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> description;
  final Value<int> cpCost;
  final Value<String> phase;
  final Value<String> target;
  final Value<String> effect;
  final Value<String> codexId;
  final Value<String?> detachmentId;
  const StrategemsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.cpCost = const Value.absent(),
    this.phase = const Value.absent(),
    this.target = const Value.absent(),
    this.effect = const Value.absent(),
    this.codexId = const Value.absent(),
    this.detachmentId = const Value.absent(),
  });
  StrategemsCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    required String description,
    required int cpCost,
    required String phase,
    required String target,
    required String effect,
    required String codexId,
    this.detachmentId = const Value.absent(),
  }) : code = Value(code),
       name = Value(name),
       description = Value(description),
       cpCost = Value(cpCost),
       phase = Value(phase),
       target = Value(target),
       effect = Value(effect),
       codexId = Value(codexId);
  static Insertable<Strategem> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? cpCost,
    Expression<String>? phase,
    Expression<String>? target,
    Expression<String>? effect,
    Expression<String>? codexId,
    Expression<String>? detachmentId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (cpCost != null) 'cp_cost': cpCost,
      if (phase != null) 'phase': phase,
      if (target != null) 'target': target,
      if (effect != null) 'effect': effect,
      if (codexId != null) 'codex_id': codexId,
      if (detachmentId != null) 'detachment_id': detachmentId,
    });
  }

  StrategemsCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String>? description,
    Value<int>? cpCost,
    Value<String>? phase,
    Value<String>? target,
    Value<String>? effect,
    Value<String>? codexId,
    Value<String?>? detachmentId,
  }) {
    return StrategemsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      cpCost: cpCost ?? this.cpCost,
      phase: phase ?? this.phase,
      target: target ?? this.target,
      effect: effect ?? this.effect,
      codexId: codexId ?? this.codexId,
      detachmentId: detachmentId ?? this.detachmentId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (cpCost.present) {
      map['cp_cost'] = Variable<int>(cpCost.value);
    }
    if (phase.present) {
      map['phase'] = Variable<String>(phase.value);
    }
    if (target.present) {
      map['target'] = Variable<String>(target.value);
    }
    if (effect.present) {
      map['effect'] = Variable<String>(effect.value);
    }
    if (codexId.present) {
      map['codex_id'] = Variable<String>(codexId.value);
    }
    if (detachmentId.present) {
      map['detachment_id'] = Variable<String>(detachmentId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StrategemsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('cpCost: $cpCost, ')
          ..write('phase: $phase, ')
          ..write('target: $target, ')
          ..write('effect: $effect, ')
          ..write('codexId: $codexId, ')
          ..write('detachmentId: $detachmentId')
          ..write(')'))
        .toString();
  }
}

class $WeaponAbilitiesTable extends WeaponAbilities
    with TableInfo<$WeaponAbilitiesTable, WeaponAbilitiesRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeaponAbilitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
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
  static const VerificationMeta _shortDescriptionMeta = const VerificationMeta(
    'shortDescription',
  );
  @override
  late final GeneratedColumn<String> shortDescription = GeneratedColumn<String>(
    'short_description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    shortDescription,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weapon_abilities';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeaponAbilitiesRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('short_description')) {
      context.handle(
        _shortDescriptionMeta,
        shortDescription.isAcceptableOrUnknown(
          data['short_description']!,
          _shortDescriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shortDescriptionMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeaponAbilitiesRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeaponAbilitiesRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      shortDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_description'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
    );
  }

  @override
  $WeaponAbilitiesTable createAlias(String alias) {
    return $WeaponAbilitiesTable(attachedDatabase, alias);
  }
}

class WeaponAbilitiesRow extends DataClass
    implements Insertable<WeaponAbilitiesRow> {
  final String id;
  final String code;
  final String name;
  final String shortDescription;
  final String description;
  const WeaponAbilitiesRow({
    required this.id,
    required this.code,
    required this.name,
    required this.shortDescription,
    required this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['short_description'] = Variable<String>(shortDescription);
    map['description'] = Variable<String>(description);
    return map;
  }

  WeaponAbilitiesCompanion toCompanion(bool nullToAbsent) {
    return WeaponAbilitiesCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      shortDescription: Value(shortDescription),
      description: Value(description),
    );
  }

  factory WeaponAbilitiesRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeaponAbilitiesRow(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      shortDescription: serializer.fromJson<String>(json['shortDescription']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'shortDescription': serializer.toJson<String>(shortDescription),
      'description': serializer.toJson<String>(description),
    };
  }

  WeaponAbilitiesRow copyWith({
    String? id,
    String? code,
    String? name,
    String? shortDescription,
    String? description,
  }) => WeaponAbilitiesRow(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    shortDescription: shortDescription ?? this.shortDescription,
    description: description ?? this.description,
  );
  WeaponAbilitiesRow copyWithCompanion(WeaponAbilitiesCompanion data) {
    return WeaponAbilitiesRow(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      shortDescription: data.shortDescription.present
          ? data.shortDescription.value
          : this.shortDescription,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeaponAbilitiesRow(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, code, name, shortDescription, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeaponAbilitiesRow &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.shortDescription == this.shortDescription &&
          other.description == this.description);
}

class WeaponAbilitiesCompanion extends UpdateCompanion<WeaponAbilitiesRow> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> shortDescription;
  final Value<String> description;
  final Value<int> rowid;
  const WeaponAbilitiesCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.shortDescription = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WeaponAbilitiesCompanion.insert({
    required String id,
    required String code,
    required String name,
    required String shortDescription,
    required String description,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       name = Value(name),
       shortDescription = Value(shortDescription),
       description = Value(description);
  static Insertable<WeaponAbilitiesRow> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? shortDescription,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (shortDescription != null) 'short_description': shortDescription,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WeaponAbilitiesCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String>? shortDescription,
    Value<String>? description,
    Value<int>? rowid,
  }) {
    return WeaponAbilitiesCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      shortDescription: shortDescription ?? this.shortDescription,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (shortDescription.present) {
      map['short_description'] = Variable<String>(shortDescription.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeaponAbilitiesCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UnitAbilitiesTable extends UnitAbilities
    with TableInfo<$UnitAbilitiesTable, UnitAbilitiesRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitAbilitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
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
  static const VerificationMeta _shortDescriptionMeta = const VerificationMeta(
    'shortDescription',
  );
  @override
  late final GeneratedColumn<String> shortDescription = GeneratedColumn<String>(
    'short_description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    code,
    name,
    shortDescription,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unit_abilities';
  @override
  VerificationContext validateIntegrity(
    Insertable<UnitAbilitiesRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('short_description')) {
      context.handle(
        _shortDescriptionMeta,
        shortDescription.isAcceptableOrUnknown(
          data['short_description']!,
          _shortDescriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_shortDescriptionMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UnitAbilitiesRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnitAbilitiesRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      shortDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}short_description'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
    );
  }

  @override
  $UnitAbilitiesTable createAlias(String alias) {
    return $UnitAbilitiesTable(attachedDatabase, alias);
  }
}

class UnitAbilitiesRow extends DataClass
    implements Insertable<UnitAbilitiesRow> {
  final String id;
  final String code;
  final String name;
  final String shortDescription;
  final String description;
  const UnitAbilitiesRow({
    required this.id,
    required this.code,
    required this.name,
    required this.shortDescription,
    required this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['short_description'] = Variable<String>(shortDescription);
    map['description'] = Variable<String>(description);
    return map;
  }

  UnitAbilitiesCompanion toCompanion(bool nullToAbsent) {
    return UnitAbilitiesCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      shortDescription: Value(shortDescription),
      description: Value(description),
    );
  }

  factory UnitAbilitiesRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnitAbilitiesRow(
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      shortDescription: serializer.fromJson<String>(json['shortDescription']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'shortDescription': serializer.toJson<String>(shortDescription),
      'description': serializer.toJson<String>(description),
    };
  }

  UnitAbilitiesRow copyWith({
    String? id,
    String? code,
    String? name,
    String? shortDescription,
    String? description,
  }) => UnitAbilitiesRow(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    shortDescription: shortDescription ?? this.shortDescription,
    description: description ?? this.description,
  );
  UnitAbilitiesRow copyWithCompanion(UnitAbilitiesCompanion data) {
    return UnitAbilitiesRow(
      id: data.id.present ? data.id.value : this.id,
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      shortDescription: data.shortDescription.present
          ? data.shortDescription.value
          : this.shortDescription,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnitAbilitiesRow(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, code, name, shortDescription, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnitAbilitiesRow &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.shortDescription == this.shortDescription &&
          other.description == this.description);
}

class UnitAbilitiesCompanion extends UpdateCompanion<UnitAbilitiesRow> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> shortDescription;
  final Value<String> description;
  final Value<int> rowid;
  const UnitAbilitiesCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.shortDescription = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UnitAbilitiesCompanion.insert({
    required String id,
    required String code,
    required String name,
    required String shortDescription,
    required String description,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       name = Value(name),
       shortDescription = Value(shortDescription),
       description = Value(description);
  static Insertable<UnitAbilitiesRow> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? shortDescription,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (shortDescription != null) 'short_description': shortDescription,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UnitAbilitiesCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String>? shortDescription,
    Value<String>? description,
    Value<int>? rowid,
  }) {
    return UnitAbilitiesCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      shortDescription: shortDescription ?? this.shortDescription,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (shortDescription.present) {
      map['short_description'] = Variable<String>(shortDescription.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitAbilitiesCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserArmiesTable extends UserArmies
    with TableInfo<$UserArmiesTable, UserArmyRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserArmiesTable(this.attachedDatabase, [this._alias]);
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
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codexIdMeta = const VerificationMeta(
    'codexId',
  );
  @override
  late final GeneratedColumn<String> codexId = GeneratedColumn<String>(
    'codex_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES codexes (id)',
    ),
  );
  static const VerificationMeta _totalPointsMeta = const VerificationMeta(
    'totalPoints',
  );
  @override
  late final GeneratedColumn<int> totalPoints = GeneratedColumn<int>(
    'total_points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _jsonDataMeta = const VerificationMeta(
    'jsonData',
  );
  @override
  late final GeneratedColumn<String> jsonData = GeneratedColumn<String>(
    'json_data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    codexId,
    totalPoints,
    jsonData,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_armies';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserArmyRow> instance, {
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
    if (data.containsKey('codex_id')) {
      context.handle(
        _codexIdMeta,
        codexId.isAcceptableOrUnknown(data['codex_id']!, _codexIdMeta),
      );
    } else if (isInserting) {
      context.missing(_codexIdMeta);
    }
    if (data.containsKey('total_points')) {
      context.handle(
        _totalPointsMeta,
        totalPoints.isAcceptableOrUnknown(
          data['total_points']!,
          _totalPointsMeta,
        ),
      );
    }
    if (data.containsKey('json_data')) {
      context.handle(
        _jsonDataMeta,
        jsonData.isAcceptableOrUnknown(data['json_data']!, _jsonDataMeta),
      );
    } else if (isInserting) {
      context.missing(_jsonDataMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserArmyRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserArmyRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      codexId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codex_id'],
      )!,
      totalPoints: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_points'],
      )!,
      jsonData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}json_data'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UserArmiesTable createAlias(String alias) {
    return $UserArmiesTable(attachedDatabase, alias);
  }
}

class UserArmyRow extends DataClass implements Insertable<UserArmyRow> {
  final String id;
  final String name;
  final String codexId;
  final int totalPoints;
  final String jsonData;
  final DateTime createdAt;
  const UserArmyRow({
    required this.id,
    required this.name,
    required this.codexId,
    required this.totalPoints,
    required this.jsonData,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['codex_id'] = Variable<String>(codexId);
    map['total_points'] = Variable<int>(totalPoints);
    map['json_data'] = Variable<String>(jsonData);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UserArmiesCompanion toCompanion(bool nullToAbsent) {
    return UserArmiesCompanion(
      id: Value(id),
      name: Value(name),
      codexId: Value(codexId),
      totalPoints: Value(totalPoints),
      jsonData: Value(jsonData),
      createdAt: Value(createdAt),
    );
  }

  factory UserArmyRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserArmyRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      codexId: serializer.fromJson<String>(json['codexId']),
      totalPoints: serializer.fromJson<int>(json['totalPoints']),
      jsonData: serializer.fromJson<String>(json['jsonData']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'codexId': serializer.toJson<String>(codexId),
      'totalPoints': serializer.toJson<int>(totalPoints),
      'jsonData': serializer.toJson<String>(jsonData),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  UserArmyRow copyWith({
    String? id,
    String? name,
    String? codexId,
    int? totalPoints,
    String? jsonData,
    DateTime? createdAt,
  }) => UserArmyRow(
    id: id ?? this.id,
    name: name ?? this.name,
    codexId: codexId ?? this.codexId,
    totalPoints: totalPoints ?? this.totalPoints,
    jsonData: jsonData ?? this.jsonData,
    createdAt: createdAt ?? this.createdAt,
  );
  UserArmyRow copyWithCompanion(UserArmiesCompanion data) {
    return UserArmyRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      codexId: data.codexId.present ? data.codexId.value : this.codexId,
      totalPoints: data.totalPoints.present
          ? data.totalPoints.value
          : this.totalPoints,
      jsonData: data.jsonData.present ? data.jsonData.value : this.jsonData,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserArmyRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('codexId: $codexId, ')
          ..write('totalPoints: $totalPoints, ')
          ..write('jsonData: $jsonData, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, codexId, totalPoints, jsonData, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserArmyRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.codexId == this.codexId &&
          other.totalPoints == this.totalPoints &&
          other.jsonData == this.jsonData &&
          other.createdAt == this.createdAt);
}

class UserArmiesCompanion extends UpdateCompanion<UserArmyRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> codexId;
  final Value<int> totalPoints;
  final Value<String> jsonData;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const UserArmiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.codexId = const Value.absent(),
    this.totalPoints = const Value.absent(),
    this.jsonData = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserArmiesCompanion.insert({
    required String id,
    required String name,
    required String codexId,
    this.totalPoints = const Value.absent(),
    required String jsonData,
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       codexId = Value(codexId),
       jsonData = Value(jsonData);
  static Insertable<UserArmyRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? codexId,
    Expression<int>? totalPoints,
    Expression<String>? jsonData,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (codexId != null) 'codex_id': codexId,
      if (totalPoints != null) 'total_points': totalPoints,
      if (jsonData != null) 'json_data': jsonData,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserArmiesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? codexId,
    Value<int>? totalPoints,
    Value<String>? jsonData,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return UserArmiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      codexId: codexId ?? this.codexId,
      totalPoints: totalPoints ?? this.totalPoints,
      jsonData: jsonData ?? this.jsonData,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (codexId.present) {
      map['codex_id'] = Variable<String>(codexId.value);
    }
    if (totalPoints.present) {
      map['total_points'] = Variable<int>(totalPoints.value);
    }
    if (jsonData.present) {
      map['json_data'] = Variable<String>(jsonData.value);
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
    return (StringBuffer('UserArmiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('codexId: $codexId, ')
          ..write('totalPoints: $totalPoints, ')
          ..write('jsonData: $jsonData, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FactionsTable factions = $FactionsTable(this);
  late final $ArmiesTable armies = $ArmiesTable(this);
  late final $CodexesTable codexes = $CodexesTable(this);
  late final $RoleTable role = $RoleTable(this);
  late final $UnitsTable units = $UnitsTable(this);
  late final $DetachmentsTable detachments = $DetachmentsTable(this);
  late final $CodexDetachmentsTable codexDetachments = $CodexDetachmentsTable(
    this,
  );
  late final $EnhancementsTable enhancements = $EnhancementsTable(this);
  late final $StrategemsTable strategems = $StrategemsTable(this);
  late final $WeaponAbilitiesTable weaponAbilities = $WeaponAbilitiesTable(
    this,
  );
  late final $UnitAbilitiesTable unitAbilities = $UnitAbilitiesTable(this);
  late final $UserArmiesTable userArmies = $UserArmiesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    factions,
    armies,
    codexes,
    role,
    units,
    detachments,
    codexDetachments,
    enhancements,
    strategems,
    weaponAbilities,
    unitAbilities,
    userArmies,
  ];
}

typedef $$FactionsTableCreateCompanionBuilder =
    FactionsCompanion Function({
      Value<int> id,
      required String code,
      required String name,
    });
typedef $$FactionsTableUpdateCompanionBuilder =
    FactionsCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
    });

final class $$FactionsTableReferences
    extends BaseReferences<_$AppDatabase, $FactionsTable, Faction> {
  $$FactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ArmiesTable, List<Army>> _armiesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.armies,
    aliasName: $_aliasNameGenerator(db.factions.id, db.armies.factionId),
  );

  $$ArmiesTableProcessedTableManager get armiesRefs {
    final manager = $$ArmiesTableTableManager(
      $_db,
      $_db.armies,
    ).filter((f) => f.factionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_armiesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FactionsTableFilterComposer
    extends Composer<_$AppDatabase, $FactionsTable> {
  $$FactionsTableFilterComposer({
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

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> armiesRefs(
    Expression<bool> Function($$ArmiesTableFilterComposer f) f,
  ) {
    final $$ArmiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.armies,
      getReferencedColumn: (t) => t.factionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArmiesTableFilterComposer(
            $db: $db,
            $table: $db.armies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $FactionsTable> {
  $$FactionsTableOrderingComposer({
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

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FactionsTable> {
  $$FactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> armiesRefs<T extends Object>(
    Expression<T> Function($$ArmiesTableAnnotationComposer a) f,
  ) {
    final $$ArmiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.armies,
      getReferencedColumn: (t) => t.factionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArmiesTableAnnotationComposer(
            $db: $db,
            $table: $db.armies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FactionsTable,
          Faction,
          $$FactionsTableFilterComposer,
          $$FactionsTableOrderingComposer,
          $$FactionsTableAnnotationComposer,
          $$FactionsTableCreateCompanionBuilder,
          $$FactionsTableUpdateCompanionBuilder,
          (Faction, $$FactionsTableReferences),
          Faction,
          PrefetchHooks Function({bool armiesRefs})
        > {
  $$FactionsTableTableManager(_$AppDatabase db, $FactionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FactionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FactionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FactionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => FactionsCompanion(id: id, code: code, name: name),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
              }) => FactionsCompanion.insert(id: id, code: code, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FactionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({armiesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (armiesRefs) db.armies],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (armiesRefs)
                    await $_getPrefetchedData<Faction, $FactionsTable, Army>(
                      currentTable: table,
                      referencedTable: $$FactionsTableReferences
                          ._armiesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FactionsTableReferences(db, table, p0).armiesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.factionId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$FactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FactionsTable,
      Faction,
      $$FactionsTableFilterComposer,
      $$FactionsTableOrderingComposer,
      $$FactionsTableAnnotationComposer,
      $$FactionsTableCreateCompanionBuilder,
      $$FactionsTableUpdateCompanionBuilder,
      (Faction, $$FactionsTableReferences),
      Faction,
      PrefetchHooks Function({bool armiesRefs})
    >;
typedef $$ArmiesTableCreateCompanionBuilder =
    ArmiesCompanion Function({
      Value<int> id,
      required String armyCode,
      required String name,
      required int factionId,
    });
typedef $$ArmiesTableUpdateCompanionBuilder =
    ArmiesCompanion Function({
      Value<int> id,
      Value<String> armyCode,
      Value<String> name,
      Value<int> factionId,
    });

final class $$ArmiesTableReferences
    extends BaseReferences<_$AppDatabase, $ArmiesTable, Army> {
  $$ArmiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FactionsTable _factionIdTable(_$AppDatabase db) => db.factions
      .createAlias($_aliasNameGenerator(db.armies.factionId, db.factions.id));

  $$FactionsTableProcessedTableManager get factionId {
    final $_column = $_itemColumn<int>('faction_id')!;

    final manager = $$FactionsTableTableManager(
      $_db,
      $_db.factions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_factionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CodexesTable, List<Codexe>> _codexesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.codexes,
    aliasName: $_aliasNameGenerator(db.armies.id, db.codexes.armyId),
  );

  $$CodexesTableProcessedTableManager get codexesRefs {
    final manager = $$CodexesTableTableManager(
      $_db,
      $_db.codexes,
    ).filter((f) => f.armyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_codexesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UnitsTable, List<UnitRow>> _unitsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.units,
    aliasName: $_aliasNameGenerator(db.armies.id, db.units.armyId),
  );

  $$UnitsTableProcessedTableManager get unitsRefs {
    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.armyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DetachmentsTable, List<DetachmentRow>>
  _detachmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.detachments,
    aliasName: $_aliasNameGenerator(db.armies.id, db.detachments.armyId),
  );

  $$DetachmentsTableProcessedTableManager get detachmentsRefs {
    final manager = $$DetachmentsTableTableManager(
      $_db,
      $_db.detachments,
    ).filter((f) => f.armyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_detachmentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ArmiesTableFilterComposer
    extends Composer<_$AppDatabase, $ArmiesTable> {
  $$ArmiesTableFilterComposer({
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

  ColumnFilters<String> get armyCode => $composableBuilder(
    column: $table.armyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  $$FactionsTableFilterComposer get factionId {
    final $$FactionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.factionId,
      referencedTable: $db.factions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FactionsTableFilterComposer(
            $db: $db,
            $table: $db.factions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> codexesRefs(
    Expression<bool> Function($$CodexesTableFilterComposer f) f,
  ) {
    final $$CodexesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.armyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexesTableFilterComposer(
            $db: $db,
            $table: $db.codexes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> unitsRefs(
    Expression<bool> Function($$UnitsTableFilterComposer f) f,
  ) {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.armyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> detachmentsRefs(
    Expression<bool> Function($$DetachmentsTableFilterComposer f) f,
  ) {
    final $$DetachmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.detachments,
      getReferencedColumn: (t) => t.armyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetachmentsTableFilterComposer(
            $db: $db,
            $table: $db.detachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ArmiesTableOrderingComposer
    extends Composer<_$AppDatabase, $ArmiesTable> {
  $$ArmiesTableOrderingComposer({
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

  ColumnOrderings<String> get armyCode => $composableBuilder(
    column: $table.armyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  $$FactionsTableOrderingComposer get factionId {
    final $$FactionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.factionId,
      referencedTable: $db.factions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FactionsTableOrderingComposer(
            $db: $db,
            $table: $db.factions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ArmiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArmiesTable> {
  $$ArmiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get armyCode =>
      $composableBuilder(column: $table.armyCode, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$FactionsTableAnnotationComposer get factionId {
    final $$FactionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.factionId,
      referencedTable: $db.factions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FactionsTableAnnotationComposer(
            $db: $db,
            $table: $db.factions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> codexesRefs<T extends Object>(
    Expression<T> Function($$CodexesTableAnnotationComposer a) f,
  ) {
    final $$CodexesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.armyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexesTableAnnotationComposer(
            $db: $db,
            $table: $db.codexes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> unitsRefs<T extends Object>(
    Expression<T> Function($$UnitsTableAnnotationComposer a) f,
  ) {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.armyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> detachmentsRefs<T extends Object>(
    Expression<T> Function($$DetachmentsTableAnnotationComposer a) f,
  ) {
    final $$DetachmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.detachments,
      getReferencedColumn: (t) => t.armyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetachmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.detachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ArmiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ArmiesTable,
          Army,
          $$ArmiesTableFilterComposer,
          $$ArmiesTableOrderingComposer,
          $$ArmiesTableAnnotationComposer,
          $$ArmiesTableCreateCompanionBuilder,
          $$ArmiesTableUpdateCompanionBuilder,
          (Army, $$ArmiesTableReferences),
          Army,
          PrefetchHooks Function({
            bool factionId,
            bool codexesRefs,
            bool unitsRefs,
            bool detachmentsRefs,
          })
        > {
  $$ArmiesTableTableManager(_$AppDatabase db, $ArmiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArmiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArmiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArmiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> armyCode = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> factionId = const Value.absent(),
              }) => ArmiesCompanion(
                id: id,
                armyCode: armyCode,
                name: name,
                factionId: factionId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String armyCode,
                required String name,
                required int factionId,
              }) => ArmiesCompanion.insert(
                id: id,
                armyCode: armyCode,
                name: name,
                factionId: factionId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$ArmiesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                factionId = false,
                codexesRefs = false,
                unitsRefs = false,
                detachmentsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (codexesRefs) db.codexes,
                    if (unitsRefs) db.units,
                    if (detachmentsRefs) db.detachments,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (factionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.factionId,
                                    referencedTable: $$ArmiesTableReferences
                                        ._factionIdTable(db),
                                    referencedColumn: $$ArmiesTableReferences
                                        ._factionIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (codexesRefs)
                        await $_getPrefetchedData<Army, $ArmiesTable, Codexe>(
                          currentTable: table,
                          referencedTable: $$ArmiesTableReferences
                              ._codexesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ArmiesTableReferences(
                                db,
                                table,
                                p0,
                              ).codexesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.armyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (unitsRefs)
                        await $_getPrefetchedData<Army, $ArmiesTable, UnitRow>(
                          currentTable: table,
                          referencedTable: $$ArmiesTableReferences
                              ._unitsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ArmiesTableReferences(db, table, p0).unitsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.armyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (detachmentsRefs)
                        await $_getPrefetchedData<
                          Army,
                          $ArmiesTable,
                          DetachmentRow
                        >(
                          currentTable: table,
                          referencedTable: $$ArmiesTableReferences
                              ._detachmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ArmiesTableReferences(
                                db,
                                table,
                                p0,
                              ).detachmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.armyId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ArmiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ArmiesTable,
      Army,
      $$ArmiesTableFilterComposer,
      $$ArmiesTableOrderingComposer,
      $$ArmiesTableAnnotationComposer,
      $$ArmiesTableCreateCompanionBuilder,
      $$ArmiesTableUpdateCompanionBuilder,
      (Army, $$ArmiesTableReferences),
      Army,
      PrefetchHooks Function({
        bool factionId,
        bool codexesRefs,
        bool unitsRefs,
        bool detachmentsRefs,
      })
    >;
typedef $$CodexesTableCreateCompanionBuilder =
    CodexesCompanion Function({
      required String id,
      required String code,
      required String name,
      required int armyId,
      Value<int> rowid,
    });
typedef $$CodexesTableUpdateCompanionBuilder =
    CodexesCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> name,
      Value<int> armyId,
      Value<int> rowid,
    });

final class $$CodexesTableReferences
    extends BaseReferences<_$AppDatabase, $CodexesTable, Codexe> {
  $$CodexesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ArmiesTable _armyIdTable(_$AppDatabase db) => db.armies.createAlias(
    $_aliasNameGenerator(db.codexes.armyId, db.armies.id),
  );

  $$ArmiesTableProcessedTableManager get armyId {
    final $_column = $_itemColumn<int>('army_id')!;

    final manager = $$ArmiesTableTableManager(
      $_db,
      $_db.armies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_armyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$UnitsTable, List<UnitRow>> _unitsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.units,
    aliasName: $_aliasNameGenerator(db.codexes.id, db.units.codexId),
  );

  $$UnitsTableProcessedTableManager get unitsRefs {
    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.codexId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CodexDetachmentsTable, List<CodexDetachment>>
  _codexDetachmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.codexDetachments,
    aliasName: $_aliasNameGenerator(db.codexes.id, db.codexDetachments.codexId),
  );

  $$CodexDetachmentsTableProcessedTableManager get codexDetachmentsRefs {
    final manager = $$CodexDetachmentsTableTableManager(
      $_db,
      $_db.codexDetachments,
    ).filter((f) => f.codexId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _codexDetachmentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$StrategemsTable, List<Strategem>>
  _strategemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.strategems,
    aliasName: $_aliasNameGenerator(db.codexes.id, db.strategems.codexId),
  );

  $$StrategemsTableProcessedTableManager get strategemsRefs {
    final manager = $$StrategemsTableTableManager(
      $_db,
      $_db.strategems,
    ).filter((f) => f.codexId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_strategemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UserArmiesTable, List<UserArmyRow>>
  _userArmiesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.userArmies,
    aliasName: $_aliasNameGenerator(db.codexes.id, db.userArmies.codexId),
  );

  $$UserArmiesTableProcessedTableManager get userArmiesRefs {
    final manager = $$UserArmiesTableTableManager(
      $_db,
      $_db.userArmies,
    ).filter((f) => f.codexId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_userArmiesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CodexesTableFilterComposer
    extends Composer<_$AppDatabase, $CodexesTable> {
  $$CodexesTableFilterComposer({
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

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  $$ArmiesTableFilterComposer get armyId {
    final $$ArmiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.armyId,
      referencedTable: $db.armies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArmiesTableFilterComposer(
            $db: $db,
            $table: $db.armies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> unitsRefs(
    Expression<bool> Function($$UnitsTableFilterComposer f) f,
  ) {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.codexId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> codexDetachmentsRefs(
    Expression<bool> Function($$CodexDetachmentsTableFilterComposer f) f,
  ) {
    final $$CodexDetachmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.codexDetachments,
      getReferencedColumn: (t) => t.codexId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexDetachmentsTableFilterComposer(
            $db: $db,
            $table: $db.codexDetachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> strategemsRefs(
    Expression<bool> Function($$StrategemsTableFilterComposer f) f,
  ) {
    final $$StrategemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.strategems,
      getReferencedColumn: (t) => t.codexId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StrategemsTableFilterComposer(
            $db: $db,
            $table: $db.strategems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> userArmiesRefs(
    Expression<bool> Function($$UserArmiesTableFilterComposer f) f,
  ) {
    final $$UserArmiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userArmies,
      getReferencedColumn: (t) => t.codexId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserArmiesTableFilterComposer(
            $db: $db,
            $table: $db.userArmies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CodexesTableOrderingComposer
    extends Composer<_$AppDatabase, $CodexesTable> {
  $$CodexesTableOrderingComposer({
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

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  $$ArmiesTableOrderingComposer get armyId {
    final $$ArmiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.armyId,
      referencedTable: $db.armies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArmiesTableOrderingComposer(
            $db: $db,
            $table: $db.armies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CodexesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CodexesTable> {
  $$CodexesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$ArmiesTableAnnotationComposer get armyId {
    final $$ArmiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.armyId,
      referencedTable: $db.armies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArmiesTableAnnotationComposer(
            $db: $db,
            $table: $db.armies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> unitsRefs<T extends Object>(
    Expression<T> Function($$UnitsTableAnnotationComposer a) f,
  ) {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.codexId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> codexDetachmentsRefs<T extends Object>(
    Expression<T> Function($$CodexDetachmentsTableAnnotationComposer a) f,
  ) {
    final $$CodexDetachmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.codexDetachments,
      getReferencedColumn: (t) => t.codexId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexDetachmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.codexDetachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> strategemsRefs<T extends Object>(
    Expression<T> Function($$StrategemsTableAnnotationComposer a) f,
  ) {
    final $$StrategemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.strategems,
      getReferencedColumn: (t) => t.codexId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StrategemsTableAnnotationComposer(
            $db: $db,
            $table: $db.strategems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> userArmiesRefs<T extends Object>(
    Expression<T> Function($$UserArmiesTableAnnotationComposer a) f,
  ) {
    final $$UserArmiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.userArmies,
      getReferencedColumn: (t) => t.codexId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserArmiesTableAnnotationComposer(
            $db: $db,
            $table: $db.userArmies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CodexesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CodexesTable,
          Codexe,
          $$CodexesTableFilterComposer,
          $$CodexesTableOrderingComposer,
          $$CodexesTableAnnotationComposer,
          $$CodexesTableCreateCompanionBuilder,
          $$CodexesTableUpdateCompanionBuilder,
          (Codexe, $$CodexesTableReferences),
          Codexe,
          PrefetchHooks Function({
            bool armyId,
            bool unitsRefs,
            bool codexDetachmentsRefs,
            bool strategemsRefs,
            bool userArmiesRefs,
          })
        > {
  $$CodexesTableTableManager(_$AppDatabase db, $CodexesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CodexesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CodexesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CodexesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> armyId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CodexesCompanion(
                id: id,
                code: code,
                name: name,
                armyId: armyId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required String name,
                required int armyId,
                Value<int> rowid = const Value.absent(),
              }) => CodexesCompanion.insert(
                id: id,
                code: code,
                name: name,
                armyId: armyId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CodexesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                armyId = false,
                unitsRefs = false,
                codexDetachmentsRefs = false,
                strategemsRefs = false,
                userArmiesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (unitsRefs) db.units,
                    if (codexDetachmentsRefs) db.codexDetachments,
                    if (strategemsRefs) db.strategems,
                    if (userArmiesRefs) db.userArmies,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (armyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.armyId,
                                    referencedTable: $$CodexesTableReferences
                                        ._armyIdTable(db),
                                    referencedColumn: $$CodexesTableReferences
                                        ._armyIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (unitsRefs)
                        await $_getPrefetchedData<
                          Codexe,
                          $CodexesTable,
                          UnitRow
                        >(
                          currentTable: table,
                          referencedTable: $$CodexesTableReferences
                              ._unitsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CodexesTableReferences(db, table, p0).unitsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.codexId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (codexDetachmentsRefs)
                        await $_getPrefetchedData<
                          Codexe,
                          $CodexesTable,
                          CodexDetachment
                        >(
                          currentTable: table,
                          referencedTable: $$CodexesTableReferences
                              ._codexDetachmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CodexesTableReferences(
                                db,
                                table,
                                p0,
                              ).codexDetachmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.codexId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (strategemsRefs)
                        await $_getPrefetchedData<
                          Codexe,
                          $CodexesTable,
                          Strategem
                        >(
                          currentTable: table,
                          referencedTable: $$CodexesTableReferences
                              ._strategemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CodexesTableReferences(
                                db,
                                table,
                                p0,
                              ).strategemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.codexId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (userArmiesRefs)
                        await $_getPrefetchedData<
                          Codexe,
                          $CodexesTable,
                          UserArmyRow
                        >(
                          currentTable: table,
                          referencedTable: $$CodexesTableReferences
                              ._userArmiesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CodexesTableReferences(
                                db,
                                table,
                                p0,
                              ).userArmiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.codexId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CodexesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CodexesTable,
      Codexe,
      $$CodexesTableFilterComposer,
      $$CodexesTableOrderingComposer,
      $$CodexesTableAnnotationComposer,
      $$CodexesTableCreateCompanionBuilder,
      $$CodexesTableUpdateCompanionBuilder,
      (Codexe, $$CodexesTableReferences),
      Codexe,
      PrefetchHooks Function({
        bool armyId,
        bool unitsRefs,
        bool codexDetachmentsRefs,
        bool strategemsRefs,
        bool userArmiesRefs,
      })
    >;
typedef $$RoleTableCreateCompanionBuilder =
    RoleCompanion Function({
      Value<int> id,
      required String code,
      required String name,
    });
typedef $$RoleTableUpdateCompanionBuilder =
    RoleCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
    });

final class $$RoleTableReferences
    extends BaseReferences<_$AppDatabase, $RoleTable, RoleData> {
  $$RoleTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UnitsTable, List<UnitRow>> _unitsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.units,
    aliasName: $_aliasNameGenerator(db.role.id, db.units.roleId),
  );

  $$UnitsTableProcessedTableManager get unitsRefs {
    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.roleId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoleTableFilterComposer extends Composer<_$AppDatabase, $RoleTable> {
  $$RoleTableFilterComposer({
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

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> unitsRefs(
    Expression<bool> Function($$UnitsTableFilterComposer f) f,
  ) {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.roleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoleTableOrderingComposer extends Composer<_$AppDatabase, $RoleTable> {
  $$RoleTableOrderingComposer({
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

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoleTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoleTable> {
  $$RoleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> unitsRefs<T extends Object>(
    Expression<T> Function($$UnitsTableAnnotationComposer a) f,
  ) {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.roleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoleTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoleTable,
          RoleData,
          $$RoleTableFilterComposer,
          $$RoleTableOrderingComposer,
          $$RoleTableAnnotationComposer,
          $$RoleTableCreateCompanionBuilder,
          $$RoleTableUpdateCompanionBuilder,
          (RoleData, $$RoleTableReferences),
          RoleData,
          PrefetchHooks Function({bool unitsRefs})
        > {
  $$RoleTableTableManager(_$AppDatabase db, $RoleTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => RoleCompanion(id: id, code: code, name: name),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
              }) => RoleCompanion.insert(id: id, code: code, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$RoleTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({unitsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (unitsRefs) db.units],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (unitsRefs)
                    await $_getPrefetchedData<RoleData, $RoleTable, UnitRow>(
                      currentTable: table,
                      referencedTable: $$RoleTableReferences._unitsRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$RoleTableReferences(db, table, p0).unitsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.roleId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RoleTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoleTable,
      RoleData,
      $$RoleTableFilterComposer,
      $$RoleTableOrderingComposer,
      $$RoleTableAnnotationComposer,
      $$RoleTableCreateCompanionBuilder,
      $$RoleTableUpdateCompanionBuilder,
      (RoleData, $$RoleTableReferences),
      RoleData,
      PrefetchHooks Function({bool unitsRefs})
    >;
typedef $$UnitsTableCreateCompanionBuilder =
    UnitsCompanion Function({
      required String id,
      required String name,
      required int armyId,
      Value<String?> codexId,
      required int roleId,
      required UnitStats stats,
      Value<int> rowid,
    });
typedef $$UnitsTableUpdateCompanionBuilder =
    UnitsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<int> armyId,
      Value<String?> codexId,
      Value<int> roleId,
      Value<UnitStats> stats,
      Value<int> rowid,
    });

final class $$UnitsTableReferences
    extends BaseReferences<_$AppDatabase, $UnitsTable, UnitRow> {
  $$UnitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ArmiesTable _armyIdTable(_$AppDatabase db) => db.armies.createAlias(
    $_aliasNameGenerator(db.units.armyId, db.armies.id),
  );

  $$ArmiesTableProcessedTableManager get armyId {
    final $_column = $_itemColumn<int>('army_id')!;

    final manager = $$ArmiesTableTableManager(
      $_db,
      $_db.armies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_armyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CodexesTable _codexIdTable(_$AppDatabase db) => db.codexes
      .createAlias($_aliasNameGenerator(db.units.codexId, db.codexes.id));

  $$CodexesTableProcessedTableManager? get codexId {
    final $_column = $_itemColumn<String>('codex_id');
    if ($_column == null) return null;
    final manager = $$CodexesTableTableManager(
      $_db,
      $_db.codexes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_codexIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RoleTable _roleIdTable(_$AppDatabase db) =>
      db.role.createAlias($_aliasNameGenerator(db.units.roleId, db.role.id));

  $$RoleTableProcessedTableManager get roleId {
    final $_column = $_itemColumn<int>('role_id')!;

    final manager = $$RoleTableTableManager(
      $_db,
      $_db.role,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UnitsTableFilterComposer extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableFilterComposer({
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

  ColumnWithTypeConverterFilters<UnitStats, UnitStats, String> get stats =>
      $composableBuilder(
        column: $table.stats,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$ArmiesTableFilterComposer get armyId {
    final $$ArmiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.armyId,
      referencedTable: $db.armies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArmiesTableFilterComposer(
            $db: $db,
            $table: $db.armies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CodexesTableFilterComposer get codexId {
    final $$CodexesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codexId,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexesTableFilterComposer(
            $db: $db,
            $table: $db.codexes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoleTableFilterComposer get roleId {
    final $$RoleTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roleId,
      referencedTable: $db.role,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoleTableFilterComposer(
            $db: $db,
            $table: $db.role,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitsTableOrderingComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableOrderingComposer({
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

  ColumnOrderings<String> get stats => $composableBuilder(
    column: $table.stats,
    builder: (column) => ColumnOrderings(column),
  );

  $$ArmiesTableOrderingComposer get armyId {
    final $$ArmiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.armyId,
      referencedTable: $db.armies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArmiesTableOrderingComposer(
            $db: $db,
            $table: $db.armies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CodexesTableOrderingComposer get codexId {
    final $$CodexesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codexId,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexesTableOrderingComposer(
            $db: $db,
            $table: $db.codexes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoleTableOrderingComposer get roleId {
    final $$RoleTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roleId,
      referencedTable: $db.role,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoleTableOrderingComposer(
            $db: $db,
            $table: $db.role,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableAnnotationComposer({
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

  GeneratedColumnWithTypeConverter<UnitStats, String> get stats =>
      $composableBuilder(column: $table.stats, builder: (column) => column);

  $$ArmiesTableAnnotationComposer get armyId {
    final $$ArmiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.armyId,
      referencedTable: $db.armies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArmiesTableAnnotationComposer(
            $db: $db,
            $table: $db.armies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CodexesTableAnnotationComposer get codexId {
    final $$CodexesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codexId,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexesTableAnnotationComposer(
            $db: $db,
            $table: $db.codexes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RoleTableAnnotationComposer get roleId {
    final $$RoleTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roleId,
      referencedTable: $db.role,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoleTableAnnotationComposer(
            $db: $db,
            $table: $db.role,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnitsTable,
          UnitRow,
          $$UnitsTableFilterComposer,
          $$UnitsTableOrderingComposer,
          $$UnitsTableAnnotationComposer,
          $$UnitsTableCreateCompanionBuilder,
          $$UnitsTableUpdateCompanionBuilder,
          (UnitRow, $$UnitsTableReferences),
          UnitRow,
          PrefetchHooks Function({bool armyId, bool codexId, bool roleId})
        > {
  $$UnitsTableTableManager(_$AppDatabase db, $UnitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> armyId = const Value.absent(),
                Value<String?> codexId = const Value.absent(),
                Value<int> roleId = const Value.absent(),
                Value<UnitStats> stats = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UnitsCompanion(
                id: id,
                name: name,
                armyId: armyId,
                codexId: codexId,
                roleId: roleId,
                stats: stats,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required int armyId,
                Value<String?> codexId = const Value.absent(),
                required int roleId,
                required UnitStats stats,
                Value<int> rowid = const Value.absent(),
              }) => UnitsCompanion.insert(
                id: id,
                name: name,
                armyId: armyId,
                codexId: codexId,
                roleId: roleId,
                stats: stats,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UnitsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({armyId = false, codexId = false, roleId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (armyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.armyId,
                                    referencedTable: $$UnitsTableReferences
                                        ._armyIdTable(db),
                                    referencedColumn: $$UnitsTableReferences
                                        ._armyIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (codexId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.codexId,
                                    referencedTable: $$UnitsTableReferences
                                        ._codexIdTable(db),
                                    referencedColumn: $$UnitsTableReferences
                                        ._codexIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (roleId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.roleId,
                                    referencedTable: $$UnitsTableReferences
                                        ._roleIdTable(db),
                                    referencedColumn: $$UnitsTableReferences
                                        ._roleIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$UnitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnitsTable,
      UnitRow,
      $$UnitsTableFilterComposer,
      $$UnitsTableOrderingComposer,
      $$UnitsTableAnnotationComposer,
      $$UnitsTableCreateCompanionBuilder,
      $$UnitsTableUpdateCompanionBuilder,
      (UnitRow, $$UnitsTableReferences),
      UnitRow,
      PrefetchHooks Function({bool armyId, bool codexId, bool roleId})
    >;
typedef $$DetachmentsTableCreateCompanionBuilder =
    DetachmentsCompanion Function({
      required String id,
      required int armyId,
      required String code,
      required String name,
      required String description,
      required String ruleName,
      required String ruleShort,
      required String ruleFull,
      Value<int> rowid,
    });
typedef $$DetachmentsTableUpdateCompanionBuilder =
    DetachmentsCompanion Function({
      Value<String> id,
      Value<int> armyId,
      Value<String> code,
      Value<String> name,
      Value<String> description,
      Value<String> ruleName,
      Value<String> ruleShort,
      Value<String> ruleFull,
      Value<int> rowid,
    });

final class $$DetachmentsTableReferences
    extends BaseReferences<_$AppDatabase, $DetachmentsTable, DetachmentRow> {
  $$DetachmentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ArmiesTable _armyIdTable(_$AppDatabase db) => db.armies.createAlias(
    $_aliasNameGenerator(db.detachments.armyId, db.armies.id),
  );

  $$ArmiesTableProcessedTableManager get armyId {
    final $_column = $_itemColumn<int>('army_id')!;

    final manager = $$ArmiesTableTableManager(
      $_db,
      $_db.armies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_armyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CodexDetachmentsTable, List<CodexDetachment>>
  _codexDetachmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.codexDetachments,
    aliasName: $_aliasNameGenerator(
      db.detachments.id,
      db.codexDetachments.detachmentId,
    ),
  );

  $$CodexDetachmentsTableProcessedTableManager get codexDetachmentsRefs {
    final manager = $$CodexDetachmentsTableTableManager(
      $_db,
      $_db.codexDetachments,
    ).filter((f) => f.detachmentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _codexDetachmentsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EnhancementsTable, List<Enhancement>>
  _enhancementsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.enhancements,
    aliasName: $_aliasNameGenerator(
      db.detachments.id,
      db.enhancements.detachmentId,
    ),
  );

  $$EnhancementsTableProcessedTableManager get enhancementsRefs {
    final manager = $$EnhancementsTableTableManager(
      $_db,
      $_db.enhancements,
    ).filter((f) => f.detachmentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_enhancementsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$StrategemsTable, List<Strategem>>
  _strategemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.strategems,
    aliasName: $_aliasNameGenerator(
      db.detachments.id,
      db.strategems.detachmentId,
    ),
  );

  $$StrategemsTableProcessedTableManager get strategemsRefs {
    final manager = $$StrategemsTableTableManager(
      $_db,
      $_db.strategems,
    ).filter((f) => f.detachmentId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_strategemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DetachmentsTableFilterComposer
    extends Composer<_$AppDatabase, $DetachmentsTable> {
  $$DetachmentsTableFilterComposer({
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

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ruleName => $composableBuilder(
    column: $table.ruleName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ruleShort => $composableBuilder(
    column: $table.ruleShort,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ruleFull => $composableBuilder(
    column: $table.ruleFull,
    builder: (column) => ColumnFilters(column),
  );

  $$ArmiesTableFilterComposer get armyId {
    final $$ArmiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.armyId,
      referencedTable: $db.armies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArmiesTableFilterComposer(
            $db: $db,
            $table: $db.armies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> codexDetachmentsRefs(
    Expression<bool> Function($$CodexDetachmentsTableFilterComposer f) f,
  ) {
    final $$CodexDetachmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.codexDetachments,
      getReferencedColumn: (t) => t.detachmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexDetachmentsTableFilterComposer(
            $db: $db,
            $table: $db.codexDetachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> enhancementsRefs(
    Expression<bool> Function($$EnhancementsTableFilterComposer f) f,
  ) {
    final $$EnhancementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.enhancements,
      getReferencedColumn: (t) => t.detachmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnhancementsTableFilterComposer(
            $db: $db,
            $table: $db.enhancements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> strategemsRefs(
    Expression<bool> Function($$StrategemsTableFilterComposer f) f,
  ) {
    final $$StrategemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.strategems,
      getReferencedColumn: (t) => t.detachmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StrategemsTableFilterComposer(
            $db: $db,
            $table: $db.strategems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DetachmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $DetachmentsTable> {
  $$DetachmentsTableOrderingComposer({
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

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ruleName => $composableBuilder(
    column: $table.ruleName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ruleShort => $composableBuilder(
    column: $table.ruleShort,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ruleFull => $composableBuilder(
    column: $table.ruleFull,
    builder: (column) => ColumnOrderings(column),
  );

  $$ArmiesTableOrderingComposer get armyId {
    final $$ArmiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.armyId,
      referencedTable: $db.armies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArmiesTableOrderingComposer(
            $db: $db,
            $table: $db.armies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DetachmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DetachmentsTable> {
  $$DetachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ruleName =>
      $composableBuilder(column: $table.ruleName, builder: (column) => column);

  GeneratedColumn<String> get ruleShort =>
      $composableBuilder(column: $table.ruleShort, builder: (column) => column);

  GeneratedColumn<String> get ruleFull =>
      $composableBuilder(column: $table.ruleFull, builder: (column) => column);

  $$ArmiesTableAnnotationComposer get armyId {
    final $$ArmiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.armyId,
      referencedTable: $db.armies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ArmiesTableAnnotationComposer(
            $db: $db,
            $table: $db.armies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> codexDetachmentsRefs<T extends Object>(
    Expression<T> Function($$CodexDetachmentsTableAnnotationComposer a) f,
  ) {
    final $$CodexDetachmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.codexDetachments,
      getReferencedColumn: (t) => t.detachmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexDetachmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.codexDetachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> enhancementsRefs<T extends Object>(
    Expression<T> Function($$EnhancementsTableAnnotationComposer a) f,
  ) {
    final $$EnhancementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.enhancements,
      getReferencedColumn: (t) => t.detachmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnhancementsTableAnnotationComposer(
            $db: $db,
            $table: $db.enhancements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> strategemsRefs<T extends Object>(
    Expression<T> Function($$StrategemsTableAnnotationComposer a) f,
  ) {
    final $$StrategemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.strategems,
      getReferencedColumn: (t) => t.detachmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StrategemsTableAnnotationComposer(
            $db: $db,
            $table: $db.strategems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DetachmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DetachmentsTable,
          DetachmentRow,
          $$DetachmentsTableFilterComposer,
          $$DetachmentsTableOrderingComposer,
          $$DetachmentsTableAnnotationComposer,
          $$DetachmentsTableCreateCompanionBuilder,
          $$DetachmentsTableUpdateCompanionBuilder,
          (DetachmentRow, $$DetachmentsTableReferences),
          DetachmentRow,
          PrefetchHooks Function({
            bool armyId,
            bool codexDetachmentsRefs,
            bool enhancementsRefs,
            bool strategemsRefs,
          })
        > {
  $$DetachmentsTableTableManager(_$AppDatabase db, $DetachmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DetachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DetachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DetachmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> armyId = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> ruleName = const Value.absent(),
                Value<String> ruleShort = const Value.absent(),
                Value<String> ruleFull = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DetachmentsCompanion(
                id: id,
                armyId: armyId,
                code: code,
                name: name,
                description: description,
                ruleName: ruleName,
                ruleShort: ruleShort,
                ruleFull: ruleFull,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int armyId,
                required String code,
                required String name,
                required String description,
                required String ruleName,
                required String ruleShort,
                required String ruleFull,
                Value<int> rowid = const Value.absent(),
              }) => DetachmentsCompanion.insert(
                id: id,
                armyId: armyId,
                code: code,
                name: name,
                description: description,
                ruleName: ruleName,
                ruleShort: ruleShort,
                ruleFull: ruleFull,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DetachmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                armyId = false,
                codexDetachmentsRefs = false,
                enhancementsRefs = false,
                strategemsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (codexDetachmentsRefs) db.codexDetachments,
                    if (enhancementsRefs) db.enhancements,
                    if (strategemsRefs) db.strategems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (armyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.armyId,
                                    referencedTable:
                                        $$DetachmentsTableReferences
                                            ._armyIdTable(db),
                                    referencedColumn:
                                        $$DetachmentsTableReferences
                                            ._armyIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (codexDetachmentsRefs)
                        await $_getPrefetchedData<
                          DetachmentRow,
                          $DetachmentsTable,
                          CodexDetachment
                        >(
                          currentTable: table,
                          referencedTable: $$DetachmentsTableReferences
                              ._codexDetachmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DetachmentsTableReferences(
                                db,
                                table,
                                p0,
                              ).codexDetachmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.detachmentId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (enhancementsRefs)
                        await $_getPrefetchedData<
                          DetachmentRow,
                          $DetachmentsTable,
                          Enhancement
                        >(
                          currentTable: table,
                          referencedTable: $$DetachmentsTableReferences
                              ._enhancementsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DetachmentsTableReferences(
                                db,
                                table,
                                p0,
                              ).enhancementsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.detachmentId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (strategemsRefs)
                        await $_getPrefetchedData<
                          DetachmentRow,
                          $DetachmentsTable,
                          Strategem
                        >(
                          currentTable: table,
                          referencedTable: $$DetachmentsTableReferences
                              ._strategemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DetachmentsTableReferences(
                                db,
                                table,
                                p0,
                              ).strategemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.detachmentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DetachmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DetachmentsTable,
      DetachmentRow,
      $$DetachmentsTableFilterComposer,
      $$DetachmentsTableOrderingComposer,
      $$DetachmentsTableAnnotationComposer,
      $$DetachmentsTableCreateCompanionBuilder,
      $$DetachmentsTableUpdateCompanionBuilder,
      (DetachmentRow, $$DetachmentsTableReferences),
      DetachmentRow,
      PrefetchHooks Function({
        bool armyId,
        bool codexDetachmentsRefs,
        bool enhancementsRefs,
        bool strategemsRefs,
      })
    >;
typedef $$CodexDetachmentsTableCreateCompanionBuilder =
    CodexDetachmentsCompanion Function({
      required String codexId,
      required String detachmentId,
      Value<int> rowid,
    });
typedef $$CodexDetachmentsTableUpdateCompanionBuilder =
    CodexDetachmentsCompanion Function({
      Value<String> codexId,
      Value<String> detachmentId,
      Value<int> rowid,
    });

final class $$CodexDetachmentsTableReferences
    extends
        BaseReferences<_$AppDatabase, $CodexDetachmentsTable, CodexDetachment> {
  $$CodexDetachmentsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CodexesTable _codexIdTable(_$AppDatabase db) =>
      db.codexes.createAlias(
        $_aliasNameGenerator(db.codexDetachments.codexId, db.codexes.id),
      );

  $$CodexesTableProcessedTableManager get codexId {
    final $_column = $_itemColumn<String>('codex_id')!;

    final manager = $$CodexesTableTableManager(
      $_db,
      $_db.codexes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_codexIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DetachmentsTable _detachmentIdTable(_$AppDatabase db) =>
      db.detachments.createAlias(
        $_aliasNameGenerator(
          db.codexDetachments.detachmentId,
          db.detachments.id,
        ),
      );

  $$DetachmentsTableProcessedTableManager get detachmentId {
    final $_column = $_itemColumn<String>('detachment_id')!;

    final manager = $$DetachmentsTableTableManager(
      $_db,
      $_db.detachments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_detachmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CodexDetachmentsTableFilterComposer
    extends Composer<_$AppDatabase, $CodexDetachmentsTable> {
  $$CodexDetachmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CodexesTableFilterComposer get codexId {
    final $$CodexesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codexId,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexesTableFilterComposer(
            $db: $db,
            $table: $db.codexes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DetachmentsTableFilterComposer get detachmentId {
    final $$DetachmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.detachmentId,
      referencedTable: $db.detachments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetachmentsTableFilterComposer(
            $db: $db,
            $table: $db.detachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CodexDetachmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $CodexDetachmentsTable> {
  $$CodexDetachmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CodexesTableOrderingComposer get codexId {
    final $$CodexesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codexId,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexesTableOrderingComposer(
            $db: $db,
            $table: $db.codexes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DetachmentsTableOrderingComposer get detachmentId {
    final $$DetachmentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.detachmentId,
      referencedTable: $db.detachments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetachmentsTableOrderingComposer(
            $db: $db,
            $table: $db.detachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CodexDetachmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CodexDetachmentsTable> {
  $$CodexDetachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CodexesTableAnnotationComposer get codexId {
    final $$CodexesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codexId,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexesTableAnnotationComposer(
            $db: $db,
            $table: $db.codexes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DetachmentsTableAnnotationComposer get detachmentId {
    final $$DetachmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.detachmentId,
      referencedTable: $db.detachments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetachmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.detachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CodexDetachmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CodexDetachmentsTable,
          CodexDetachment,
          $$CodexDetachmentsTableFilterComposer,
          $$CodexDetachmentsTableOrderingComposer,
          $$CodexDetachmentsTableAnnotationComposer,
          $$CodexDetachmentsTableCreateCompanionBuilder,
          $$CodexDetachmentsTableUpdateCompanionBuilder,
          (CodexDetachment, $$CodexDetachmentsTableReferences),
          CodexDetachment,
          PrefetchHooks Function({bool codexId, bool detachmentId})
        > {
  $$CodexDetachmentsTableTableManager(
    _$AppDatabase db,
    $CodexDetachmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CodexDetachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CodexDetachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CodexDetachmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> codexId = const Value.absent(),
                Value<String> detachmentId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CodexDetachmentsCompanion(
                codexId: codexId,
                detachmentId: detachmentId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String codexId,
                required String detachmentId,
                Value<int> rowid = const Value.absent(),
              }) => CodexDetachmentsCompanion.insert(
                codexId: codexId,
                detachmentId: detachmentId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CodexDetachmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({codexId = false, detachmentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (codexId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.codexId,
                                referencedTable:
                                    $$CodexDetachmentsTableReferences
                                        ._codexIdTable(db),
                                referencedColumn:
                                    $$CodexDetachmentsTableReferences
                                        ._codexIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (detachmentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.detachmentId,
                                referencedTable:
                                    $$CodexDetachmentsTableReferences
                                        ._detachmentIdTable(db),
                                referencedColumn:
                                    $$CodexDetachmentsTableReferences
                                        ._detachmentIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CodexDetachmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CodexDetachmentsTable,
      CodexDetachment,
      $$CodexDetachmentsTableFilterComposer,
      $$CodexDetachmentsTableOrderingComposer,
      $$CodexDetachmentsTableAnnotationComposer,
      $$CodexDetachmentsTableCreateCompanionBuilder,
      $$CodexDetachmentsTableUpdateCompanionBuilder,
      (CodexDetachment, $$CodexDetachmentsTableReferences),
      CodexDetachment,
      PrefetchHooks Function({bool codexId, bool detachmentId})
    >;
typedef $$EnhancementsTableCreateCompanionBuilder =
    EnhancementsCompanion Function({
      required String id,
      required String code,
      required String name,
      required String description,
      required String detachmentId,
      Value<int> points,
      Value<int> rowid,
    });
typedef $$EnhancementsTableUpdateCompanionBuilder =
    EnhancementsCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> name,
      Value<String> description,
      Value<String> detachmentId,
      Value<int> points,
      Value<int> rowid,
    });

final class $$EnhancementsTableReferences
    extends BaseReferences<_$AppDatabase, $EnhancementsTable, Enhancement> {
  $$EnhancementsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DetachmentsTable _detachmentIdTable(_$AppDatabase db) =>
      db.detachments.createAlias(
        $_aliasNameGenerator(db.enhancements.detachmentId, db.detachments.id),
      );

  $$DetachmentsTableProcessedTableManager get detachmentId {
    final $_column = $_itemColumn<String>('detachment_id')!;

    final manager = $$DetachmentsTableTableManager(
      $_db,
      $_db.detachments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_detachmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EnhancementsTableFilterComposer
    extends Composer<_$AppDatabase, $EnhancementsTable> {
  $$EnhancementsTableFilterComposer({
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

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnFilters(column),
  );

  $$DetachmentsTableFilterComposer get detachmentId {
    final $$DetachmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.detachmentId,
      referencedTable: $db.detachments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetachmentsTableFilterComposer(
            $db: $db,
            $table: $db.detachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EnhancementsTableOrderingComposer
    extends Composer<_$AppDatabase, $EnhancementsTable> {
  $$EnhancementsTableOrderingComposer({
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

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnOrderings(column),
  );

  $$DetachmentsTableOrderingComposer get detachmentId {
    final $$DetachmentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.detachmentId,
      referencedTable: $db.detachments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetachmentsTableOrderingComposer(
            $db: $db,
            $table: $db.detachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EnhancementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EnhancementsTable> {
  $$EnhancementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get points =>
      $composableBuilder(column: $table.points, builder: (column) => column);

  $$DetachmentsTableAnnotationComposer get detachmentId {
    final $$DetachmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.detachmentId,
      referencedTable: $db.detachments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetachmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.detachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EnhancementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EnhancementsTable,
          Enhancement,
          $$EnhancementsTableFilterComposer,
          $$EnhancementsTableOrderingComposer,
          $$EnhancementsTableAnnotationComposer,
          $$EnhancementsTableCreateCompanionBuilder,
          $$EnhancementsTableUpdateCompanionBuilder,
          (Enhancement, $$EnhancementsTableReferences),
          Enhancement,
          PrefetchHooks Function({bool detachmentId})
        > {
  $$EnhancementsTableTableManager(_$AppDatabase db, $EnhancementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EnhancementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EnhancementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EnhancementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> detachmentId = const Value.absent(),
                Value<int> points = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EnhancementsCompanion(
                id: id,
                code: code,
                name: name,
                description: description,
                detachmentId: detachmentId,
                points: points,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required String name,
                required String description,
                required String detachmentId,
                Value<int> points = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EnhancementsCompanion.insert(
                id: id,
                code: code,
                name: name,
                description: description,
                detachmentId: detachmentId,
                points: points,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EnhancementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({detachmentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (detachmentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.detachmentId,
                                referencedTable: $$EnhancementsTableReferences
                                    ._detachmentIdTable(db),
                                referencedColumn: $$EnhancementsTableReferences
                                    ._detachmentIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EnhancementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EnhancementsTable,
      Enhancement,
      $$EnhancementsTableFilterComposer,
      $$EnhancementsTableOrderingComposer,
      $$EnhancementsTableAnnotationComposer,
      $$EnhancementsTableCreateCompanionBuilder,
      $$EnhancementsTableUpdateCompanionBuilder,
      (Enhancement, $$EnhancementsTableReferences),
      Enhancement,
      PrefetchHooks Function({bool detachmentId})
    >;
typedef $$StrategemsTableCreateCompanionBuilder =
    StrategemsCompanion Function({
      Value<int> id,
      required String code,
      required String name,
      required String description,
      required int cpCost,
      required String phase,
      required String target,
      required String effect,
      required String codexId,
      Value<String?> detachmentId,
    });
typedef $$StrategemsTableUpdateCompanionBuilder =
    StrategemsCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<String> description,
      Value<int> cpCost,
      Value<String> phase,
      Value<String> target,
      Value<String> effect,
      Value<String> codexId,
      Value<String?> detachmentId,
    });

final class $$StrategemsTableReferences
    extends BaseReferences<_$AppDatabase, $StrategemsTable, Strategem> {
  $$StrategemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CodexesTable _codexIdTable(_$AppDatabase db) => db.codexes
      .createAlias($_aliasNameGenerator(db.strategems.codexId, db.codexes.id));

  $$CodexesTableProcessedTableManager get codexId {
    final $_column = $_itemColumn<String>('codex_id')!;

    final manager = $$CodexesTableTableManager(
      $_db,
      $_db.codexes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_codexIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DetachmentsTable _detachmentIdTable(_$AppDatabase db) =>
      db.detachments.createAlias(
        $_aliasNameGenerator(db.strategems.detachmentId, db.detachments.id),
      );

  $$DetachmentsTableProcessedTableManager? get detachmentId {
    final $_column = $_itemColumn<String>('detachment_id');
    if ($_column == null) return null;
    final manager = $$DetachmentsTableTableManager(
      $_db,
      $_db.detachments,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_detachmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StrategemsTableFilterComposer
    extends Composer<_$AppDatabase, $StrategemsTable> {
  $$StrategemsTableFilterComposer({
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

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cpCost => $composableBuilder(
    column: $table.cpCost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phase => $composableBuilder(
    column: $table.phase,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get target => $composableBuilder(
    column: $table.target,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get effect => $composableBuilder(
    column: $table.effect,
    builder: (column) => ColumnFilters(column),
  );

  $$CodexesTableFilterComposer get codexId {
    final $$CodexesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codexId,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexesTableFilterComposer(
            $db: $db,
            $table: $db.codexes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DetachmentsTableFilterComposer get detachmentId {
    final $$DetachmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.detachmentId,
      referencedTable: $db.detachments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetachmentsTableFilterComposer(
            $db: $db,
            $table: $db.detachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StrategemsTableOrderingComposer
    extends Composer<_$AppDatabase, $StrategemsTable> {
  $$StrategemsTableOrderingComposer({
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

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cpCost => $composableBuilder(
    column: $table.cpCost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phase => $composableBuilder(
    column: $table.phase,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get target => $composableBuilder(
    column: $table.target,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get effect => $composableBuilder(
    column: $table.effect,
    builder: (column) => ColumnOrderings(column),
  );

  $$CodexesTableOrderingComposer get codexId {
    final $$CodexesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codexId,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexesTableOrderingComposer(
            $db: $db,
            $table: $db.codexes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DetachmentsTableOrderingComposer get detachmentId {
    final $$DetachmentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.detachmentId,
      referencedTable: $db.detachments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetachmentsTableOrderingComposer(
            $db: $db,
            $table: $db.detachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StrategemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StrategemsTable> {
  $$StrategemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get cpCost =>
      $composableBuilder(column: $table.cpCost, builder: (column) => column);

  GeneratedColumn<String> get phase =>
      $composableBuilder(column: $table.phase, builder: (column) => column);

  GeneratedColumn<String> get target =>
      $composableBuilder(column: $table.target, builder: (column) => column);

  GeneratedColumn<String> get effect =>
      $composableBuilder(column: $table.effect, builder: (column) => column);

  $$CodexesTableAnnotationComposer get codexId {
    final $$CodexesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codexId,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexesTableAnnotationComposer(
            $db: $db,
            $table: $db.codexes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DetachmentsTableAnnotationComposer get detachmentId {
    final $$DetachmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.detachmentId,
      referencedTable: $db.detachments,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetachmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.detachments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StrategemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StrategemsTable,
          Strategem,
          $$StrategemsTableFilterComposer,
          $$StrategemsTableOrderingComposer,
          $$StrategemsTableAnnotationComposer,
          $$StrategemsTableCreateCompanionBuilder,
          $$StrategemsTableUpdateCompanionBuilder,
          (Strategem, $$StrategemsTableReferences),
          Strategem,
          PrefetchHooks Function({bool codexId, bool detachmentId})
        > {
  $$StrategemsTableTableManager(_$AppDatabase db, $StrategemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StrategemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StrategemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StrategemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> cpCost = const Value.absent(),
                Value<String> phase = const Value.absent(),
                Value<String> target = const Value.absent(),
                Value<String> effect = const Value.absent(),
                Value<String> codexId = const Value.absent(),
                Value<String?> detachmentId = const Value.absent(),
              }) => StrategemsCompanion(
                id: id,
                code: code,
                name: name,
                description: description,
                cpCost: cpCost,
                phase: phase,
                target: target,
                effect: effect,
                codexId: codexId,
                detachmentId: detachmentId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
                required String description,
                required int cpCost,
                required String phase,
                required String target,
                required String effect,
                required String codexId,
                Value<String?> detachmentId = const Value.absent(),
              }) => StrategemsCompanion.insert(
                id: id,
                code: code,
                name: name,
                description: description,
                cpCost: cpCost,
                phase: phase,
                target: target,
                effect: effect,
                codexId: codexId,
                detachmentId: detachmentId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StrategemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({codexId = false, detachmentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (codexId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.codexId,
                                referencedTable: $$StrategemsTableReferences
                                    ._codexIdTable(db),
                                referencedColumn: $$StrategemsTableReferences
                                    ._codexIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (detachmentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.detachmentId,
                                referencedTable: $$StrategemsTableReferences
                                    ._detachmentIdTable(db),
                                referencedColumn: $$StrategemsTableReferences
                                    ._detachmentIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StrategemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StrategemsTable,
      Strategem,
      $$StrategemsTableFilterComposer,
      $$StrategemsTableOrderingComposer,
      $$StrategemsTableAnnotationComposer,
      $$StrategemsTableCreateCompanionBuilder,
      $$StrategemsTableUpdateCompanionBuilder,
      (Strategem, $$StrategemsTableReferences),
      Strategem,
      PrefetchHooks Function({bool codexId, bool detachmentId})
    >;
typedef $$WeaponAbilitiesTableCreateCompanionBuilder =
    WeaponAbilitiesCompanion Function({
      required String id,
      required String code,
      required String name,
      required String shortDescription,
      required String description,
      Value<int> rowid,
    });
typedef $$WeaponAbilitiesTableUpdateCompanionBuilder =
    WeaponAbilitiesCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> name,
      Value<String> shortDescription,
      Value<String> description,
      Value<int> rowid,
    });

class $$WeaponAbilitiesTableFilterComposer
    extends Composer<_$AppDatabase, $WeaponAbilitiesTable> {
  $$WeaponAbilitiesTableFilterComposer({
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

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WeaponAbilitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $WeaponAbilitiesTable> {
  $$WeaponAbilitiesTableOrderingComposer({
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

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeaponAbilitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $WeaponAbilitiesTable> {
  $$WeaponAbilitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $$WeaponAbilitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WeaponAbilitiesTable,
          WeaponAbilitiesRow,
          $$WeaponAbilitiesTableFilterComposer,
          $$WeaponAbilitiesTableOrderingComposer,
          $$WeaponAbilitiesTableAnnotationComposer,
          $$WeaponAbilitiesTableCreateCompanionBuilder,
          $$WeaponAbilitiesTableUpdateCompanionBuilder,
          (
            WeaponAbilitiesRow,
            BaseReferences<
              _$AppDatabase,
              $WeaponAbilitiesTable,
              WeaponAbilitiesRow
            >,
          ),
          WeaponAbilitiesRow,
          PrefetchHooks Function()
        > {
  $$WeaponAbilitiesTableTableManager(
    _$AppDatabase db,
    $WeaponAbilitiesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeaponAbilitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeaponAbilitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeaponAbilitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> shortDescription = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => WeaponAbilitiesCompanion(
                id: id,
                code: code,
                name: name,
                shortDescription: shortDescription,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required String name,
                required String shortDescription,
                required String description,
                Value<int> rowid = const Value.absent(),
              }) => WeaponAbilitiesCompanion.insert(
                id: id,
                code: code,
                name: name,
                shortDescription: shortDescription,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WeaponAbilitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WeaponAbilitiesTable,
      WeaponAbilitiesRow,
      $$WeaponAbilitiesTableFilterComposer,
      $$WeaponAbilitiesTableOrderingComposer,
      $$WeaponAbilitiesTableAnnotationComposer,
      $$WeaponAbilitiesTableCreateCompanionBuilder,
      $$WeaponAbilitiesTableUpdateCompanionBuilder,
      (
        WeaponAbilitiesRow,
        BaseReferences<
          _$AppDatabase,
          $WeaponAbilitiesTable,
          WeaponAbilitiesRow
        >,
      ),
      WeaponAbilitiesRow,
      PrefetchHooks Function()
    >;
typedef $$UnitAbilitiesTableCreateCompanionBuilder =
    UnitAbilitiesCompanion Function({
      required String id,
      required String code,
      required String name,
      required String shortDescription,
      required String description,
      Value<int> rowid,
    });
typedef $$UnitAbilitiesTableUpdateCompanionBuilder =
    UnitAbilitiesCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> name,
      Value<String> shortDescription,
      Value<String> description,
      Value<int> rowid,
    });

class $$UnitAbilitiesTableFilterComposer
    extends Composer<_$AppDatabase, $UnitAbilitiesTable> {
  $$UnitAbilitiesTableFilterComposer({
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

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UnitAbilitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $UnitAbilitiesTable> {
  $$UnitAbilitiesTableOrderingComposer({
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

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UnitAbilitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnitAbilitiesTable> {
  $$UnitAbilitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );
}

class $$UnitAbilitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnitAbilitiesTable,
          UnitAbilitiesRow,
          $$UnitAbilitiesTableFilterComposer,
          $$UnitAbilitiesTableOrderingComposer,
          $$UnitAbilitiesTableAnnotationComposer,
          $$UnitAbilitiesTableCreateCompanionBuilder,
          $$UnitAbilitiesTableUpdateCompanionBuilder,
          (
            UnitAbilitiesRow,
            BaseReferences<
              _$AppDatabase,
              $UnitAbilitiesTable,
              UnitAbilitiesRow
            >,
          ),
          UnitAbilitiesRow,
          PrefetchHooks Function()
        > {
  $$UnitAbilitiesTableTableManager(_$AppDatabase db, $UnitAbilitiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnitAbilitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnitAbilitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnitAbilitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> shortDescription = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UnitAbilitiesCompanion(
                id: id,
                code: code,
                name: name,
                shortDescription: shortDescription,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required String name,
                required String shortDescription,
                required String description,
                Value<int> rowid = const Value.absent(),
              }) => UnitAbilitiesCompanion.insert(
                id: id,
                code: code,
                name: name,
                shortDescription: shortDescription,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UnitAbilitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnitAbilitiesTable,
      UnitAbilitiesRow,
      $$UnitAbilitiesTableFilterComposer,
      $$UnitAbilitiesTableOrderingComposer,
      $$UnitAbilitiesTableAnnotationComposer,
      $$UnitAbilitiesTableCreateCompanionBuilder,
      $$UnitAbilitiesTableUpdateCompanionBuilder,
      (
        UnitAbilitiesRow,
        BaseReferences<_$AppDatabase, $UnitAbilitiesTable, UnitAbilitiesRow>,
      ),
      UnitAbilitiesRow,
      PrefetchHooks Function()
    >;
typedef $$UserArmiesTableCreateCompanionBuilder =
    UserArmiesCompanion Function({
      required String id,
      required String name,
      required String codexId,
      Value<int> totalPoints,
      required String jsonData,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$UserArmiesTableUpdateCompanionBuilder =
    UserArmiesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> codexId,
      Value<int> totalPoints,
      Value<String> jsonData,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$UserArmiesTableReferences
    extends BaseReferences<_$AppDatabase, $UserArmiesTable, UserArmyRow> {
  $$UserArmiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CodexesTable _codexIdTable(_$AppDatabase db) => db.codexes
      .createAlias($_aliasNameGenerator(db.userArmies.codexId, db.codexes.id));

  $$CodexesTableProcessedTableManager get codexId {
    final $_column = $_itemColumn<String>('codex_id')!;

    final manager = $$CodexesTableTableManager(
      $_db,
      $_db.codexes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_codexIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UserArmiesTableFilterComposer
    extends Composer<_$AppDatabase, $UserArmiesTable> {
  $$UserArmiesTableFilterComposer({
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

  ColumnFilters<int> get totalPoints => $composableBuilder(
    column: $table.totalPoints,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jsonData => $composableBuilder(
    column: $table.jsonData,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CodexesTableFilterComposer get codexId {
    final $$CodexesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codexId,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexesTableFilterComposer(
            $db: $db,
            $table: $db.codexes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserArmiesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserArmiesTable> {
  $$UserArmiesTableOrderingComposer({
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

  ColumnOrderings<int> get totalPoints => $composableBuilder(
    column: $table.totalPoints,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jsonData => $composableBuilder(
    column: $table.jsonData,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CodexesTableOrderingComposer get codexId {
    final $$CodexesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codexId,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexesTableOrderingComposer(
            $db: $db,
            $table: $db.codexes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserArmiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserArmiesTable> {
  $$UserArmiesTableAnnotationComposer({
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

  GeneratedColumn<int> get totalPoints => $composableBuilder(
    column: $table.totalPoints,
    builder: (column) => column,
  );

  GeneratedColumn<String> get jsonData =>
      $composableBuilder(column: $table.jsonData, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$CodexesTableAnnotationComposer get codexId {
    final $$CodexesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.codexId,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CodexesTableAnnotationComposer(
            $db: $db,
            $table: $db.codexes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UserArmiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserArmiesTable,
          UserArmyRow,
          $$UserArmiesTableFilterComposer,
          $$UserArmiesTableOrderingComposer,
          $$UserArmiesTableAnnotationComposer,
          $$UserArmiesTableCreateCompanionBuilder,
          $$UserArmiesTableUpdateCompanionBuilder,
          (UserArmyRow, $$UserArmiesTableReferences),
          UserArmyRow,
          PrefetchHooks Function({bool codexId})
        > {
  $$UserArmiesTableTableManager(_$AppDatabase db, $UserArmiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserArmiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserArmiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserArmiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> codexId = const Value.absent(),
                Value<int> totalPoints = const Value.absent(),
                Value<String> jsonData = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserArmiesCompanion(
                id: id,
                name: name,
                codexId: codexId,
                totalPoints: totalPoints,
                jsonData: jsonData,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String codexId,
                Value<int> totalPoints = const Value.absent(),
                required String jsonData,
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserArmiesCompanion.insert(
                id: id,
                name: name,
                codexId: codexId,
                totalPoints: totalPoints,
                jsonData: jsonData,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UserArmiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({codexId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (codexId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.codexId,
                                referencedTable: $$UserArmiesTableReferences
                                    ._codexIdTable(db),
                                referencedColumn: $$UserArmiesTableReferences
                                    ._codexIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UserArmiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserArmiesTable,
      UserArmyRow,
      $$UserArmiesTableFilterComposer,
      $$UserArmiesTableOrderingComposer,
      $$UserArmiesTableAnnotationComposer,
      $$UserArmiesTableCreateCompanionBuilder,
      $$UserArmiesTableUpdateCompanionBuilder,
      (UserArmyRow, $$UserArmiesTableReferences),
      UserArmyRow,
      PrefetchHooks Function({bool codexId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FactionsTableTableManager get factions =>
      $$FactionsTableTableManager(_db, _db.factions);
  $$ArmiesTableTableManager get armies =>
      $$ArmiesTableTableManager(_db, _db.armies);
  $$CodexesTableTableManager get codexes =>
      $$CodexesTableTableManager(_db, _db.codexes);
  $$RoleTableTableManager get role => $$RoleTableTableManager(_db, _db.role);
  $$UnitsTableTableManager get units =>
      $$UnitsTableTableManager(_db, _db.units);
  $$DetachmentsTableTableManager get detachments =>
      $$DetachmentsTableTableManager(_db, _db.detachments);
  $$CodexDetachmentsTableTableManager get codexDetachments =>
      $$CodexDetachmentsTableTableManager(_db, _db.codexDetachments);
  $$EnhancementsTableTableManager get enhancements =>
      $$EnhancementsTableTableManager(_db, _db.enhancements);
  $$StrategemsTableTableManager get strategems =>
      $$StrategemsTableTableManager(_db, _db.strategems);
  $$WeaponAbilitiesTableTableManager get weaponAbilities =>
      $$WeaponAbilitiesTableTableManager(_db, _db.weaponAbilities);
  $$UnitAbilitiesTableTableManager get unitAbilities =>
      $$UnitAbilitiesTableTableManager(_db, _db.unitAbilities);
  $$UserArmiesTableTableManager get userArmies =>
      $$UserArmiesTableTableManager(_db, _db.userArmies);
}

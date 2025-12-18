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
  static const VerificationMeta _factionMeta = const VerificationMeta(
    'faction',
  );
  @override
  late final GeneratedColumn<String> faction = GeneratedColumn<String>(
    'faction',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, faction];
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
    if (data.containsKey('faction')) {
      context.handle(
        _factionMeta,
        faction.isAcceptableOrUnknown(data['faction']!, _factionMeta),
      );
    } else if (isInserting) {
      context.missing(_factionMeta);
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
      faction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}faction'],
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
  final String faction;
  const Faction({required this.id, required this.faction});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['faction'] = Variable<String>(faction);
    return map;
  }

  FactionsCompanion toCompanion(bool nullToAbsent) {
    return FactionsCompanion(id: Value(id), faction: Value(faction));
  }

  factory Faction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Faction(
      id: serializer.fromJson<int>(json['id']),
      faction: serializer.fromJson<String>(json['faction']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'faction': serializer.toJson<String>(faction),
    };
  }

  Faction copyWith({int? id, String? faction}) =>
      Faction(id: id ?? this.id, faction: faction ?? this.faction);
  Faction copyWithCompanion(FactionsCompanion data) {
    return Faction(
      id: data.id.present ? data.id.value : this.id,
      faction: data.faction.present ? data.faction.value : this.faction,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Faction(')
          ..write('id: $id, ')
          ..write('faction: $faction')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, faction);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Faction &&
          other.id == this.id &&
          other.faction == this.faction);
}

class FactionsCompanion extends UpdateCompanion<Faction> {
  final Value<int> id;
  final Value<String> faction;
  const FactionsCompanion({
    this.id = const Value.absent(),
    this.faction = const Value.absent(),
  });
  FactionsCompanion.insert({
    this.id = const Value.absent(),
    required String faction,
  }) : faction = Value(faction);
  static Insertable<Faction> custom({
    Expression<int>? id,
    Expression<String>? faction,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (faction != null) 'faction': faction,
    });
  }

  FactionsCompanion copyWith({Value<int>? id, Value<String>? faction}) {
    return FactionsCompanion(
      id: id ?? this.id,
      faction: faction ?? this.faction,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (faction.present) {
      map['faction'] = Variable<String>(faction.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FactionsCompanion(')
          ..write('id: $id, ')
          ..write('faction: $faction')
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
  static const VerificationMeta _codexMeta = const VerificationMeta('codex');
  @override
  late final GeneratedColumn<String> codex = GeneratedColumn<String>(
    'codex',
    aliasedName,
    false,
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
  List<GeneratedColumn> get $columns => [id, codex, factionId];
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
    }
    if (data.containsKey('codex')) {
      context.handle(
        _codexMeta,
        codex.isAcceptableOrUnknown(data['codex']!, _codexMeta),
      );
    } else if (isInserting) {
      context.missing(_codexMeta);
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
  Codexe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Codexe(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      codex: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codex'],
      )!,
      factionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}faction_id'],
      )!,
    );
  }

  @override
  $CodexesTable createAlias(String alias) {
    return $CodexesTable(attachedDatabase, alias);
  }
}

class Codexe extends DataClass implements Insertable<Codexe> {
  final int id;
  final String codex;
  final int factionId;
  const Codexe({
    required this.id,
    required this.codex,
    required this.factionId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['codex'] = Variable<String>(codex);
    map['faction_id'] = Variable<int>(factionId);
    return map;
  }

  CodexesCompanion toCompanion(bool nullToAbsent) {
    return CodexesCompanion(
      id: Value(id),
      codex: Value(codex),
      factionId: Value(factionId),
    );
  }

  factory Codexe.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Codexe(
      id: serializer.fromJson<int>(json['id']),
      codex: serializer.fromJson<String>(json['codex']),
      factionId: serializer.fromJson<int>(json['factionId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'codex': serializer.toJson<String>(codex),
      'factionId': serializer.toJson<int>(factionId),
    };
  }

  Codexe copyWith({int? id, String? codex, int? factionId}) => Codexe(
    id: id ?? this.id,
    codex: codex ?? this.codex,
    factionId: factionId ?? this.factionId,
  );
  Codexe copyWithCompanion(CodexesCompanion data) {
    return Codexe(
      id: data.id.present ? data.id.value : this.id,
      codex: data.codex.present ? data.codex.value : this.codex,
      factionId: data.factionId.present ? data.factionId.value : this.factionId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Codexe(')
          ..write('id: $id, ')
          ..write('codex: $codex, ')
          ..write('factionId: $factionId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, codex, factionId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Codexe &&
          other.id == this.id &&
          other.codex == this.codex &&
          other.factionId == this.factionId);
}

class CodexesCompanion extends UpdateCompanion<Codexe> {
  final Value<int> id;
  final Value<String> codex;
  final Value<int> factionId;
  const CodexesCompanion({
    this.id = const Value.absent(),
    this.codex = const Value.absent(),
    this.factionId = const Value.absent(),
  });
  CodexesCompanion.insert({
    this.id = const Value.absent(),
    required String codex,
    required int factionId,
  }) : codex = Value(codex),
       factionId = Value(factionId);
  static Insertable<Codexe> custom({
    Expression<int>? id,
    Expression<String>? codex,
    Expression<int>? factionId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (codex != null) 'codex': codex,
      if (factionId != null) 'faction_id': factionId,
    });
  }

  CodexesCompanion copyWith({
    Value<int>? id,
    Value<String>? codex,
    Value<int>? factionId,
  }) {
    return CodexesCompanion(
      id: id ?? this.id,
      codex: codex ?? this.codex,
      factionId: factionId ?? this.factionId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (codex.present) {
      map['codex'] = Variable<String>(codex.value);
    }
    if (factionId.present) {
      map['faction_id'] = Variable<int>(factionId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CodexesCompanion(')
          ..write('id: $id, ')
          ..write('codex: $codex, ')
          ..write('factionId: $factionId')
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
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, role];
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
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
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
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
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
  final String role;
  const RoleData({required this.id, required this.role});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['role'] = Variable<String>(role);
    return map;
  }

  RoleCompanion toCompanion(bool nullToAbsent) {
    return RoleCompanion(id: Value(id), role: Value(role));
  }

  factory RoleData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoleData(
      id: serializer.fromJson<int>(json['id']),
      role: serializer.fromJson<String>(json['role']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'role': serializer.toJson<String>(role),
    };
  }

  RoleData copyWith({int? id, String? role}) =>
      RoleData(id: id ?? this.id, role: role ?? this.role);
  RoleData copyWithCompanion(RoleCompanion data) {
    return RoleData(
      id: data.id.present ? data.id.value : this.id,
      role: data.role.present ? data.role.value : this.role,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoleData(')
          ..write('id: $id, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, role);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoleData && other.id == this.id && other.role == this.role);
}

class RoleCompanion extends UpdateCompanion<RoleData> {
  final Value<int> id;
  final Value<String> role;
  const RoleCompanion({
    this.id = const Value.absent(),
    this.role = const Value.absent(),
  });
  RoleCompanion.insert({this.id = const Value.absent(), required String role})
    : role = Value(role);
  static Insertable<RoleData> custom({
    Expression<int>? id,
    Expression<String>? role,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (role != null) 'role': role,
    });
  }

  RoleCompanion copyWith({Value<int>? id, Value<String>? role}) {
    return RoleCompanion(id: id ?? this.id, role: role ?? this.role);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoleCompanion(')
          ..write('id: $id, ')
          ..write('role: $role')
          ..write(')'))
        .toString();
  }
}

class $UnitsTable extends Units with TableInfo<$UnitsTable, Unit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
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
  static const VerificationMeta _codexIdMeta = const VerificationMeta(
    'codexId',
  );
  @override
  late final GeneratedColumn<int> codexId = GeneratedColumn<int>(
    'codex_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
  List<GeneratedColumn> get $columns => [id, name, factionId, codexId, roleId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'units';
  @override
  VerificationContext validateIntegrity(
    Insertable<Unit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Unit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Unit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      factionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}faction_id'],
      )!,
      codexId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}codex_id'],
      ),
      roleId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}role_id'],
      )!,
    );
  }

  @override
  $UnitsTable createAlias(String alias) {
    return $UnitsTable(attachedDatabase, alias);
  }
}

class Unit extends DataClass implements Insertable<Unit> {
  final int id;
  final String name;
  final int factionId;
  final int? codexId;
  final int roleId;
  const Unit({
    required this.id,
    required this.name,
    required this.factionId,
    this.codexId,
    required this.roleId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['faction_id'] = Variable<int>(factionId);
    if (!nullToAbsent || codexId != null) {
      map['codex_id'] = Variable<int>(codexId);
    }
    map['role_id'] = Variable<int>(roleId);
    return map;
  }

  UnitsCompanion toCompanion(bool nullToAbsent) {
    return UnitsCompanion(
      id: Value(id),
      name: Value(name),
      factionId: Value(factionId),
      codexId: codexId == null && nullToAbsent
          ? const Value.absent()
          : Value(codexId),
      roleId: Value(roleId),
    );
  }

  factory Unit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Unit(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      factionId: serializer.fromJson<int>(json['factionId']),
      codexId: serializer.fromJson<int?>(json['codexId']),
      roleId: serializer.fromJson<int>(json['roleId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'factionId': serializer.toJson<int>(factionId),
      'codexId': serializer.toJson<int?>(codexId),
      'roleId': serializer.toJson<int>(roleId),
    };
  }

  Unit copyWith({
    int? id,
    String? name,
    int? factionId,
    Value<int?> codexId = const Value.absent(),
    int? roleId,
  }) => Unit(
    id: id ?? this.id,
    name: name ?? this.name,
    factionId: factionId ?? this.factionId,
    codexId: codexId.present ? codexId.value : this.codexId,
    roleId: roleId ?? this.roleId,
  );
  Unit copyWithCompanion(UnitsCompanion data) {
    return Unit(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      factionId: data.factionId.present ? data.factionId.value : this.factionId,
      codexId: data.codexId.present ? data.codexId.value : this.codexId,
      roleId: data.roleId.present ? data.roleId.value : this.roleId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Unit(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('factionId: $factionId, ')
          ..write('codexId: $codexId, ')
          ..write('roleId: $roleId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, factionId, codexId, roleId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Unit &&
          other.id == this.id &&
          other.name == this.name &&
          other.factionId == this.factionId &&
          other.codexId == this.codexId &&
          other.roleId == this.roleId);
}

class UnitsCompanion extends UpdateCompanion<Unit> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> factionId;
  final Value<int?> codexId;
  final Value<int> roleId;
  const UnitsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.factionId = const Value.absent(),
    this.codexId = const Value.absent(),
    this.roleId = const Value.absent(),
  });
  UnitsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int factionId,
    this.codexId = const Value.absent(),
    required int roleId,
  }) : name = Value(name),
       factionId = Value(factionId),
       roleId = Value(roleId);
  static Insertable<Unit> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? factionId,
    Expression<int>? codexId,
    Expression<int>? roleId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (factionId != null) 'faction_id': factionId,
      if (codexId != null) 'codex_id': codexId,
      if (roleId != null) 'role_id': roleId,
    });
  }

  UnitsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? factionId,
    Value<int?>? codexId,
    Value<int>? roleId,
  }) {
    return UnitsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      factionId: factionId ?? this.factionId,
      codexId: codexId ?? this.codexId,
      roleId: roleId ?? this.roleId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (factionId.present) {
      map['faction_id'] = Variable<int>(factionId.value);
    }
    if (codexId.present) {
      map['codex_id'] = Variable<int>(codexId.value);
    }
    if (roleId.present) {
      map['role_id'] = Variable<int>(roleId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('factionId: $factionId, ')
          ..write('codexId: $codexId, ')
          ..write('roleId: $roleId')
          ..write(')'))
        .toString();
  }
}

class $DetachmentsTable extends Detachments
    with TableInfo<$DetachmentsTable, Detachment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DetachmentsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _ruleNameMeta = const VerificationMeta(
    'ruleName',
  );
  @override
  late final GeneratedColumn<String> ruleName = GeneratedColumn<String>(
    'rule_name',
    aliasedName,
    false,
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
    Insertable<Detachment> instance, {
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Detachment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Detachment(
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

class Detachment extends DataClass implements Insertable<Detachment> {
  final int id;
  final String code;
  final String name;
  final String description;
  final String ruleName;
  final String ruleShort;
  final String ruleFull;
  const Detachment({
    required this.id,
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
    map['id'] = Variable<int>(id);
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
      code: Value(code),
      name: Value(name),
      description: Value(description),
      ruleName: Value(ruleName),
      ruleShort: Value(ruleShort),
      ruleFull: Value(ruleFull),
    );
  }

  factory Detachment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Detachment(
      id: serializer.fromJson<int>(json['id']),
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
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'ruleName': serializer.toJson<String>(ruleName),
      'ruleShort': serializer.toJson<String>(ruleShort),
      'ruleFull': serializer.toJson<String>(ruleFull),
    };
  }

  Detachment copyWith({
    int? id,
    String? code,
    String? name,
    String? description,
    String? ruleName,
    String? ruleShort,
    String? ruleFull,
  }) => Detachment(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    description: description ?? this.description,
    ruleName: ruleName ?? this.ruleName,
    ruleShort: ruleShort ?? this.ruleShort,
    ruleFull: ruleFull ?? this.ruleFull,
  );
  Detachment copyWithCompanion(DetachmentsCompanion data) {
    return Detachment(
      id: data.id.present ? data.id.value : this.id,
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
    return (StringBuffer('Detachment(')
          ..write('id: $id, ')
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
  int get hashCode =>
      Object.hash(id, code, name, description, ruleName, ruleShort, ruleFull);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Detachment &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.description == this.description &&
          other.ruleName == this.ruleName &&
          other.ruleShort == this.ruleShort &&
          other.ruleFull == this.ruleFull);
}

class DetachmentsCompanion extends UpdateCompanion<Detachment> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> description;
  final Value<String> ruleName;
  final Value<String> ruleShort;
  final Value<String> ruleFull;
  const DetachmentsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.ruleName = const Value.absent(),
    this.ruleShort = const Value.absent(),
    this.ruleFull = const Value.absent(),
  });
  DetachmentsCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String name,
    required String description,
    required String ruleName,
    required String ruleShort,
    required String ruleFull,
  }) : code = Value(code),
       name = Value(name),
       description = Value(description),
       ruleName = Value(ruleName),
       ruleShort = Value(ruleShort),
       ruleFull = Value(ruleFull);
  static Insertable<Detachment> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? ruleName,
    Expression<String>? ruleShort,
    Expression<String>? ruleFull,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (ruleName != null) 'rule_name': ruleName,
      if (ruleShort != null) 'rule_short': ruleShort,
      if (ruleFull != null) 'rule_full': ruleFull,
    });
  }

  DetachmentsCompanion copyWith({
    Value<int>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String>? description,
    Value<String>? ruleName,
    Value<String>? ruleShort,
    Value<String>? ruleFull,
  }) {
    return DetachmentsCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      ruleName: ruleName ?? this.ruleName,
      ruleShort: ruleShort ?? this.ruleShort,
      ruleFull: ruleFull ?? this.ruleFull,
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
    if (ruleName.present) {
      map['rule_name'] = Variable<String>(ruleName.value);
    }
    if (ruleShort.present) {
      map['rule_short'] = Variable<String>(ruleShort.value);
    }
    if (ruleFull.present) {
      map['rule_full'] = Variable<String>(ruleFull.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DetachmentsCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('ruleName: $ruleName, ')
          ..write('ruleShort: $ruleShort, ')
          ..write('ruleFull: $ruleFull')
          ..write(')'))
        .toString();
  }
}

class $DetachmentCodexTable extends DetachmentCodex
    with TableInfo<$DetachmentCodexTable, DetachmentCodexData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DetachmentCodexTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _detachmentIdMeta = const VerificationMeta(
    'detachmentId',
  );
  @override
  late final GeneratedColumn<int> detachmentId = GeneratedColumn<int>(
    'detachment_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES detachments (id)',
    ),
  );
  static const VerificationMeta _codexIdMeta = const VerificationMeta(
    'codexId',
  );
  @override
  late final GeneratedColumn<int> codexId = GeneratedColumn<int>(
    'codex_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES codexes (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, detachmentId, codexId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'detachment_codex';
  @override
  VerificationContext validateIntegrity(
    Insertable<DetachmentCodexData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('codex_id')) {
      context.handle(
        _codexIdMeta,
        codexId.isAcceptableOrUnknown(data['codex_id']!, _codexIdMeta),
      );
    } else if (isInserting) {
      context.missing(_codexIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {detachmentId, codexId},
  ];
  @override
  DetachmentCodexData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DetachmentCodexData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      detachmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}detachment_id'],
      )!,
      codexId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}codex_id'],
      )!,
    );
  }

  @override
  $DetachmentCodexTable createAlias(String alias) {
    return $DetachmentCodexTable(attachedDatabase, alias);
  }
}

class DetachmentCodexData extends DataClass
    implements Insertable<DetachmentCodexData> {
  final int id;
  final int detachmentId;
  final int codexId;
  const DetachmentCodexData({
    required this.id,
    required this.detachmentId,
    required this.codexId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['detachment_id'] = Variable<int>(detachmentId);
    map['codex_id'] = Variable<int>(codexId);
    return map;
  }

  DetachmentCodexCompanion toCompanion(bool nullToAbsent) {
    return DetachmentCodexCompanion(
      id: Value(id),
      detachmentId: Value(detachmentId),
      codexId: Value(codexId),
    );
  }

  factory DetachmentCodexData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DetachmentCodexData(
      id: serializer.fromJson<int>(json['id']),
      detachmentId: serializer.fromJson<int>(json['detachmentId']),
      codexId: serializer.fromJson<int>(json['codexId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'detachmentId': serializer.toJson<int>(detachmentId),
      'codexId': serializer.toJson<int>(codexId),
    };
  }

  DetachmentCodexData copyWith({int? id, int? detachmentId, int? codexId}) =>
      DetachmentCodexData(
        id: id ?? this.id,
        detachmentId: detachmentId ?? this.detachmentId,
        codexId: codexId ?? this.codexId,
      );
  DetachmentCodexData copyWithCompanion(DetachmentCodexCompanion data) {
    return DetachmentCodexData(
      id: data.id.present ? data.id.value : this.id,
      detachmentId: data.detachmentId.present
          ? data.detachmentId.value
          : this.detachmentId,
      codexId: data.codexId.present ? data.codexId.value : this.codexId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DetachmentCodexData(')
          ..write('id: $id, ')
          ..write('detachmentId: $detachmentId, ')
          ..write('codexId: $codexId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, detachmentId, codexId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DetachmentCodexData &&
          other.id == this.id &&
          other.detachmentId == this.detachmentId &&
          other.codexId == this.codexId);
}

class DetachmentCodexCompanion extends UpdateCompanion<DetachmentCodexData> {
  final Value<int> id;
  final Value<int> detachmentId;
  final Value<int> codexId;
  const DetachmentCodexCompanion({
    this.id = const Value.absent(),
    this.detachmentId = const Value.absent(),
    this.codexId = const Value.absent(),
  });
  DetachmentCodexCompanion.insert({
    this.id = const Value.absent(),
    required int detachmentId,
    required int codexId,
  }) : detachmentId = Value(detachmentId),
       codexId = Value(codexId);
  static Insertable<DetachmentCodexData> custom({
    Expression<int>? id,
    Expression<int>? detachmentId,
    Expression<int>? codexId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (detachmentId != null) 'detachment_id': detachmentId,
      if (codexId != null) 'codex_id': codexId,
    });
  }

  DetachmentCodexCompanion copyWith({
    Value<int>? id,
    Value<int>? detachmentId,
    Value<int>? codexId,
  }) {
    return DetachmentCodexCompanion(
      id: id ?? this.id,
      detachmentId: detachmentId ?? this.detachmentId,
      codexId: codexId ?? this.codexId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (detachmentId.present) {
      map['detachment_id'] = Variable<int>(detachmentId.value);
    }
    if (codexId.present) {
      map['codex_id'] = Variable<int>(codexId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DetachmentCodexCompanion(')
          ..write('id: $id, ')
          ..write('detachmentId: $detachmentId, ')
          ..write('codexId: $codexId')
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
  late final GeneratedColumn<int> detachmentId = GeneratedColumn<int>(
    'detachment_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
        DriftSqlType.int,
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
  final int detachmentId;
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
    map['detachment_id'] = Variable<int>(detachmentId);
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
      detachmentId: serializer.fromJson<int>(json['detachmentId']),
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
      'detachmentId': serializer.toJson<int>(detachmentId),
      'points': serializer.toJson<int>(points),
    };
  }

  Enhancement copyWith({
    String? id,
    String? code,
    String? name,
    String? description,
    int? detachmentId,
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
  final Value<int> detachmentId;
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
    required int detachmentId,
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
    Expression<int>? detachmentId,
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
    Value<int>? detachmentId,
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
      map['detachment_id'] = Variable<int>(detachmentId.value);
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
  static const VerificationMeta _conditionMeta = const VerificationMeta(
    'condition',
  );
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
    'condition',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _oncePerBattleMeta = const VerificationMeta(
    'oncePerBattle',
  );
  @override
  late final GeneratedColumn<bool> oncePerBattle = GeneratedColumn<bool>(
    'once_per_battle',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("once_per_battle" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
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
  late final GeneratedColumn<int> detachmentId = GeneratedColumn<int>(
    'detachment_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
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
    condition,
    oncePerBattle,
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
    if (data.containsKey('condition')) {
      context.handle(
        _conditionMeta,
        condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta),
      );
    }
    if (data.containsKey('once_per_battle')) {
      context.handle(
        _oncePerBattleMeta,
        oncePerBattle.isAcceptableOrUnknown(
          data['once_per_battle']!,
          _oncePerBattleMeta,
        ),
      );
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
      condition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition'],
      ),
      oncePerBattle: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}once_per_battle'],
      )!,
      codexId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}codex_id'],
      )!,
      detachmentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
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
  final String id;
  final String code;
  final String name;
  final String description;
  final int cpCost;
  final String phase;
  final String target;
  final String effect;
  final String? condition;
  final bool oncePerBattle;

  /// Всегда задан — стратегемы не бывают вне Codex
  final String codexId;

  /// NULL → базовая стратегема
  /// NOT NULL → detachment-стратегема
  final int? detachmentId;
  const Strategem({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.cpCost,
    required this.phase,
    required this.target,
    required this.effect,
    this.condition,
    required this.oncePerBattle,
    required this.codexId,
    this.detachmentId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['cp_cost'] = Variable<int>(cpCost);
    map['phase'] = Variable<String>(phase);
    map['target'] = Variable<String>(target);
    map['effect'] = Variable<String>(effect);
    if (!nullToAbsent || condition != null) {
      map['condition'] = Variable<String>(condition);
    }
    map['once_per_battle'] = Variable<bool>(oncePerBattle);
    map['codex_id'] = Variable<String>(codexId);
    if (!nullToAbsent || detachmentId != null) {
      map['detachment_id'] = Variable<int>(detachmentId);
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
      condition: condition == null && nullToAbsent
          ? const Value.absent()
          : Value(condition),
      oncePerBattle: Value(oncePerBattle),
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
      id: serializer.fromJson<String>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      cpCost: serializer.fromJson<int>(json['cpCost']),
      phase: serializer.fromJson<String>(json['phase']),
      target: serializer.fromJson<String>(json['target']),
      effect: serializer.fromJson<String>(json['effect']),
      condition: serializer.fromJson<String?>(json['condition']),
      oncePerBattle: serializer.fromJson<bool>(json['oncePerBattle']),
      codexId: serializer.fromJson<String>(json['codexId']),
      detachmentId: serializer.fromJson<int?>(json['detachmentId']),
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
      'cpCost': serializer.toJson<int>(cpCost),
      'phase': serializer.toJson<String>(phase),
      'target': serializer.toJson<String>(target),
      'effect': serializer.toJson<String>(effect),
      'condition': serializer.toJson<String?>(condition),
      'oncePerBattle': serializer.toJson<bool>(oncePerBattle),
      'codexId': serializer.toJson<String>(codexId),
      'detachmentId': serializer.toJson<int?>(detachmentId),
    };
  }

  Strategem copyWith({
    String? id,
    String? code,
    String? name,
    String? description,
    int? cpCost,
    String? phase,
    String? target,
    String? effect,
    Value<String?> condition = const Value.absent(),
    bool? oncePerBattle,
    String? codexId,
    Value<int?> detachmentId = const Value.absent(),
  }) => Strategem(
    id: id ?? this.id,
    code: code ?? this.code,
    name: name ?? this.name,
    description: description ?? this.description,
    cpCost: cpCost ?? this.cpCost,
    phase: phase ?? this.phase,
    target: target ?? this.target,
    effect: effect ?? this.effect,
    condition: condition.present ? condition.value : this.condition,
    oncePerBattle: oncePerBattle ?? this.oncePerBattle,
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
      condition: data.condition.present ? data.condition.value : this.condition,
      oncePerBattle: data.oncePerBattle.present
          ? data.oncePerBattle.value
          : this.oncePerBattle,
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
          ..write('condition: $condition, ')
          ..write('oncePerBattle: $oncePerBattle, ')
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
    condition,
    oncePerBattle,
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
          other.condition == this.condition &&
          other.oncePerBattle == this.oncePerBattle &&
          other.codexId == this.codexId &&
          other.detachmentId == this.detachmentId);
}

class StrategemsCompanion extends UpdateCompanion<Strategem> {
  final Value<String> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> description;
  final Value<int> cpCost;
  final Value<String> phase;
  final Value<String> target;
  final Value<String> effect;
  final Value<String?> condition;
  final Value<bool> oncePerBattle;
  final Value<String> codexId;
  final Value<int?> detachmentId;
  final Value<int> rowid;
  const StrategemsCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.cpCost = const Value.absent(),
    this.phase = const Value.absent(),
    this.target = const Value.absent(),
    this.effect = const Value.absent(),
    this.condition = const Value.absent(),
    this.oncePerBattle = const Value.absent(),
    this.codexId = const Value.absent(),
    this.detachmentId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StrategemsCompanion.insert({
    required String id,
    required String code,
    required String name,
    required String description,
    required int cpCost,
    required String phase,
    required String target,
    required String effect,
    this.condition = const Value.absent(),
    this.oncePerBattle = const Value.absent(),
    required String codexId,
    this.detachmentId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       code = Value(code),
       name = Value(name),
       description = Value(description),
       cpCost = Value(cpCost),
       phase = Value(phase),
       target = Value(target),
       effect = Value(effect),
       codexId = Value(codexId);
  static Insertable<Strategem> custom({
    Expression<String>? id,
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? cpCost,
    Expression<String>? phase,
    Expression<String>? target,
    Expression<String>? effect,
    Expression<String>? condition,
    Expression<bool>? oncePerBattle,
    Expression<String>? codexId,
    Expression<int>? detachmentId,
    Expression<int>? rowid,
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
      if (condition != null) 'condition': condition,
      if (oncePerBattle != null) 'once_per_battle': oncePerBattle,
      if (codexId != null) 'codex_id': codexId,
      if (detachmentId != null) 'detachment_id': detachmentId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StrategemsCompanion copyWith({
    Value<String>? id,
    Value<String>? code,
    Value<String>? name,
    Value<String>? description,
    Value<int>? cpCost,
    Value<String>? phase,
    Value<String>? target,
    Value<String>? effect,
    Value<String?>? condition,
    Value<bool>? oncePerBattle,
    Value<String>? codexId,
    Value<int?>? detachmentId,
    Value<int>? rowid,
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
      condition: condition ?? this.condition,
      oncePerBattle: oncePerBattle ?? this.oncePerBattle,
      codexId: codexId ?? this.codexId,
      detachmentId: detachmentId ?? this.detachmentId,
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
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (oncePerBattle.present) {
      map['once_per_battle'] = Variable<bool>(oncePerBattle.value);
    }
    if (codexId.present) {
      map['codex_id'] = Variable<String>(codexId.value);
    }
    if (detachmentId.present) {
      map['detachment_id'] = Variable<int>(detachmentId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
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
          ..write('condition: $condition, ')
          ..write('oncePerBattle: $oncePerBattle, ')
          ..write('codexId: $codexId, ')
          ..write('detachmentId: $detachmentId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FactionsTable factions = $FactionsTable(this);
  late final $CodexesTable codexes = $CodexesTable(this);
  late final $RoleTable role = $RoleTable(this);
  late final $UnitsTable units = $UnitsTable(this);
  late final $DetachmentsTable detachments = $DetachmentsTable(this);
  late final $DetachmentCodexTable detachmentCodex = $DetachmentCodexTable(
    this,
  );
  late final $EnhancementsTable enhancements = $EnhancementsTable(this);
  late final $StrategemsTable strategems = $StrategemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    factions,
    codexes,
    role,
    units,
    detachments,
    detachmentCodex,
    enhancements,
    strategems,
  ];
}

typedef $$FactionsTableCreateCompanionBuilder =
    FactionsCompanion Function({Value<int> id, required String faction});
typedef $$FactionsTableUpdateCompanionBuilder =
    FactionsCompanion Function({Value<int> id, Value<String> faction});

final class $$FactionsTableReferences
    extends BaseReferences<_$AppDatabase, $FactionsTable, Faction> {
  $$FactionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CodexesTable, List<Codexe>> _codexesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.codexes,
    aliasName: $_aliasNameGenerator(db.factions.id, db.codexes.factionId),
  );

  $$CodexesTableProcessedTableManager get codexesRefs {
    final manager = $$CodexesTableTableManager(
      $_db,
      $_db.codexes,
    ).filter((f) => f.factionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_codexesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UnitsTable, List<Unit>> _unitsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.units,
    aliasName: $_aliasNameGenerator(db.factions.id, db.units.factionId),
  );

  $$UnitsTableProcessedTableManager get unitsRefs {
    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.factionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitsRefsTable($_db));
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

  ColumnFilters<String> get faction => $composableBuilder(
    column: $table.faction,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> codexesRefs(
    Expression<bool> Function($$CodexesTableFilterComposer f) f,
  ) {
    final $$CodexesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.factionId,
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
      getReferencedColumn: (t) => t.factionId,
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

  ColumnOrderings<String> get faction => $composableBuilder(
    column: $table.faction,
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

  GeneratedColumn<String> get faction =>
      $composableBuilder(column: $table.faction, builder: (column) => column);

  Expression<T> codexesRefs<T extends Object>(
    Expression<T> Function($$CodexesTableAnnotationComposer a) f,
  ) {
    final $$CodexesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.codexes,
      getReferencedColumn: (t) => t.factionId,
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
      getReferencedColumn: (t) => t.factionId,
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
          PrefetchHooks Function({bool codexesRefs, bool unitsRefs})
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
                Value<String> faction = const Value.absent(),
              }) => FactionsCompanion(id: id, faction: faction),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String faction,
              }) => FactionsCompanion.insert(id: id, faction: faction),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FactionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({codexesRefs = false, unitsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (codexesRefs) db.codexes,
                if (unitsRefs) db.units,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (codexesRefs)
                    await $_getPrefetchedData<Faction, $FactionsTable, Codexe>(
                      currentTable: table,
                      referencedTable: $$FactionsTableReferences
                          ._codexesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FactionsTableReferences(db, table, p0).codexesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.factionId == item.id),
                      typedResults: items,
                    ),
                  if (unitsRefs)
                    await $_getPrefetchedData<Faction, $FactionsTable, Unit>(
                      currentTable: table,
                      referencedTable: $$FactionsTableReferences
                          ._unitsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$FactionsTableReferences(db, table, p0).unitsRefs,
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
      PrefetchHooks Function({bool codexesRefs, bool unitsRefs})
    >;
typedef $$CodexesTableCreateCompanionBuilder =
    CodexesCompanion Function({
      Value<int> id,
      required String codex,
      required int factionId,
    });
typedef $$CodexesTableUpdateCompanionBuilder =
    CodexesCompanion Function({
      Value<int> id,
      Value<String> codex,
      Value<int> factionId,
    });

final class $$CodexesTableReferences
    extends BaseReferences<_$AppDatabase, $CodexesTable, Codexe> {
  $$CodexesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FactionsTable _factionIdTable(_$AppDatabase db) => db.factions
      .createAlias($_aliasNameGenerator(db.codexes.factionId, db.factions.id));

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

  static MultiTypedResultKey<$UnitsTable, List<Unit>> _unitsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.units,
    aliasName: $_aliasNameGenerator(db.codexes.id, db.units.codexId),
  );

  $$UnitsTableProcessedTableManager get unitsRefs {
    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.codexId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DetachmentCodexTable, List<DetachmentCodexData>>
  _detachmentCodexRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.detachmentCodex,
    aliasName: $_aliasNameGenerator(db.codexes.id, db.detachmentCodex.codexId),
  );

  $$DetachmentCodexTableProcessedTableManager get detachmentCodexRefs {
    final manager = $$DetachmentCodexTableTableManager(
      $_db,
      $_db.detachmentCodex,
    ).filter((f) => f.codexId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _detachmentCodexRefsTable($_db),
    );
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
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get codex => $composableBuilder(
    column: $table.codex,
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

  Expression<bool> detachmentCodexRefs(
    Expression<bool> Function($$DetachmentCodexTableFilterComposer f) f,
  ) {
    final $$DetachmentCodexTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.detachmentCodex,
      getReferencedColumn: (t) => t.codexId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetachmentCodexTableFilterComposer(
            $db: $db,
            $table: $db.detachmentCodex,
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
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get codex => $composableBuilder(
    column: $table.codex,
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

class $$CodexesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CodexesTable> {
  $$CodexesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get codex =>
      $composableBuilder(column: $table.codex, builder: (column) => column);

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

  Expression<T> detachmentCodexRefs<T extends Object>(
    Expression<T> Function($$DetachmentCodexTableAnnotationComposer a) f,
  ) {
    final $$DetachmentCodexTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.detachmentCodex,
      getReferencedColumn: (t) => t.codexId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetachmentCodexTableAnnotationComposer(
            $db: $db,
            $table: $db.detachmentCodex,
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
            bool factionId,
            bool unitsRefs,
            bool detachmentCodexRefs,
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
                Value<int> id = const Value.absent(),
                Value<String> codex = const Value.absent(),
                Value<int> factionId = const Value.absent(),
              }) =>
                  CodexesCompanion(id: id, codex: codex, factionId: factionId),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String codex,
                required int factionId,
              }) => CodexesCompanion.insert(
                id: id,
                codex: codex,
                factionId: factionId,
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
                factionId = false,
                unitsRefs = false,
                detachmentCodexRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (unitsRefs) db.units,
                    if (detachmentCodexRefs) db.detachmentCodex,
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
                                    referencedTable: $$CodexesTableReferences
                                        ._factionIdTable(db),
                                    referencedColumn: $$CodexesTableReferences
                                        ._factionIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (unitsRefs)
                        await $_getPrefetchedData<Codexe, $CodexesTable, Unit>(
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
                      if (detachmentCodexRefs)
                        await $_getPrefetchedData<
                          Codexe,
                          $CodexesTable,
                          DetachmentCodexData
                        >(
                          currentTable: table,
                          referencedTable: $$CodexesTableReferences
                              ._detachmentCodexRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CodexesTableReferences(
                                db,
                                table,
                                p0,
                              ).detachmentCodexRefs,
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
        bool factionId,
        bool unitsRefs,
        bool detachmentCodexRefs,
      })
    >;
typedef $$RoleTableCreateCompanionBuilder =
    RoleCompanion Function({Value<int> id, required String role});
typedef $$RoleTableUpdateCompanionBuilder =
    RoleCompanion Function({Value<int> id, Value<String> role});

final class $$RoleTableReferences
    extends BaseReferences<_$AppDatabase, $RoleTable, RoleData> {
  $$RoleTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UnitsTable, List<Unit>> _unitsRefsTable(
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

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
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

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
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

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

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
                Value<String> role = const Value.absent(),
              }) => RoleCompanion(id: id, role: role),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String role}) =>
                  RoleCompanion.insert(id: id, role: role),
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
                    await $_getPrefetchedData<RoleData, $RoleTable, Unit>(
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
      Value<int> id,
      required String name,
      required int factionId,
      Value<int?> codexId,
      required int roleId,
    });
typedef $$UnitsTableUpdateCompanionBuilder =
    UnitsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> factionId,
      Value<int?> codexId,
      Value<int> roleId,
    });

final class $$UnitsTableReferences
    extends BaseReferences<_$AppDatabase, $UnitsTable, Unit> {
  $$UnitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FactionsTable _factionIdTable(_$AppDatabase db) => db.factions
      .createAlias($_aliasNameGenerator(db.units.factionId, db.factions.id));

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

  static $CodexesTable _codexIdTable(_$AppDatabase db) => db.codexes
      .createAlias($_aliasNameGenerator(db.units.codexId, db.codexes.id));

  $$CodexesTableProcessedTableManager? get codexId {
    final $_column = $_itemColumn<int>('codex_id');
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
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
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
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

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
          Unit,
          $$UnitsTableFilterComposer,
          $$UnitsTableOrderingComposer,
          $$UnitsTableAnnotationComposer,
          $$UnitsTableCreateCompanionBuilder,
          $$UnitsTableUpdateCompanionBuilder,
          (Unit, $$UnitsTableReferences),
          Unit,
          PrefetchHooks Function({bool factionId, bool codexId, bool roleId})
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
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> factionId = const Value.absent(),
                Value<int?> codexId = const Value.absent(),
                Value<int> roleId = const Value.absent(),
              }) => UnitsCompanion(
                id: id,
                name: name,
                factionId: factionId,
                codexId: codexId,
                roleId: roleId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int factionId,
                Value<int?> codexId = const Value.absent(),
                required int roleId,
              }) => UnitsCompanion.insert(
                id: id,
                name: name,
                factionId: factionId,
                codexId: codexId,
                roleId: roleId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UnitsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({factionId = false, codexId = false, roleId = false}) {
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
                        if (factionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.factionId,
                                    referencedTable: $$UnitsTableReferences
                                        ._factionIdTable(db),
                                    referencedColumn: $$UnitsTableReferences
                                        ._factionIdTable(db)
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
      Unit,
      $$UnitsTableFilterComposer,
      $$UnitsTableOrderingComposer,
      $$UnitsTableAnnotationComposer,
      $$UnitsTableCreateCompanionBuilder,
      $$UnitsTableUpdateCompanionBuilder,
      (Unit, $$UnitsTableReferences),
      Unit,
      PrefetchHooks Function({bool factionId, bool codexId, bool roleId})
    >;
typedef $$DetachmentsTableCreateCompanionBuilder =
    DetachmentsCompanion Function({
      Value<int> id,
      required String code,
      required String name,
      required String description,
      required String ruleName,
      required String ruleShort,
      required String ruleFull,
    });
typedef $$DetachmentsTableUpdateCompanionBuilder =
    DetachmentsCompanion Function({
      Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<String> description,
      Value<String> ruleName,
      Value<String> ruleShort,
      Value<String> ruleFull,
    });

final class $$DetachmentsTableReferences
    extends BaseReferences<_$AppDatabase, $DetachmentsTable, Detachment> {
  $$DetachmentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DetachmentCodexTable, List<DetachmentCodexData>>
  _detachmentCodexRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.detachmentCodex,
    aliasName: $_aliasNameGenerator(
      db.detachments.id,
      db.detachmentCodex.detachmentId,
    ),
  );

  $$DetachmentCodexTableProcessedTableManager get detachmentCodexRefs {
    final manager = $$DetachmentCodexTableTableManager(
      $_db,
      $_db.detachmentCodex,
    ).filter((f) => f.detachmentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _detachmentCodexRefsTable($_db),
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
    ).filter((f) => f.detachmentId.id.sqlEquals($_itemColumn<int>('id')!));

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
    ).filter((f) => f.detachmentId.id.sqlEquals($_itemColumn<int>('id')!));

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

  Expression<bool> detachmentCodexRefs(
    Expression<bool> Function($$DetachmentCodexTableFilterComposer f) f,
  ) {
    final $$DetachmentCodexTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.detachmentCodex,
      getReferencedColumn: (t) => t.detachmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetachmentCodexTableFilterComposer(
            $db: $db,
            $table: $db.detachmentCodex,
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

  GeneratedColumn<String> get ruleName =>
      $composableBuilder(column: $table.ruleName, builder: (column) => column);

  GeneratedColumn<String> get ruleShort =>
      $composableBuilder(column: $table.ruleShort, builder: (column) => column);

  GeneratedColumn<String> get ruleFull =>
      $composableBuilder(column: $table.ruleFull, builder: (column) => column);

  Expression<T> detachmentCodexRefs<T extends Object>(
    Expression<T> Function($$DetachmentCodexTableAnnotationComposer a) f,
  ) {
    final $$DetachmentCodexTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.detachmentCodex,
      getReferencedColumn: (t) => t.detachmentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DetachmentCodexTableAnnotationComposer(
            $db: $db,
            $table: $db.detachmentCodex,
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
          Detachment,
          $$DetachmentsTableFilterComposer,
          $$DetachmentsTableOrderingComposer,
          $$DetachmentsTableAnnotationComposer,
          $$DetachmentsTableCreateCompanionBuilder,
          $$DetachmentsTableUpdateCompanionBuilder,
          (Detachment, $$DetachmentsTableReferences),
          Detachment,
          PrefetchHooks Function({
            bool detachmentCodexRefs,
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
                Value<int> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> ruleName = const Value.absent(),
                Value<String> ruleShort = const Value.absent(),
                Value<String> ruleFull = const Value.absent(),
              }) => DetachmentsCompanion(
                id: id,
                code: code,
                name: name,
                description: description,
                ruleName: ruleName,
                ruleShort: ruleShort,
                ruleFull: ruleFull,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String code,
                required String name,
                required String description,
                required String ruleName,
                required String ruleShort,
                required String ruleFull,
              }) => DetachmentsCompanion.insert(
                id: id,
                code: code,
                name: name,
                description: description,
                ruleName: ruleName,
                ruleShort: ruleShort,
                ruleFull: ruleFull,
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
                detachmentCodexRefs = false,
                enhancementsRefs = false,
                strategemsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (detachmentCodexRefs) db.detachmentCodex,
                    if (enhancementsRefs) db.enhancements,
                    if (strategemsRefs) db.strategems,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (detachmentCodexRefs)
                        await $_getPrefetchedData<
                          Detachment,
                          $DetachmentsTable,
                          DetachmentCodexData
                        >(
                          currentTable: table,
                          referencedTable: $$DetachmentsTableReferences
                              ._detachmentCodexRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DetachmentsTableReferences(
                                db,
                                table,
                                p0,
                              ).detachmentCodexRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.detachmentId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (enhancementsRefs)
                        await $_getPrefetchedData<
                          Detachment,
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
                          Detachment,
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
      Detachment,
      $$DetachmentsTableFilterComposer,
      $$DetachmentsTableOrderingComposer,
      $$DetachmentsTableAnnotationComposer,
      $$DetachmentsTableCreateCompanionBuilder,
      $$DetachmentsTableUpdateCompanionBuilder,
      (Detachment, $$DetachmentsTableReferences),
      Detachment,
      PrefetchHooks Function({
        bool detachmentCodexRefs,
        bool enhancementsRefs,
        bool strategemsRefs,
      })
    >;
typedef $$DetachmentCodexTableCreateCompanionBuilder =
    DetachmentCodexCompanion Function({
      Value<int> id,
      required int detachmentId,
      required int codexId,
    });
typedef $$DetachmentCodexTableUpdateCompanionBuilder =
    DetachmentCodexCompanion Function({
      Value<int> id,
      Value<int> detachmentId,
      Value<int> codexId,
    });

final class $$DetachmentCodexTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DetachmentCodexTable,
          DetachmentCodexData
        > {
  $$DetachmentCodexTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DetachmentsTable _detachmentIdTable(_$AppDatabase db) =>
      db.detachments.createAlias(
        $_aliasNameGenerator(
          db.detachmentCodex.detachmentId,
          db.detachments.id,
        ),
      );

  $$DetachmentsTableProcessedTableManager get detachmentId {
    final $_column = $_itemColumn<int>('detachment_id')!;

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

  static $CodexesTable _codexIdTable(_$AppDatabase db) =>
      db.codexes.createAlias(
        $_aliasNameGenerator(db.detachmentCodex.codexId, db.codexes.id),
      );

  $$CodexesTableProcessedTableManager get codexId {
    final $_column = $_itemColumn<int>('codex_id')!;

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

class $$DetachmentCodexTableFilterComposer
    extends Composer<_$AppDatabase, $DetachmentCodexTable> {
  $$DetachmentCodexTableFilterComposer({
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

class $$DetachmentCodexTableOrderingComposer
    extends Composer<_$AppDatabase, $DetachmentCodexTable> {
  $$DetachmentCodexTableOrderingComposer({
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

class $$DetachmentCodexTableAnnotationComposer
    extends Composer<_$AppDatabase, $DetachmentCodexTable> {
  $$DetachmentCodexTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

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

class $$DetachmentCodexTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DetachmentCodexTable,
          DetachmentCodexData,
          $$DetachmentCodexTableFilterComposer,
          $$DetachmentCodexTableOrderingComposer,
          $$DetachmentCodexTableAnnotationComposer,
          $$DetachmentCodexTableCreateCompanionBuilder,
          $$DetachmentCodexTableUpdateCompanionBuilder,
          (DetachmentCodexData, $$DetachmentCodexTableReferences),
          DetachmentCodexData,
          PrefetchHooks Function({bool detachmentId, bool codexId})
        > {
  $$DetachmentCodexTableTableManager(
    _$AppDatabase db,
    $DetachmentCodexTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DetachmentCodexTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DetachmentCodexTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DetachmentCodexTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> detachmentId = const Value.absent(),
                Value<int> codexId = const Value.absent(),
              }) => DetachmentCodexCompanion(
                id: id,
                detachmentId: detachmentId,
                codexId: codexId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int detachmentId,
                required int codexId,
              }) => DetachmentCodexCompanion.insert(
                id: id,
                detachmentId: detachmentId,
                codexId: codexId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DetachmentCodexTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({detachmentId = false, codexId = false}) {
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
                                referencedTable:
                                    $$DetachmentCodexTableReferences
                                        ._detachmentIdTable(db),
                                referencedColumn:
                                    $$DetachmentCodexTableReferences
                                        ._detachmentIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (codexId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.codexId,
                                referencedTable:
                                    $$DetachmentCodexTableReferences
                                        ._codexIdTable(db),
                                referencedColumn:
                                    $$DetachmentCodexTableReferences
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

typedef $$DetachmentCodexTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DetachmentCodexTable,
      DetachmentCodexData,
      $$DetachmentCodexTableFilterComposer,
      $$DetachmentCodexTableOrderingComposer,
      $$DetachmentCodexTableAnnotationComposer,
      $$DetachmentCodexTableCreateCompanionBuilder,
      $$DetachmentCodexTableUpdateCompanionBuilder,
      (DetachmentCodexData, $$DetachmentCodexTableReferences),
      DetachmentCodexData,
      PrefetchHooks Function({bool detachmentId, bool codexId})
    >;
typedef $$EnhancementsTableCreateCompanionBuilder =
    EnhancementsCompanion Function({
      required String id,
      required String code,
      required String name,
      required String description,
      required int detachmentId,
      Value<int> points,
      Value<int> rowid,
    });
typedef $$EnhancementsTableUpdateCompanionBuilder =
    EnhancementsCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> name,
      Value<String> description,
      Value<int> detachmentId,
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
    final $_column = $_itemColumn<int>('detachment_id')!;

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
                Value<int> detachmentId = const Value.absent(),
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
                required int detachmentId,
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
      required String id,
      required String code,
      required String name,
      required String description,
      required int cpCost,
      required String phase,
      required String target,
      required String effect,
      Value<String?> condition,
      Value<bool> oncePerBattle,
      required String codexId,
      Value<int?> detachmentId,
      Value<int> rowid,
    });
typedef $$StrategemsTableUpdateCompanionBuilder =
    StrategemsCompanion Function({
      Value<String> id,
      Value<String> code,
      Value<String> name,
      Value<String> description,
      Value<int> cpCost,
      Value<String> phase,
      Value<String> target,
      Value<String> effect,
      Value<String?> condition,
      Value<bool> oncePerBattle,
      Value<String> codexId,
      Value<int?> detachmentId,
      Value<int> rowid,
    });

final class $$StrategemsTableReferences
    extends BaseReferences<_$AppDatabase, $StrategemsTable, Strategem> {
  $$StrategemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DetachmentsTable _detachmentIdTable(_$AppDatabase db) =>
      db.detachments.createAlias(
        $_aliasNameGenerator(db.strategems.detachmentId, db.detachments.id),
      );

  $$DetachmentsTableProcessedTableManager? get detachmentId {
    final $_column = $_itemColumn<int>('detachment_id');
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

  ColumnFilters<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get oncePerBattle => $composableBuilder(
    column: $table.oncePerBattle,
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

class $$StrategemsTableOrderingComposer
    extends Composer<_$AppDatabase, $StrategemsTable> {
  $$StrategemsTableOrderingComposer({
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

  ColumnOrderings<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get oncePerBattle => $composableBuilder(
    column: $table.oncePerBattle,
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

class $$StrategemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StrategemsTable> {
  $$StrategemsTableAnnotationComposer({
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

  GeneratedColumn<int> get cpCost =>
      $composableBuilder(column: $table.cpCost, builder: (column) => column);

  GeneratedColumn<String> get phase =>
      $composableBuilder(column: $table.phase, builder: (column) => column);

  GeneratedColumn<String> get target =>
      $composableBuilder(column: $table.target, builder: (column) => column);

  GeneratedColumn<String> get effect =>
      $composableBuilder(column: $table.effect, builder: (column) => column);

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<bool> get oncePerBattle => $composableBuilder(
    column: $table.oncePerBattle,
    builder: (column) => column,
  );

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
          PrefetchHooks Function({bool detachmentId})
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
                Value<String> id = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> cpCost = const Value.absent(),
                Value<String> phase = const Value.absent(),
                Value<String> target = const Value.absent(),
                Value<String> effect = const Value.absent(),
                Value<String?> condition = const Value.absent(),
                Value<bool> oncePerBattle = const Value.absent(),
                Value<String> codexId = const Value.absent(),
                Value<int?> detachmentId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StrategemsCompanion(
                id: id,
                code: code,
                name: name,
                description: description,
                cpCost: cpCost,
                phase: phase,
                target: target,
                effect: effect,
                condition: condition,
                oncePerBattle: oncePerBattle,
                codexId: codexId,
                detachmentId: detachmentId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String code,
                required String name,
                required String description,
                required int cpCost,
                required String phase,
                required String target,
                required String effect,
                Value<String?> condition = const Value.absent(),
                Value<bool> oncePerBattle = const Value.absent(),
                required String codexId,
                Value<int?> detachmentId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StrategemsCompanion.insert(
                id: id,
                code: code,
                name: name,
                description: description,
                cpCost: cpCost,
                phase: phase,
                target: target,
                effect: effect,
                condition: condition,
                oncePerBattle: oncePerBattle,
                codexId: codexId,
                detachmentId: detachmentId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StrategemsTableReferences(db, table, e),
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
      PrefetchHooks Function({bool detachmentId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FactionsTableTableManager get factions =>
      $$FactionsTableTableManager(_db, _db.factions);
  $$CodexesTableTableManager get codexes =>
      $$CodexesTableTableManager(_db, _db.codexes);
  $$RoleTableTableManager get role => $$RoleTableTableManager(_db, _db.role);
  $$UnitsTableTableManager get units =>
      $$UnitsTableTableManager(_db, _db.units);
  $$DetachmentsTableTableManager get detachments =>
      $$DetachmentsTableTableManager(_db, _db.detachments);
  $$DetachmentCodexTableTableManager get detachmentCodex =>
      $$DetachmentCodexTableTableManager(_db, _db.detachmentCodex);
  $$EnhancementsTableTableManager get enhancements =>
      $$EnhancementsTableTableManager(_db, _db.enhancements);
  $$StrategemsTableTableManager get strategems =>
      $$StrategemsTableTableManager(_db, _db.strategems);
}

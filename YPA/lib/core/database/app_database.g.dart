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
  @override
  List<GeneratedColumn> get $columns => [id, name, factionId, codexId];
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
  const Unit({
    required this.id,
    required this.name,
    required this.factionId,
    this.codexId,
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
    };
  }

  Unit copyWith({
    int? id,
    String? name,
    int? factionId,
    Value<int?> codexId = const Value.absent(),
  }) => Unit(
    id: id ?? this.id,
    name: name ?? this.name,
    factionId: factionId ?? this.factionId,
    codexId: codexId.present ? codexId.value : this.codexId,
  );
  Unit copyWithCompanion(UnitsCompanion data) {
    return Unit(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      factionId: data.factionId.present ? data.factionId.value : this.factionId,
      codexId: data.codexId.present ? data.codexId.value : this.codexId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Unit(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('factionId: $factionId, ')
          ..write('codexId: $codexId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, factionId, codexId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Unit &&
          other.id == this.id &&
          other.name == this.name &&
          other.factionId == this.factionId &&
          other.codexId == this.codexId);
}

class UnitsCompanion extends UpdateCompanion<Unit> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> factionId;
  final Value<int?> codexId;
  const UnitsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.factionId = const Value.absent(),
    this.codexId = const Value.absent(),
  });
  UnitsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int factionId,
    this.codexId = const Value.absent(),
  }) : name = Value(name),
       factionId = Value(factionId);
  static Insertable<Unit> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? factionId,
    Expression<int>? codexId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (factionId != null) 'faction_id': factionId,
      if (codexId != null) 'codex_id': codexId,
    });
  }

  UnitsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? factionId,
    Value<int?>? codexId,
  }) {
    return UnitsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      factionId: factionId ?? this.factionId,
      codexId: codexId ?? this.codexId,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('factionId: $factionId, ')
          ..write('codexId: $codexId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FactionsTable factions = $FactionsTable(this);
  late final $CodexesTable codexes = $CodexesTable(this);
  late final $UnitsTable units = $UnitsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    factions,
    codexes,
    units,
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
          PrefetchHooks Function({bool factionId, bool unitsRefs})
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
          prefetchHooksCallback: ({factionId = false, unitsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (unitsRefs) db.units],
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
                      referencedTable: $$CodexesTableReferences._unitsRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$CodexesTableReferences(db, table, p0).unitsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.codexId == item.id),
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
      PrefetchHooks Function({bool factionId, bool unitsRefs})
    >;
typedef $$UnitsTableCreateCompanionBuilder =
    UnitsCompanion Function({
      Value<int> id,
      required String name,
      required int factionId,
      Value<int?> codexId,
    });
typedef $$UnitsTableUpdateCompanionBuilder =
    UnitsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> factionId,
      Value<int?> codexId,
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
          PrefetchHooks Function({bool factionId, bool codexId})
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
              }) => UnitsCompanion(
                id: id,
                name: name,
                factionId: factionId,
                codexId: codexId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int factionId,
                Value<int?> codexId = const Value.absent(),
              }) => UnitsCompanion.insert(
                id: id,
                name: name,
                factionId: factionId,
                codexId: codexId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UnitsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({factionId = false, codexId = false}) {
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
      PrefetchHooks Function({bool factionId, bool codexId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FactionsTableTableManager get factions =>
      $$FactionsTableTableManager(_db, _db.factions);
  $$CodexesTableTableManager get codexes =>
      $$CodexesTableTableManager(_db, _db.codexes);
  $$UnitsTableTableManager get units =>
      $$UnitsTableTableManager(_db, _db.units);
}

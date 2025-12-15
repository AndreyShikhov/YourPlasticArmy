// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
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
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
    'points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, faction, points];
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
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('faction')) {
      context.handle(
        _factionMeta,
        faction.isAcceptableOrUnknown(data['faction']!, _factionMeta),
      );
    } else if (isInserting) {
      context.missing(_factionMeta);
    }
    if (data.containsKey('points')) {
      context.handle(
        _pointsMeta,
        points.isAcceptableOrUnknown(data['points']!, _pointsMeta),
      );
    } else if (isInserting) {
      context.missing(_pointsMeta);
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
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      faction: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}faction'],
      )!,
      points: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points'],
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
  final String name;
  final String faction;
  final int points;
  const Army({
    required this.id,
    required this.name,
    required this.faction,
    required this.points,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['faction'] = Variable<String>(faction);
    map['points'] = Variable<int>(points);
    return map;
  }

  ArmiesCompanion toCompanion(bool nullToAbsent) {
    return ArmiesCompanion(
      id: Value(id),
      name: Value(name),
      faction: Value(faction),
      points: Value(points),
    );
  }

  factory Army.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Army(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      faction: serializer.fromJson<String>(json['faction']),
      points: serializer.fromJson<int>(json['points']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'faction': serializer.toJson<String>(faction),
      'points': serializer.toJson<int>(points),
    };
  }

  Army copyWith({int? id, String? name, String? faction, int? points}) => Army(
    id: id ?? this.id,
    name: name ?? this.name,
    faction: faction ?? this.faction,
    points: points ?? this.points,
  );
  Army copyWithCompanion(ArmiesCompanion data) {
    return Army(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      faction: data.faction.present ? data.faction.value : this.faction,
      points: data.points.present ? data.points.value : this.points,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Army(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('faction: $faction, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, faction, points);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Army &&
          other.id == this.id &&
          other.name == this.name &&
          other.faction == this.faction &&
          other.points == this.points);
}

class ArmiesCompanion extends UpdateCompanion<Army> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> faction;
  final Value<int> points;
  const ArmiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.faction = const Value.absent(),
    this.points = const Value.absent(),
  });
  ArmiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String faction,
    required int points,
  }) : name = Value(name),
       faction = Value(faction),
       points = Value(points);
  static Insertable<Army> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? faction,
    Expression<int>? points,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (faction != null) 'faction': faction,
      if (points != null) 'points': points,
    });
  }

  ArmiesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? faction,
    Value<int>? points,
  }) {
    return ArmiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      faction: faction ?? this.faction,
      points: points ?? this.points,
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
    if (faction.present) {
      map['faction'] = Variable<String>(faction.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArmiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('faction: $faction, ')
          ..write('points: $points')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ArmiesTable armies = $ArmiesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [armies];
}

typedef $$ArmiesTableCreateCompanionBuilder =
    ArmiesCompanion Function({
      Value<int> id,
      required String name,
      required String faction,
      required int points,
    });
typedef $$ArmiesTableUpdateCompanionBuilder =
    ArmiesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> faction,
      Value<int> points,
    });

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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get faction => $composableBuilder(
    column: $table.faction,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnFilters(column),
  );
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get faction => $composableBuilder(
    column: $table.faction,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnOrderings(column),
  );
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

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get faction =>
      $composableBuilder(column: $table.faction, builder: (column) => column);

  GeneratedColumn<int> get points =>
      $composableBuilder(column: $table.points, builder: (column) => column);
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
          (Army, BaseReferences<_$AppDatabase, $ArmiesTable, Army>),
          Army,
          PrefetchHooks Function()
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
                Value<String> name = const Value.absent(),
                Value<String> faction = const Value.absent(),
                Value<int> points = const Value.absent(),
              }) => ArmiesCompanion(
                id: id,
                name: name,
                faction: faction,
                points: points,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String faction,
                required int points,
              }) => ArmiesCompanion.insert(
                id: id,
                name: name,
                faction: faction,
                points: points,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (Army, BaseReferences<_$AppDatabase, $ArmiesTable, Army>),
      Army,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ArmiesTableTableManager get armies =>
      $$ArmiesTableTableManager(_db, _db.armies);
}

import 'package:drift/drift.dart';

import 'codexes_table.dart';
import 'detachments_table.dart';

class Strategems extends Table {
  TextColumn get id => text()();

  TextColumn get code => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();

  IntColumn get cpCost => integer()();

  TextColumn get phase => text()();
  TextColumn get target => text()();
  TextColumn get effect => text()();
  TextColumn get condition => text().nullable()();

  BoolColumn get oncePerBattle =>
      boolean().withDefault(const Constant(false))();

  /// Всегда задан — стратегемы не бывают вне Codex
  TextColumn get codexId =>
      text().references(Codexes, #id)();

  /// NULL → базовая стратегема
  /// NOT NULL → detachment-стратегема
  IntColumn get detachmentId =>
      integer().references(Detachments, #id).nullable()();


  @override
  Set<Column> get primaryKey => {id};
}

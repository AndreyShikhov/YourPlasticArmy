import 'package:drift/drift.dart';
import 'factions_table.dart';

class Armies extends Table {
  TextColumn get id => text()();

  /// space_marines, orks
  TextColumn get armyCode => text().unique().withLength(min: 1)();

  /// Space Marines, Orks
  TextColumn get name => text().withLength(min: 1)();

  /// Imperium / Chaos / Xenos
  IntColumn get factionId =>
      integer().references(Factions, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

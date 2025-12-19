import 'package:drift/drift.dart';
import 'factions_table.dart';

class Armies extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// space_marines, orks
  TextColumn get code => text().unique()();

  /// Space Marines, Orks
  TextColumn get name => text()();

  /// Imperium / Chaos / Xenos
  IntColumn get factionId =>
      integer().references(Factions, #id)();
}

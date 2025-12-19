import 'package:drift/drift.dart';
import 'armies_table.dart';

class Codexes extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// ultramarines, blood_angels
  TextColumn get code => text().unique()();

  /// Ultramarines, Blood Angels
  TextColumn get name => text()();

  /// Codex belongs to Army
  IntColumn get armyId =>
      integer().references(Armies, #id)();
}

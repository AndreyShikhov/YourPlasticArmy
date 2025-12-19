import 'package:drift/drift.dart';


class Factions extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// Stable technical identifier for SQL & seeds
  TextColumn get code => text().unique()();
  // imperium, chaos, xenos

  /// Display name (UI, localization later)
  TextColumn get name => text()();
}

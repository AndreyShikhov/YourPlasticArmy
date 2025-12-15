import 'package:drift/drift.dart';

import 'factions_table.dart';


class Codexes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get codex => text()();

  IntColumn get factionId =>
      integer().references(Factions, #id)();
}

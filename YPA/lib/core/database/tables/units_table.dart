import 'package:drift/drift.dart';

import 'codexes_table.dart';
import 'factions_table.dart';



class Units extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();

  IntColumn get factionId =>
      integer().references(Factions, #id)();

  IntColumn get codexId =>
      integer().nullable().references(Codexes, #id)();
}

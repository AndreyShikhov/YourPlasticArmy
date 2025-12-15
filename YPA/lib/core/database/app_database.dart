import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';


import 'package:ypa/core/database/tables/codexes_table.dart';
import 'package:ypa/core/database/tables/factions_table.dart';
import 'package:ypa/core/database/tables/units_table.dart';

part 'app_database.g.dart';



// ===================
// DATABASE
// ===================
@DriftDatabase(
  tables: [
    Factions,
    Codexes,
    Units,
  ],
)


class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;


  Future<void> seedIfEmpty() async {

    await transaction(() async {

    });
  }
}

// ===================
// CONNECTION
// ===================
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'ypa.sqlite'));
    return NativeDatabase(file);
  });
}

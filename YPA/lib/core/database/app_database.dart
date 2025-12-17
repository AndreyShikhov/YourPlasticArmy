import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';


import 'package:ypa/core/database/tables/codexes_table.dart';
import 'package:ypa/core/database/tables/detachment_codexes_table.dart';
import 'package:ypa/core/database/tables/detachments_table.dart';
import 'package:ypa/core/database/tables/enhancements_table.dart';
import 'package:ypa/core/database/tables/factions_table.dart';
import 'package:ypa/core/database/tables/role_table.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/database/tables/stratagem_detachments_table.dart';
import 'package:ypa/core/database/tables/stratagems_table.dart';
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
    Role,

    Detachments,
    DetachmentCodex,
    Enhancements,

    Stratagems,
    StratagemDetachments,
  ],
)


class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;


  Future<void> seedDatabase() async {
    await transaction(() async {
    });
  }

  Future<void> clearDatabase() async {
    await transaction(() async {
      await delete(units).go();
      await delete(codexes).go();
      await delete(role).go();
      await delete(factions).go();
    });
  }

  Future<void> resetDatabase() async {
    await transaction(() async {
      await clearDatabase();
      await seedDatabase();
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



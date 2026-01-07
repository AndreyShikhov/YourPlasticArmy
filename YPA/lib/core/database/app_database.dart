import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:ypa/core/database/tables/weapon_abilities_table.dart';

// Импорт модели для конвертера (ВАЖНО!)
import 'package:ypa/domain/models/unit/unit_stats.dart';
import 'package:ypa/core/database/converters/unit_stats_converter.dart';

import 'package:ypa/core/database/tables/codexes_table.dart';
import 'package:ypa/core/database/tables/codex_detachments_table.dart';
import 'package:ypa/core/database/tables/detachments_table.dart';
import 'package:ypa/core/database/tables/enhancements_table.dart';
import 'package:ypa/core/database/tables/armies_table.dart';
import 'package:ypa/core/database/tables/factions_table.dart';
import 'package:ypa/core/database/tables/seed/seed_data.dart';


import 'package:ypa/core/database/tables/stratagems_table.dart';
import 'package:ypa/core/database/tables/role_table.dart';
import 'package:ypa/core/database/tables/units_table.dart';


part 'app_database.g.dart';



// ===================
// DATABASE
// ===================
@DriftDatabase(
  tables: [
    Factions,
    Armies,
    Codexes,
    Units,
    Role,
    Detachments,
    CodexDetachments,
    Enhancements,
    Strategems,
    WeaponAbilities,
  ],
)


class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;


  Future<void> seedDatabase() async {
    await transaction(() async {
      await seedAllData(this);
    });
  }



  Future<void> clearDatabase() async {
    await transaction(() async {

      // 1. Самые нижние уровни
      await delete(units).go();
      await delete(enhancements).go();
      await delete(strategems).go();
      await delete(weaponAbilities).go();

      // 2. M:N связи
      await delete(codexDetachments).go();

      // 3. Codex-level
      await delete(detachments).go();
      await delete(codexes).go();

      // 4. Army-level
      await delete(armies).go();

      // 5. Faction-level
      await delete(factions).go();

      // 6. Enum-like таблицы
      await delete(role).go();
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

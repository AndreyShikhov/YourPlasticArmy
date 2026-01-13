import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:ypa/core/database/tables/core_unit_abilities_table.dart';
import 'package:ypa/core/database/tables/faction_unit_abilities_table.dart';
import 'package:ypa/core/database/tables/seed/seed_data.dart';

// Импорт модели для конвертера
import 'package:ypa/domain/models/unit/unit_stats.dart';
import 'package:ypa/core/database/converters/unit_stats_converter.dart';
import 'package:ypa/core/database/tables/tables.dart';


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
    UnitAbilities,
    UserArmies,
    CoreUnitAbilities,
    FactionUnitAbilities,
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
      await delete(unitAbilities).go();
      await delete(coreUnitAbilities).go();
      await delete(factionUnitAbilities).go();
      await delete(userArmies).go();

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

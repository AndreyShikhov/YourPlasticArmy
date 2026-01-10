import '../../app_database.dart';

import 'seed_factions.dart';
import 'seed_armies.dart';
import 'seed_codexes.dart';
import 'seed_role.dart';
import 'seed_detachments.dart';
import 'seed_codex_detachment.dart';
import 'seed_enhancements.dart';
import 'seed_stratagems.dart';
import 'seed_units.dart';
import 'seed_weapon_abilities.dart';
import 'seed_unit_abilities.dart';

Future<void> seedAllData(AppDatabase db) async {
  // 1. Базовые сущности
  final factionIds     = await seedFactions(db);
  final armyIds        = await seedArmies(db, factionIds);
  final codexIds       = await seedCodexes(db, armyIds);
  final roleIds        = await seedRole(db);
  
  // 2. Детачменты и связи
  final detachmentIds = await seedDetachments(db, armyIds);
  await seedCodexDetachments(db, detachmentIds, codexIds);
  
  // 3. Дополнения и правила
  await seedEnhancements(db, detachmentIds);
  await seedStratagems(db, codexIds, detachmentIds);
  
  // 4. Способности
  await seedAllWeaponAbilities(db);
  await seedAllUnitAbilities(db);
  
  // 5. Юниты
  await seedUnits(db, armyIds, codexIds, roleIds);

}

import '../../app_database.dart';

import 'seed_factions.dart';
import 'seed_armies.dart';
import 'seed_codexes.dart';
import 'seed_role.dart';
import 'seed_detachments.dart';
import 'seed_detachment_codexes.dart';
import 'seed_enhancements.dart';
import 'seed_stratagems.dart';
import 'seed_units.dart';

Future<void> seedAllData(AppDatabase db) async {
  final factionIds = await seedFactions(db);
  final armyIds    = await seedArmies(db, factionIds);
  final codexIds   = await seedCodexes(db, armyIds);
  final roleIds    = await seedRole(db);

  final detachmentIds = await seedDetachments(db);

  await seedDetachmentCodex(db, detachmentIds, codexIds,);

  await seedEnhancements(db);
  await seedStrategems(db);

  await seedUnits(db, armyIds, codexIds, roleIds,);
}

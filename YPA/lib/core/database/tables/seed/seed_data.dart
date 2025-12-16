import 'package:ypa/core/database/tables/seed/seed_codexes.dart';
import 'package:ypa/core/database/tables/seed/seed_factions.dart';
import 'package:ypa/core/database/tables/seed/seed_role.dart';
import 'package:ypa/core/database/tables/seed/seed_units.dart';

import '../../app_database.dart';




Future<void> seedDatabase(AppDatabase db) async {
  final factionIds = await seedFactions(db);
  final codexIds = await seedCodexes(db, factionIds);
  final roleIds = await seedRole(db);
  await seedUnits(db, factionIds, codexIds, roleIds);
}
import 'package:ypa/core/database/tables/seed/seed_codexes.dart';
import 'package:ypa/core/database/tables/seed/seed_detachment_codexes.dart';
import 'package:ypa/core/database/tables/seed/seed_detachments.dart';
import 'package:ypa/core/database/tables/seed/seed_enhancements.dart';
import 'package:ypa/core/database/tables/seed/seed_factions.dart';
import 'package:ypa/core/database/tables/seed/seed_role.dart';
import 'package:ypa/core/database/tables/seed/seed_units.dart';

import '../../app_database.dart';




Future<void> seedDatabase(AppDatabase db) async {
  final factionIds = await seedFactions(db);
  final codexIds = await seedCodexes(db, factionIds);
  final roleIds = await seedRole(db);

  final detachmentIds = await seedDetachments(db);
  final detachmentCodexIds = await seedDetachmentCodex(db, detachmentIds, codexIds);
  final enhancments = await seedEnhancements(db);
  await seedUnits(db, factionIds, codexIds, roleIds);
}
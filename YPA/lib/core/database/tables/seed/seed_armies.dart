import 'package:drift/drift.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/armies/army.dart';

import '../../app_database.dart';






Future<Map<String, int>> seedArmies(
    AppDatabase db,
    Map<String, int> factionIds,
    ) async {
  final data = getAllArmies();
  final result = <String, int>{};

  for (final a in data) {
    final factionCode = a.factionCode.code;
    final armyCode = a.armyCode.code;

    if (!factionIds.containsKey(factionCode)) {
      throw StateError(
        'Seed error: unknown faction "$factionCode" for army "$armyCode"',
      );
    }

    await db.into(db.armies).insert(
      ArmiesCompanion.insert(
        armyCode: armyCode,
        name: a.armyName,
        factionId: factionIds[factionCode]!,
      ),
      mode: InsertMode.insertOrIgnore,
    );

    final armyId = await (db.select(db.armies)
      ..where((tbl) => tbl.armyCode.equals(armyCode)))
        .getSingle()
        .then((row) => row.id);

    result[armyCode] = armyId;
  }

  return result;
}


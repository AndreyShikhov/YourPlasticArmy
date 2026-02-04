/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/armies/army.dart';
import 'package:ypa/domain/models/faction/faction.dart';

import '../../app_database.dart';

Future<Map<String, String>> seedArmies(
    AppDatabase db,
    Map<String, String> factionIds
) async
{
    final data = getAllArmies();
    final result = <String, String>{};

    for (final a in data)
    {
        final factionCode = FactionCode(a.factionCode.value);
        final armyCode = a.armyCode.code;

        if (!factionIds.containsKey(factionCode.value)) 
        {
            throw StateError(
                'Seed error: unknown faction "$factionCode" for army "$armyCode"'
            );
        }

        final String armyUuid = const Uuid().v4();

        await db.into(db.armies).insert(
            ArmiesCompanion.insert(
                id: armyUuid,
                armyCode: armyCode,
                name: a.armyName,
                factionId: factionIds[factionCode.value]!
            ),
            mode: InsertMode.insertOrIgnore
        );

        // Получаем актуальный ID из базы (на случай если insertOrIgnore не сработал)
        final existingArmy = await (db.select(db.armies)
        ..where((tbl) => tbl.armyCode.equals(armyCode)))
            .getSingle();

        result[armyCode] = existingArmy.id;
    }

    return result;
}

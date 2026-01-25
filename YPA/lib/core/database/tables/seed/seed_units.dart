/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/units/blood_angels.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/units/orks.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/units/space_marines.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/units/ultramarines.dart';

import '../../../../domain/models/unit/unit.dart';
import '../../app_database.dart';

Future<void> seedUnits(
    AppDatabase db,
    Map<String, String> armyIds,
    Map<String, String> codexIds,
    Map<String, String> roleIds
) async
{
    final units = <UnitSeed>[
        ...spaceMarinesUnits(),
        ...bloodAngelsUnits(),
        ...ultramarinesUnits(),
        ...orksUnits()
    ];

    for (final u in units)
    {
        _validateUnitSeed(u, armyIds, codexIds, roleIds);

        final armyId = armyIds[u.army.code]!;

        Value<String> codexIdValue = const Value.absent();
        if (u.codex != null)
        {
            codexIdValue = Value(codexIds[u.codex!.code]!);
        }

        final unitId = u.id ?? const Uuid().v4();

        // 1. Извлекаем объект UnitStats из седа (теперь это контейнер для JSON колонки)
        final UnitStats statsToSave = UnitStats(
            repeat: u.repeat, 
            keywords: u.keywords, 
            factionKeywords: u.factionKeywords, 
            unitComposition: u.unitComposition, 
            unitAbility: u.unitAbility, 
            coreAbilities: u.coreAbilities, 
            factionAbilities: u.factionAbilities, 
            leader: u.leader, 
            ledBy: u.ledBy, 
            modelStats: u.modelStats);

        await db.into(db.units).insert(
            UnitsCompanion.insert(
                id: unitId,
                name: u.name,
                armyId: armyId,
                codexId: codexIdValue,
                roleCode: u.role.name,
                unitStats: statsToSave),
            mode: InsertMode.insertOrIgnore
        );
    }
}

void _validateUnitSeed(
    UnitSeed unit,
    Map<String, String> armyIds,
    Map<String, String> codexIds,
    Map<String, String> roleIds
)
{
    if (!armyIds.containsKey(unit.army.code))
    {
        throw StateError(
            'Seed error: unknown army "${unit.army.code}" for unit "${unit.name}"'
        );
    }

    if (!roleIds.containsKey(unit.role.code))
    {
        throw StateError(
            'Seed error: unknown role "${unit.role.code}" for unit "${unit.name}"'
        );
    }

    if (unit.codex != null && !codexIds.containsKey(unit.codex!.code))
    {
        throw StateError(
            'Seed error: unknown codex "${unit.codex!.code}" for unit "${unit.name}"'
        );
    }
}

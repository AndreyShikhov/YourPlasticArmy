/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/unit_abilities/all_unit_abilities.dart';

import '../../app_database.dart';

Future<void> seedAllUnitAbilities(AppDatabase db) async
{
    final uAbilities = allUnitAbilities();

    for (final uAbility in uAbilities)
    {
        final abilityId = uAbility.id ?? const Uuid().v4();
        await db.into(db.unitAbilities).insert(
            UnitAbilitiesCompanion.insert(
                id: abilityId,
                code: uAbility.code,
                name: uAbility.name,
                shortDescription: uAbility.shortDescription,
                description: uAbility.description
            ),
            mode: InsertMode.insertOrIgnore
        );
    }
}

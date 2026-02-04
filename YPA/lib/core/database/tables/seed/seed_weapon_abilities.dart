/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/weapon_abilities/all_weapon_abilities.dart';

import '../../app_database.dart';

Future<void> seedAllWeaponAbilities(AppDatabase db) async
{
    final wAbilities = allWeaponAbilities();

    for (final wAbility in wAbilities)
    {
        final abilityId = wAbility.id ?? const Uuid().v4();
        await db.into(db.weaponAbilities).insert(
            WeaponAbilitiesCompanion.insert(
                id: abilityId,
                code: wAbility.code,
                name: wAbility.name,
                shortDescription: wAbility.shortDescription,
                description: wAbility.description
            ),
            mode: InsertMode.insertOrIgnore
        );
    }
}

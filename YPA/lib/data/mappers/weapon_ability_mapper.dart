/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/core/database/app_database.dart';

import '../../domain/models/abilities/weapon_ability/weapon_ability.dart';

class WeaponAbilityMapper
{
    static WeaponAbilityDOM fromRow(WeaponAbilitiesRow row) 
    {
        return WeaponAbilityDOM(
            id: row.id,
            code: row.code,
            name: row.name,
            shortDescription: row.shortDescription,
            description: row.description
        );
    }
}

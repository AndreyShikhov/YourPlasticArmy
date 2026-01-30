/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/core/database/app_database.dart';

import '../../domain/models/abilities/unit_ability/unit_ability.dart';

class UnitAbilityMapper
{
    static UnitAbilityDOM fromRow(UnitAbilitiesRow row) 
    {
        return UnitAbilityDOM(
            id: row.id,
            code: row.code,
            name: row.name,
            shortDescription: row.shortDescription,
            description: row.description
        );
    }
}

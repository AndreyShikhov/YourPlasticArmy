/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/core/database/app_database.dart';

import '../../domain/models/abilities/faction_unit_ability/faction_unit_ability.dart';

class FactionUnitAbilityMapper
{
    static FactionUnitAbilityDOM fromRow(FactionUnitAbilityRow row) 
    {
        return FactionUnitAbilityDOM(
            id: row.id,
            code: row.code,
            name: row.name,
            shortDescription: row.shortDescription,
            description: row.description
        );
    }
}

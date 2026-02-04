/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/core/database/app_database.dart';

import '../../domain/models/abilities/core_unit_ability/core_unit_ability.dart';

class CoreUnitAbilityMapper
{
    static CoreUnitAbilityDOM fromRow(CoreUnitAbilityRow row) 
    {
        return CoreUnitAbilityDOM(
            id: row.id,
            code: row.code,
            name: row.name,
            shortDescription: row.shortDescription,
            description: row.description
        );
    }
}

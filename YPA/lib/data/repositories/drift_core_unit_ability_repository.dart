/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/data/mappers/core_unit_ability_mapper.dart';

import '../../domain/models/abilities/core_unit_ability/core_unit_ability.dart';

class DriftCoreUnitAbilityRepository implements CoreUnitAbilityRepository
{
    final AppDatabase db;

    DriftCoreUnitAbilityRepository(this.db);

    @override
    Future<List<CoreUnitAbilityDOM>> getAllCoreUnitAbilities() async
    {
        final rows = await db.select(db.coreUnitAbilities).get();
        return rows.map(CoreUnitAbilityMapper.fromRow).toList();
    }

    @override
    Future<CoreUnitAbilityDOM?> getCoreUnitAbilityByCode(String code) async
    {
        final row = await (db.select(db.coreUnitAbilities)..where((tbl) => tbl.code.equals(code))).getSingleOrNull();
        return row != null ? CoreUnitAbilityMapper.fromRow(row) : null;
    }
}

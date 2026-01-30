/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/data/mappers/unit_ability_mapper.dart';
import 'package:ypa/domain/models/unit_ability/unit_ability_dom.dart';
import 'package:ypa/domain/models/unit_ability/unit_ability_repository.dart';

class DriftUnitAbilityRepository implements UnitAbilityRepository
{
    final AppDatabase db;

    DriftUnitAbilityRepository(this.db);

    @override
    Future<List<UnitAbilityDOM>> getAllUnitAbility() async
    {
        final rows = await db.select(db.unitAbilities).get();
        return rows.map(UnitAbilityMapper.fromRow).toList();
    }

    @override
    Future<UnitAbilityDOM?> getUnitAbilityByCode(String code) async
    {
        final row = await (db.select(db.unitAbilities)..where((tbl) => tbl.code.equals(code))).getSingleOrNull();
        return row != null ? UnitAbilityMapper.fromRow(row) : null;
    }
}

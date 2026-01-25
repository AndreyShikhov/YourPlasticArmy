/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/data/mappers/faction_unit_ability_mapper.dart';
import 'package:ypa/domain/models/faction_unit_ability/faction_unit_ability_dom.dart';
import 'package:ypa/domain/models/faction_unit_ability/faction_unit_ability_repository.dart';

class DriftFactionUnitAbilityRepository implements FactionUnitAbilityRepository
{
    final AppDatabase db;

    DriftFactionUnitAbilityRepository(this.db);

    @override
    Future<List<FactionUnitAbilityDOM>> findAll() async
    {
        final rows = await db.select(db.factionUnitAbilities).get();
        return rows.map(FactionUnitAbilityMapper.fromRow).toList();
    }

    @override
    Future<FactionUnitAbilityDOM?> findByCode(String code) async
    {
        final row = await (db.select(
            db.factionUnitAbilities
        )..where((tbl) => tbl.code.equals(code))).getSingleOrNull();
        return row != null ? FactionUnitAbilityMapper.fromRow(row) : null;
    }
}

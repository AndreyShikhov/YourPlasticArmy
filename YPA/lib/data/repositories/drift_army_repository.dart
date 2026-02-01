/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/data/mappers/army_mapper.dart';
import 'package:ypa/domain/models/army/army.dart';
import 'package:ypa/domain/models/faction/faction_id.dart';

class DriftArmyRepository implements ArmyRepository
{
    final AppDatabase db;

    DriftArmyRepository(this.db);

    @override
    Future<void> deleteArmy(ArmyId id) async
    {
        await (db.delete(db.armies)..where((tbl) => tbl.id.equals(id.value))).go();
    }

    @override
    Future<List<ArmyDOM>> getAllArmies() async
    {
        final rows = await db.select(db.armies).get();
        return rows.map(ArmyMapper.fromRow).toList();
    }

    @override
    Future<List<ArmyDOM>> getArmyByFaction(FactionId factionId) async
    {
        final rows = await (db.select(db.armies)..where((tbl) => tbl.factionId.equals(factionId.value))).get();
        return rows.map(ArmyMapper.fromRow).toList();
    }

    @override
    Future<ArmyDOM?> getArmyById(ArmyId id) async
    {
        final row = await (db.select(db.armies)..where((tbl) => tbl.id.equals(id.value))).getSingleOrNull();
        return row != null ? ArmyMapper.fromRow(row) : null;
    }

    @override
    Future<void> saveArmy(ArmyDOM army) async
    {
        await db.into(db.armies).insertOnConflictUpdate(ArmyMapper.toCompanion(army));
    }
}

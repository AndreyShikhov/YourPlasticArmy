/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/data/mappers/faction_mapper.dart';
import 'package:ypa/domain/models/faction/faction.dart';

class DriftFactionRepository implements FactionRepository
{
    final AppDatabase db;

    DriftFactionRepository(this.db);

    @override
    Future<void> delete(FactionId id) async
    {
        await (db.delete(db.factions)..where((tbl) => tbl.id.equals(id.value))).go();
    }

    @override
    Future<List<FactionDOM>> findAll() async
    {
        final rows = await db.select(db.factions).get();
        return rows.map(FactionMapper.fromRow).toList();
    }

    @override
    Future<FactionDOM?> findById(FactionId id) async
    {
        final row = await (db.select(db.factions)..where((tbl) => tbl.id.equals(id.value))).getSingleOrNull();
        return row != null ? FactionMapper.fromRow(row) : null;
    }

    @override
    Future<void> save(FactionDOM faction) async
    {
        await db.into(db.factions).insertOnConflictUpdate(FactionMapper.toCompanion(faction));
    }
}

/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:drift/drift.dart';
import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/domain/models/army/army_id.dart';

import '../../domain/models/codex/codex.dart';
import '../../domain/models/unit/unit.dart';
import '../mappers/mappers.dart';

class DriftUnitRepository implements UnitRepositoryDom
{
    final AppDatabase db;

    DriftUnitRepository(this.db);

    @override
    Future<void> saveUnit(UnitDOM unit) async
    {
        final companion = UnitMapper.toCompanion(unit);
        await db.into(db.units).insertOnConflictUpdate(companion);
    }

    @override
    Future<void> deleteUnit(UnitIdDom id) async
    {
        await (db.delete(db.units)..where((tbl) => tbl.id.equals(id.value))).go();
    }

    @override
    Future<List<UnitDOM>> findAllUnits() async
    {
        final rows = await db.select(db.units).get();

        return rows.map(UnitMapper.fromRow).toList();
    }

    @override
    Future<List<UnitDOM>> findUnitsByCodex(CodexId codexId) async
    {
        //print('DEBUG: Requesting units for codexId.value: "${codexId.value}"');

        final query = db.select(db.units)..where((tbl) => tbl.codexId.equals(codexId.value));

        final rows = await query.get();
        //print('DEBUG: Found ${rows.length} rows in DB for codex. Starting mapping...');

        final List<UnitDOM> units = [];

        for (var row in rows)
        {
            try
            {
                units.add(UnitMapper.fromRow(row));
            } catch (e)
            {
                print('ERROR mapping unit "${row.name}" from codex: $e');
                // print('   - armyId: ${row.armyId}');
                // print('   - codexId: ${row.codexId}');
                // print('   - roleCode: ${row.roleCode}');
            }
        }

        //print('DEBUG: Successfully mapped ${units.length} / ${rows.length} units from codex');
        return units;
    }

    @override
    Future<List<UnitDOM>> findUnitsByArmy(ArmyId armyId) async
    {

        //print('DEBUG: Requesting units for armyId.value: "${armyId.value}"');

        final query = db.select(db.units)..where((tbl)
            {
                return tbl.armyId.equals(armyId.value) & tbl.codexId.isNull();
            }
        );

        final rows = await query.get();
        //print('DEBUG: Found ${rows.length} rows in DB. Starting mapping...');

        final List<UnitDOM> units = [];

        for (var row in rows)
        {
            try
            {
                // Пробуем сконвертировать каждую строку
                units.add(UnitMapper.fromRow(row));
            } catch (e)
            {
                // Если здесь произойдет ошибка, мы увидим на каком юните и почему
                print('ERROR mapping unit "${row.name}": $e');
                // print('   - armyId: ${row.armyId}');
                // print('   - codexId: ${row.codexId}');
                // print('   - roleCode: ${row.roleCode}');
                // print('   - stats: ${row.unitStats}');
            }
        }

        //print('DEBUG: Successfully mapped ${units.length} / ${rows.length} units');
        return units;
    }

    @override
    Future<UnitDOM?> findUnitByIdFromDb(UnitIdDom id) async
    {
        final row = await (db.select(db.units)..where((tbl) => tbl.id.equals(id.value))).getSingleOrNull();

        return row != null ? UnitMapper.fromRow(row) : null;
    }
}

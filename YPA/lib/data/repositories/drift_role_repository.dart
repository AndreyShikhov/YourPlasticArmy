/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/data/mappers/role_mapper.dart';
import 'package:ypa/domain/models/role/role.dart';

class DriftRoleRepository implements RoleRepository
{
    final AppDatabase db;

    DriftRoleRepository(this.db);

    @override
    Future<void> delete(RoleId id) async
    {
        await (db.delete(db.role)..where((tbl) => tbl.id.equals(id.value))).go();
    }

    @override
    Future<List<RoleDOM>> findAll() async
    {
        final rows = await db.select(db.role).get();
        return rows.map(RoleMapper.fromRow).toList();
    }

    @override
    Future<RoleDOM?> findById(RoleId id) async
    {
        final row = await (db.select(db.role)..where((tbl) => tbl.id.equals(id.value))).getSingleOrNull();
        return row != null ? RoleMapper.fromRow(row) : null;
    }

    @override
    Future<void> save(RoleDOM role) async
    {
        await db.into(db.role).insertOnConflictUpdate(RoleMapper.toCompanion(role));
    }
}

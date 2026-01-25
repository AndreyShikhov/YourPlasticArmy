/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../app_database.dart';
import 'seed_objects/_types.dart';

Future<Map<String, String>> seedRole(AppDatabase db) async
{
    final data = [
        UnitRoleCode.characters,
        UnitRoleCode.battleline,
        UnitRoleCode.dedicatedTransports,
        UnitRoleCode.fortifications,
        UnitRoleCode.other
    ];

    final result = <String, String>{};

    for (final role in data)
    {
        final existing = await (db.select(db.role)..where((tbl) => tbl.code.equals(role.code))).getSingleOrNull();

        String id;
        if (existing != null) 
        {
            id = existing.id;
        } else 
        {
            id = const Uuid().v4();
            await db.into(db.role).insert(
                RoleCompanion.insert(
                    id: id,
                    code: role.code, 
                    name: role.title 
                ),
                mode: InsertMode.insertOrIgnore
            );
        }

        result[role.code] = id;
    }

    return result;
}

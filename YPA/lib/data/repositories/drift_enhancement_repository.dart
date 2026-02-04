/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/data/mappers/enhancement_mapper.dart';
import 'package:ypa/domain/models/detachment/detachment_id.dart';
import 'package:ypa/domain/models/enhancement/enhancement.dart';

class DriftEnhancementRepository implements EnhancementRepository
{
    final AppDatabase db;

    DriftEnhancementRepository(this.db);

    @override
    Future<void> delete(EnhancementId id) async
    {
        await (db.delete(db.enhancements)..where((tbl) => tbl.id.equals(id.value))).go();
    }

    @override
    Future<List<EnhancementDOM>> findAll() async
    {
        final rows = await db.select(db.enhancements).get();
        return rows.map(EnhancementMapper.fromRow).toList();
    }

    @override
    Future<List<EnhancementDOM>> findByDetachment(DetachmentId detachmentId) async
    {
        final rows = await (db.select(
            db.enhancements
        )..where((tbl) => tbl.detachmentId.equals(detachmentId.value))).get();
        return rows.map(EnhancementMapper.fromRow).toList();
    }

    @override
    Future<EnhancementDOM?> findById(EnhancementId id) async
    {
        final row = await (db.select(db.enhancements)..where((tbl) => tbl.id.equals(id.value))).getSingleOrNull();
        return row != null ? EnhancementMapper.fromRow(row) : null;
    }

    @override
    Future<void> save(EnhancementDOM enhancement) async
    {
        await db.into(db.enhancements).insertOnConflictUpdate(EnhancementMapper.toCompanion(enhancement));
    }
}

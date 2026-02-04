/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:drift/drift.dart';

import '../../core/database/app_database.dart';
import '../../domain/models/codex/codex.dart';
import '../../domain/models/detachment/detachment.dart';
import '../mappers/mappers.dart';

class DriftDetachmentRepository implements DetachmentRepository
{
    final AppDatabase db;

    DriftDetachmentRepository(this.db);

    @override
    Future<void> saveDetachment(DetachmentDOM detachment) async
    {
        final companion = DetachmentMapper.toCompanion(detachment);

        await db.into(db.detachments).insertOnConflictUpdate(companion);
    }

    @override
    Future<List<DetachmentDOM>> getDetachmentByCodexId(CodexId codexId) async
    {
        final query = db.select(db.detachments).join([
                innerJoin(db.codexDetachments, db.codexDetachments.detachmentId.equalsExp(db.detachments.id))
            ])..where(db.codexDetachments.codexId.equals(codexId.value));

        final rows = await query.get();

        return rows.map((row)
            {
                final detachmentRow = row.readTable(db.detachments);
                return DetachmentMapper.fromRow(detachmentRow);
            }).toList();
    }

    @override
    Future<DetachmentDOM?> getDetachmentById(DetachmentId id) async
    {
        final query = db.select(db.detachments)..where((tbl) => tbl.id.equals(id.value));

        final row = await query.getSingleOrNull();
        if (row == null) return null;

        return DetachmentMapper.fromRow(row);
    }

    @override
    Future<List<DetachmentDOM>> getAllDetachment() async
    {
        final rows = await db.select(db.detachments).get();

        return rows.map(DetachmentMapper.fromRow).toList();
    }

    @override
    Future<void> deleteDetachment(DetachmentId id) async
    {
        await (db.delete(db.detachments)..where((tbl) => tbl.id.equals(id.value))).go();
    }
}

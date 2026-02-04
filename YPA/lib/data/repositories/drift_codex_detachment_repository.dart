/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:drift/drift.dart';
import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/data/mappers/codex_detachment_mapper.dart';
import 'package:ypa/domain/models/codex/codex.dart';
import 'package:ypa/domain/models/detachment/detachment.dart';
import 'package:ypa/domain/models/relation/relation.dart';

class DriftCodexDetachmentRepository implements CodexDetachmentRepository
{
    final AppDatabase db;

    DriftCodexDetachmentRepository(this.db);

    @override
    Future<void> add(CodexId codexId, DetachmentId detachmentId) async
    {
        final dom = CodexDetachmentDOM(codexId: codexId, detachmentId: detachmentId);
        await db.into(db.codexDetachments).insertOnConflictUpdate(CodexDetachmentMapper.toCompanion(dom));
    }

    @override
    Future<List<DetachmentId>> findDetachmentIdsByCodex(CodexId codexId) async
    {
        final rows = await (db.select(db.codexDetachments)..where((tbl) => tbl.codexId.equals(codexId.value))).get();

        return rows.map((row) => DetachmentId.fromString(row.detachmentId)).toList();
    }

    @override
    Future<void> remove(CodexId codexId, DetachmentId detachmentId) async
    {
        await (db.delete(
            db.codexDetachments
        )..where((tbl) => tbl.codexId.equals(codexId.value) & tbl.detachmentId.equals(detachmentId.value))).go();
    }
}

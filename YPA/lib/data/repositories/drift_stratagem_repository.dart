/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/data/mappers/stratagem_mapper.dart';
import 'package:ypa/domain/models/codex/codex_id.dart';
import 'package:ypa/domain/models/detachment/detachment_id.dart';
import 'package:ypa/domain/models/stratagem/strategem.dart';

class DriftStratagemRepository implements StratagemRepository
{
    final AppDatabase db;

    DriftStratagemRepository(this.db);

    @override
    Future<void> deleteStratagem(StratagemId id) async
    {
        // Использован правильный геттер stratagems
        await (db.delete(db.stratagems)..where((tbl) => tbl.id.equals(id.value))).go();
    }

    @override
    Future<List<StratagemDOM>> findAllStratagem() async
    {
        final rows = await db.select(db.stratagems).get();
        return rows.map(StratagemMapper.fromRow).toList();
    }

    @override
    Future<List<StratagemDOM>> findStratagemsByCodex(CodexId codexId) async
    {
        final rows = await (db.select(db.stratagems)..where((tbl) => tbl.codexId.equals(codexId.value))).get();
        return rows.map(StratagemMapper.fromRow).toList();
    }

    @override
    Future<List<StratagemDOM>> findStratagemsByDetachment(DetachmentId detachmentId) async
    {
        final rows = await (db.select(
            db.stratagems
        )..where((tbl) => tbl.detachmentId.equals(detachmentId.value))).get();
        return rows.map(StratagemMapper.fromRow).toList();
    }

    @override
    Future<StratagemDOM?> findStratagemsById(StratagemId id) async
    {
        final row = await (db.select(db.stratagems)..where((tbl) => tbl.id.equals(id.value))).getSingleOrNull();
        return row != null ? StratagemMapper.fromRow(row) : null;
    }

    @override
    Future<void> saveStratagem(StratagemDOM stratagem) async
    {
        // Использован метод insertOnConflictUpdate для сохранения и обновления
        await db.into(db.stratagems).insertOnConflictUpdate(StratagemMapper.toCompanion(stratagem));
    }
}

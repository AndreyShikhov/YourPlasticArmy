import 'package:drift/drift.dart';
import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/data/mappers/stratagem_mapper.dart';
import 'package:ypa/domain/models/codex/codex_id.dart';
import 'package:ypa/domain/models/detachment/detachment_id.dart';
import 'package:ypa/domain/models/stratagem/strategem.dart';

class DriftStratagemRepository implements StratagemRepository {
  final AppDatabase db;

  DriftStratagemRepository(this.db);

  @override
  Future<void> delete(StratagemId id) async {
    await (db.delete(db.strategems)..where((tbl) => tbl.id.equals(id.value))).go();
  }

  @override
  Future<List<StratagemDOM>> findAll() async {
    final rows = await db.select(db.strategems).get();
    return rows.map(StratagemMapper.fromRow).toList();
  }

  @override
  Future<List<StratagemDOM>> findByCodex(CodexId codexId) async {
    final rows = await (db.select(db.strategems)..where((tbl) => tbl.codexId.equals(codexId.value))).get();
    return rows.map(StratagemMapper.fromRow).toList();
  }

  @override
  Future<List<StratagemDOM>> findByDetachment(DetachmentId detachmentId) async {
    final rows = await (db.select(db.strategems)..where((tbl) => tbl.detachmentId.equals(detachmentId.value))).get();
    return rows.map(StratagemMapper.fromRow).toList();
  }

  @override
  Future<StratagemDOM?> findById(StratagemId id) async {
    final row = await (db.select(db.strategems)..where((tbl) => tbl.id.equals(id.value))).getSingleOrNull();
    return row != null ? StratagemMapper.fromRow(row) : null;
  }

  @override
  Future<void> save(StratagemDOM stratagem) async {
    await db.into(db.strategems).insertOnConflictUpdate(StratagemMapper.toCompanion(stratagem));
  }
}

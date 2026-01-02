import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/data/mappers/codex_mapper.dart';
import 'package:ypa/domain/models/army/army_id.dart';
import 'package:ypa/domain/models/codex/codex.dart';

class DriftCodexRepository implements CodexRepository {
  final AppDatabase db;

  DriftCodexRepository(this.db);

  @override
  Future<void> delete(CodexId id) async {
    await (db.delete(db.codexes)..where((tbl) => tbl.id.equals(id.value))).go();
  }

  @override
  Future<List<CodexDOM>> findAll() async {
    final rows = await db.select(db.codexes).get();
    return rows.map(CodexMapper.fromRow).toList();
  }

  @override
  Future<List<CodexDOM>> findByArmy(ArmyId armyId) async {
    final rows = await (db.select(db.codexes)..where((tbl) => tbl.armyId.equals(armyId.value))).get();
    return rows.map(CodexMapper.fromRow).toList();
  }

  @override
  Future<CodexDOM?> findById(CodexId id) async {
    final row = await (db.select(db.codexes)..where((tbl) => tbl.id.equals(id.value))).getSingleOrNull();
    return row != null ? CodexMapper.fromRow(row) : null;
  }

  @override
  Future<void> save(CodexDOM codex) async {
    await db.into(db.codexes).insertOnConflictUpdate(CodexMapper.toCompanion(codex));
  }
}

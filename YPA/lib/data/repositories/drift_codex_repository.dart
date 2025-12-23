import 'package:drift/drift.dart';

import '../../domain/models//codex/codex_dom.dart';
import '../../domain/models//codex/codex_repository.dart';
import '../../core/database/app_database.dart';
import '../../domain/models/army/army_id.dart';
import '../mappers/codex_mapper.dart';

class DriftCodexRepository implements CodexRepository {
  final AppDatabase db;

  DriftCodexRepository(this.db);

  @override
  Future<List<CodexDOM>> findByArmy(ArmyId armyId) async {
    final rows = await (db.select(db.codexes)
      ..where((t) => t.armyId.equals(armyId.value)))
        .get();

    return rows.map(CodexMapper.fromRow).toList();
  }

  @override
  Future<void> save(CodexDOM codex) async {
    await db.into(db.codexes).insert(
      CodexMapper.toCompanion(codex),
      mode: InsertMode.insertOrReplace,
    );
  }

  @override
  Future<List<CodexDOM>> findAll() async {
    final rows = await db.select(db.codexes).get();
    return rows.map(CodexMapper.fromRow).toList();
  }

  @override
  Future<List<CodexDOM>> getByArmy(ArmyId armyId) async {
    final query = db.select(db.codexes)
      ..where((t) => t.armyId.equals(armyId.value));

    final rows = await query.get();
    return rows.map(CodexMapper.fromRow).toList();
  }
}

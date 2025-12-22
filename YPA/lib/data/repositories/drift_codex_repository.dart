import '../../domain/models//codex/codex_dom.dart';
import '../../domain/models//codex/codex_repository.dart';
import '../../core/database/app_database.dart';
import '../mappers/codex_mapper.dart';

class DriftCodexRepository implements CodexRepository {
  final AppDatabase db;

  DriftCodexRepository(this.db);

  @override
  Future<void> save(CodexDOM codex) async {
    await db.into(db.codexes).insert(
      CodexMapper.toCompanion(codex),
    );
  }

  @override
  Future<List<CodexDOM>> findAll() async {
    final rows = await db.select(db.codexes).get();
    return rows.map(CodexMapper.fromRow).toList();
  }
}

import 'stratagem_dom.dart';
import 'stratagem_id.dart';
import '../codex/codex_id.dart';
import '../detachment/detachment_id.dart';

abstract class StratagemRepository {
  Future<void> save(StratagemDOM stratagem);
  Future<StratagemDOM?> findById(StratagemId id);
  Future<List<StratagemDOM>> findAll();
  Future<List<StratagemDOM>> findByCodex(CodexId codexId);
  Future<List<StratagemDOM>> findByDetachment(DetachmentId detachmentId);
  Future<void> delete(StratagemId id);
}

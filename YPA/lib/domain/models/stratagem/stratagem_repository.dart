import 'stratagem_dom.dart';
import 'stratagem_id.dart';
import '../codex/codex_id.dart';
import '../detachment/detachment_id.dart';

abstract class StratagemRepository {
  Future<void> saveStratagem(StratagemDOM stratagem);
  Future<StratagemDOM?> findStratagemsById(StratagemId id);
  Future<List<StratagemDOM>> findAllStratagem();
  Future<List<StratagemDOM>> findStratagemsByCodex(CodexId codexId);
  Future<List<StratagemDOM>> findStratagemsByDetachment(DetachmentId detachmentId);
  Future<void> deleteStratagem(StratagemId id);
}

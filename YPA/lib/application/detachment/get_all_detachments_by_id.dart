import '../../domain/models/codex/codex.dart';
import '../../domain/models/detachment/detachment.dart';

class GetAllDetachmentsByCodexId  {
  final DetachmentRepository repository;

  GetAllDetachmentsByCodexId(this.repository);

  Future<List<DetachmentDOM>> call(CodexId codexId) {

    return repository.findByCodex(codexId);
  }
}

import '../codex/codex_id.dart';
import '../detachment/detachment_id.dart';

abstract class CodexDetachmentRepository {
  /// Связать кодекс и детачмент
  Future<void> add(CodexId codexId, DetachmentId detachmentId);
  
  /// Удалить связь
  Future<void> remove(CodexId codexId, DetachmentId detachmentId);
  
  /// Получить ID детачментов для кодекса
  Future<List<DetachmentId>> findDetachmentIdsByCodex(CodexId codexId);
}

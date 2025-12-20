import '../detachment_dom.dart';
import '../detachment_id.dart';

abstract class DetachmentRepository {
  /// Создать или сохранить Detachment
  Future<void> save(DetachmentDOM detachment);

  /// Найти Detachment по ID
  Future<DetachmentDOM?> findById(DetachmentId id);

  /// Получить все Detachment
  Future<List<DetachmentDOM>> findAll();

  /// Удалить Detachment
  Future<void> delete(DetachmentId id);
}

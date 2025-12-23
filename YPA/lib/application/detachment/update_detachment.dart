import 'package:ypa/domain/models/army/army_id.dart';

import '../../domain/models/detachment/detachment_dom.dart';
import '../../domain/models/detachment/detachment_id.dart';
import '../../domain/models/detachment/detachment_name.dart';
import '../../domain/models/detachment/detachment_repository.dart';

class UpdateDetachment {
  final DetachmentRepository repository;

  UpdateDetachment(this.repository);

  Future<DetachmentDOM> call({
    required String id,
    required String name,
    required ArmyId armyId,
  }) async {
    final detachmentId = DetachmentId.fromString(id);

    final existing =
    await repository.findById(detachmentId);

    if (existing == null) {
      throw StateError('Detachment not found');
    }

    final updated = DetachmentDOM.restore(
      id: existing.id,
      armyId: armyId,
      name: DetachmentName(name),
    );

    await repository.save(updated);

    return updated;
  }
}

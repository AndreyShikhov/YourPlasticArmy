import 'package:ypa/domain/models/army/army_id.dart';

import 'detachment_id.dart';
import 'detachment_name.dart';

class DetachmentDOM {
  final DetachmentId  id;
  final ArmyId armyId;
  final DetachmentName name;

  DetachmentDOM._({
    required this.id,
    required this.armyId,
    required this.name,
  });

  /// Factory — единственный правильный способ создания
  factory DetachmentDOM.create({
    required DetachmentName name,
    required ArmyId armyId
  }) {
    return DetachmentDOM._(
      id:   DetachmentId.generate(),
      armyId: armyId,
      name: name,
    );
  }

  factory DetachmentDOM.restore({
    required DetachmentId id,
    required  ArmyId armyId,
    required DetachmentName name,
  }) {
    return DetachmentDOM._(
      id: id,
      armyId: armyId,
      name: name,
    );
  }
}
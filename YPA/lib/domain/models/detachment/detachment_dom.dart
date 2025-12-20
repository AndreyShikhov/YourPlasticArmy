import '../../shared/entity.dart';
import 'detachment_id.dart';
import 'detachment_name.dart';

class DetachmentDOM {
  final DetachmentId  id;
  final DetachmentName name;

  DetachmentDOM._({
    required this.id,
    required this.name,
  });

  /// Factory — единственный правильный способ создания
  factory DetachmentDOM.create({
    required DetachmentName name,
  }) {
    return DetachmentDOM._(
      id:   DetachmentId.generate(),
      name: name,
    );
  }

  factory DetachmentDOM.restore({
    required DetachmentId id,
    required DetachmentName name,
  }) {
    return DetachmentDOM._(
      id: id,
      name: name,
    );
  }
}
import 'enhancement_id.dart';
import 'enhancement_name.dart';
import 'enhancement_code.dart';
import 'enhancement_description.dart';
import '../detachment/detachment_id.dart';

class EnhancementDOM {
  final EnhancementId id;
  final EnhancementCode code;
  final EnhancementName name;
  final EnhancementDescription description;
  final DetachmentId detachmentId;
  final int points;

  const EnhancementDOM._({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.detachmentId,
    required this.points,
  });

  factory EnhancementDOM.create({
    required EnhancementCode code,
    required EnhancementName name,
    required EnhancementDescription description,
    required DetachmentId detachmentId,
    int points = 0,
  }) {
    if (points < 0) {
      throw ArgumentError('points cannot be negative');
    }

    return EnhancementDOM._(
      id: EnhancementId.generate(),
      code: code,
      name: name,
      description: description,
      detachmentId: detachmentId,
      points: points,
    );
  }

  factory EnhancementDOM.restore({
    required EnhancementId id,
    required EnhancementCode code,
    required EnhancementName name,
    required EnhancementDescription description,
    required DetachmentId detachmentId,
    required int points,
  }) {
    return EnhancementDOM._(
      id: id,
      code: code,
      name: name,
      description: description,
      detachmentId: detachmentId,
      points: points,
    );
  }
}
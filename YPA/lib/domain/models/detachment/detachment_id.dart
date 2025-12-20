import 'package:uuid/uuid.dart';

import '../../shared/value_object.dart';

class DetachmentId extends ValueObject<String> {
  const DetachmentId._(super.value);

  /// Создание из уже существующего значения
  factory DetachmentId.fromString(String id) {
    if (id.isEmpty) {
      throw ArgumentError('DetachmentId cannot be empty');
    }
    return DetachmentId._(id);
  }

  /// Генерация нового ID
  factory DetachmentId.generate() {
    final id = const Uuid().v4();
    return DetachmentId._(id);
  }
}

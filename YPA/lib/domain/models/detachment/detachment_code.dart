import '../../shared/value_object.dart';

class DetachmentCode extends ValueObject<String> {
  static const int maxLength = 100;

  const DetachmentCode._(super.value);

  factory DetachmentCode(String code) {
    final trimmed = code.trim().toLowerCase();

    if (trimmed.isEmpty) {
      throw ArgumentError('DetachmentCode cannot be empty');
    }

    if (trimmed.length > maxLength) {
      throw ArgumentError(
        'DetachmentCode cannot be longer than $maxLength characters',
      );
    }

    // Проверяем, что код содержит только буквы, цифры и подчёркивания
    if (!RegExp(r'^[a-z0-9_]+$').hasMatch(trimmed)) {
      throw ArgumentError(
        'DetachmentCode can only contain lowercase letters, numbers and underscores',
      );
    }

    return DetachmentCode._(trimmed);
  }
}
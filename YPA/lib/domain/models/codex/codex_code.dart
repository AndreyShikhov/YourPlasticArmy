import '../../shared/value_object.dart';

class CodexCode extends ValueObject<String> {
  static const int maxLength = 50;

  const CodexCode._(super.value);

  factory CodexCode(String code) {
    final trimmed = code.trim().toLowerCase();

    if (trimmed.isEmpty) {
      throw ArgumentError('CodexCode cannot be empty');
    }

    if (trimmed.length > maxLength) {
      throw ArgumentError(
        'CodexCode cannot be longer than $maxLength characters',
      );
    }

    // Проверяем, что код содержит только буквы, цифры и подчёркивания
    if (!RegExp(r'^[a-z0-9_]+$').hasMatch(trimmed)) {
      throw ArgumentError(
        'CodexCode can only contain lowercase letters, numbers and underscores',
      );
    }

    return CodexCode._(trimmed);
  }
}
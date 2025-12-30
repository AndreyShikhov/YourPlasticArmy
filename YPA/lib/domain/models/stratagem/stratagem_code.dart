import '../../shared/value_object.dart';

class StratagemCode extends ValueObject<String> {
  static const int maxLength = 100;

  const StratagemCode._(super.value);

  factory StratagemCode(String code) {
    final trimmed = code.trim().toLowerCase();

    if (trimmed.isEmpty) {
      throw ArgumentError('StratagemCode cannot be empty');
    }

    if (trimmed.length > maxLength) {
      throw ArgumentError(
        'StratagemCode cannot be longer than $maxLength characters',
      );
    }

    // Проверяем, что код содержит только буквы, цифры и подчёркивания
    if (!RegExp(r'^[a-z0-9_]+$').hasMatch(trimmed)) {
      throw ArgumentError(
        'StratagemCode can only contain lowercase letters, numbers and underscores',
      );
    }

    return StratagemCode._(trimmed);
  }
}
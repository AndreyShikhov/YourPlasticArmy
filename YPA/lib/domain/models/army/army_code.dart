import '../../shared/value_object.dart';

class ArmyCode extends ValueObject<String> {
  static const int maxLength = 50;

  const ArmyCode._(super.value);

  factory ArmyCode(String code) {
    final trimmed = code.trim().toLowerCase();

    if (trimmed.isEmpty) {
      throw ArgumentError('ArmyCode cannot be empty');
    }

    if (trimmed.length > maxLength) {
      throw ArgumentError('ArmyCode cannot be longer than $maxLength characters');
    }

    // Проверяем, что код содержит только буквы, цифры и подчёркивания
    if (!RegExp(r'^[a-z0-9_]+$').hasMatch(trimmed)) {
      throw ArgumentError('ArmyCode can only contain lowercase letters, numbers and underscores');
    }

    return ArmyCode._(trimmed);
  }
}

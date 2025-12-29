import 'package:uuid/uuid.dart';

class UnitId {
  final String value;

  const UnitId._(this.value);

  /// Создать UnitId из строки
  factory UnitId.fromString(String value) {
    if (value.isEmpty) {
      throw Exception('UnitId не может быть пустым');
    }
    // Можно добавить проверку на корректный UUID, если нужно
    return UnitId._(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UnitId && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;

  int toInt()
  {
   return  int.parse(value);
  }
}

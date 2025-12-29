import 'package:uuid/uuid.dart';

class UnitId {
  final String value;

  const UnitId._(this.value);

  factory UnitId.generate() {
    // Генерация уникального ID, например через UUID
    return UnitId._(const Uuid().v4());
  }

  factory UnitId.fromString(String value) {
    return UnitId._(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is UnitId && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
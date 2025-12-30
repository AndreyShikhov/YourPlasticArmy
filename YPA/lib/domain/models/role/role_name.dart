import '../../shared/value_object.dart';

class RoleName extends ValueObject<String> {
  static const int maxLength = 100;

  const RoleName._(super.value);

  factory RoleName(String name) {
    final trimmed = name.trim();

    if (trimmed.isEmpty) {
      throw ArgumentError('RoleName cannot be empty');
    }

    if (trimmed.length > maxLength) {
      throw ArgumentError(
        'RoleName cannot be longer than $maxLength characters',
      );
    }

    return RoleName._(trimmed);
  }
}
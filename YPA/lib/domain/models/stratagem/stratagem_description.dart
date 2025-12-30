import '../../shared/value_object.dart';

class StratagemDescription extends ValueObject<String> {
  static const int maxLength = 2000;

  const StratagemDescription._(super.value);

  factory StratagemDescription(String description) {
    final trimmed = description.trim();

    if (trimmed.isEmpty) {
      throw ArgumentError('StratagemDescription cannot be empty');
    }

    if (trimmed.length > maxLength) {
      throw ArgumentError(
        'StratagemDescription cannot be longer than $maxLength characters',
      );
    }

    return StratagemDescription._(trimmed);
  }
}
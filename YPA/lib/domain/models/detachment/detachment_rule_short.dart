import '../../shared/value_object.dart';

class DetachmentRuleShort extends ValueObject<String> {
  static const int maxLength = 500;

  const DetachmentRuleShort._(super.value);

  factory DetachmentRuleShort(String ruleShort) {
    final trimmed = ruleShort.trim();

    if (trimmed.isEmpty) {
      throw ArgumentError('DetachmentRuleShort cannot be empty');
    }

    if (trimmed.length > maxLength) {
      throw ArgumentError(
        'DetachmentRuleShort cannot be longer than $maxLength characters',
      );
    }

    return DetachmentRuleShort._(trimmed);
  }
}
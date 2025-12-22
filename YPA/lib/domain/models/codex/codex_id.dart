


import 'package:uuid/uuid.dart';

class CodexId {
  final String value;

  CodexId._(this.value);

  /// Генерация нового ID
  factory CodexId.generate() {
    final id = const Uuid().v4();
    return CodexId._(id);
  }

  factory CodexId.fromString(String value) {
    if (value.isEmpty) {
      throw ArgumentError('CodexId cannot be empty');
    }
    return CodexId._(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CodexId && other.value == value;

  @override
  int get hashCode => value.hashCode;

}

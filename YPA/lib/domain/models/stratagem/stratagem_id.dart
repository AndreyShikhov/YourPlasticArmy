class StratagemId {
  final String value;

  const StratagemId._(this.value);

  factory StratagemId.fromString(String value) {
    if (value.isEmpty) {
      throw ArgumentError('StratagemId cannot be empty');
    }
    return StratagemId._(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StratagemId && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class StratagemId {
  final int value;

  const StratagemId._(this.value);

  factory StratagemId.fromInt(int value) {
    if (value <= 0) {
      throw ArgumentError('StratagemId must be positive');
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
  String toString() => value.toString();
}
class FactionId {
  final int value;

  const FactionId._(this.value);

  factory FactionId.fromInt(int value) {
    if (value <= 0) {
      throw ArgumentError('FactionId must be positive');
    }
    return FactionId._(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FactionId && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value.toString();
}
class RoleId {
  final int value;

  const RoleId._(this.value);

  factory RoleId.fromInt(int value) {
    if (value <= 0) {
      throw ArgumentError('RoleId must be positive');
    }
    return RoleId._(value);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoleId && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value.toString();
}
class ArmyId {
  final int value;

  ArmyId._(this.value);

  factory ArmyId.fromInt(int value) {
    if (value <= 0) {
      throw ArgumentError('ArmyId must be positive');
    }
    return ArmyId._(value);
  }
}

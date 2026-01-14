class StratagemEffect {
  final String value;

  const StratagemEffect(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StratagemEffect && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

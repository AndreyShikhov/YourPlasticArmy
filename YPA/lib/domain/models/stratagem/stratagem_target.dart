class StratagemTarget {
  final String value;

  const StratagemTarget(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StratagemTarget && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class StratagemWhen {
  final String value;

  const StratagemWhen(this.value);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StratagemWhen && runtimeType == other.runtimeType && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

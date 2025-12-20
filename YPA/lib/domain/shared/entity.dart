abstract class Entity<ID> {
  final ID id;

  const Entity(this.id);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Entity<ID> &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;
}

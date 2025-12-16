


class UnitSeed {
  final String name;
  final String faction;
  final String? codex;
  final String role;

  const UnitSeed({
    required this.name,
    required this.faction,
    this.codex,
    required this.role,
  });
}

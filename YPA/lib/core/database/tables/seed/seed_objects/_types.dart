
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

class DetachmentSeed {

  final String code;
  final String name;
  final String description;
  final String ruleName;
  final String ruleShort;
  final String ruleFull;

  const DetachmentSeed({
    required this.code,
    required this.name,
    required this.description,
    required this.ruleName,
    required this.ruleShort,
    required this.ruleFull,
  });
}

class DetachmentCodexLinkSeed {
  final String detachmentCode;
  final String codex;

  const DetachmentCodexLinkSeed({
    required this.detachmentCode,
    required this.codex,
  });
}

class EnhancementSeed {
  final String code;
  final String name;
  final String description;
  final String detachmentCode;
  final int points;

  const EnhancementSeed({
    required this.code,
    required this.name,
    required this.description,
    required this.detachmentCode,
    this.points = 0,
  });
}


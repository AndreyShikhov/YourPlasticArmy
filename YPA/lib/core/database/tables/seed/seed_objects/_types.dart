import '../../stratagems_table.dart';


enum GamePhase {
  command,
  movement,
  shooting,
  charge,
  fight,
}


enum UnitRole {
  characters,
  battleline,
  dedicatedTransports,
  fortifications,
  other,
}

enum StrategemType {
  core,
  army,
  detachment,
}

enum WeaponType {
  melee,
  ranged,
}

enum DamageType {
  normal,
  mortal,
}

enum AbilityTrigger {
  passive,
  commandPhase,
  movementPhase,
  shootingPhase,
  chargePhase,
  fightPhase,
  reaction,
}

enum DetachmentRuleType {
  armyRule,
  detachmentRule,
}

enum SaveType {
  armor,
  invulnerable,
  feelNoPain,
}

enum RangeType {
  self,
  aura,
  ranged,
}


class FactionSeed {
  final String code;
  final String name;

  const FactionSeed({
    required this.code,
    required this.name,
  });
}


class UnitSeed {
  final String name;
  final String army;
  final String? codex;
  final String role;

  const UnitSeed({
    required this.name,
    required this.army,
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



class StrategemsSeed {
  final String  code;
  final String  name;
  final String  description;
  final int       cpCost;
  final String  phase;
  final String  target;
  final String  effect;
  final String? condition;
  final bool   oncePerBattle;
  final String? codexId;
  final String? detachmentId;

  const StrategemsSeed({
    required this.code,
    required this.name,
    required this.description,
    this.cpCost = 1,
    required this.phase,
    required this.target,
    required this.effect,
    this.condition,
    this.oncePerBattle = false,
    this.codexId,
    this.detachmentId,
  });
}


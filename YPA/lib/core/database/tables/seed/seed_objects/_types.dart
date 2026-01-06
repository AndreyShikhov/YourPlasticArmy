
enum GamePhase {
  command,
  movement,
  shooting,
  charge,
  fight,
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


enum FactionCode {
  imperium,
  chaos,
  xenos,
}
extension FactionCodeX on FactionCode {
  String get code => name; // imperium
  String get title {
    switch (this) {
      case FactionCode.imperium:
        return 'Imperium';
      case FactionCode.chaos:
        return 'Chaos';
      case FactionCode.xenos:
        return 'Xenos';
    }
  }
}


enum ArmyCode {
  spaceMarines,
  orks,
}
extension ArmyCodeX on ArmyCode {
  String get code {
    switch (this) {
      case ArmyCode.spaceMarines:
        return 'space_marines';
      case ArmyCode.orks:
        return 'orks';
    }
  }

  String get title {
    switch (this) {
      case ArmyCode.spaceMarines:
        return 'Space Marines';
      case ArmyCode.orks:
        return 'Orks';
    }
  }

  FactionCode get faction {
    switch (this) {
      case ArmyCode.spaceMarines:
        return FactionCode.imperium;
      case ArmyCode.orks:
        return FactionCode.xenos;
    }
  }
}

enum CodexCode {
  ultramarines,
  bloodAngels,
}
extension CodexCodeX on CodexCode {
  String get code {
    switch (this) {
      case CodexCode.ultramarines:
        return 'ultramarines';
      case CodexCode.bloodAngels:
        return 'blood_angels';
    }
  }

  String get title {
    switch (this) {
      case CodexCode.ultramarines:
        return 'Ultramarines';
      case CodexCode.bloodAngels:
        return 'Blood Angels';
    }
  }

  ArmyCode get army {
    switch (this) {
      case CodexCode.ultramarines:
      case CodexCode.bloodAngels:
        return ArmyCode.spaceMarines;
    }
  }
}

enum UnitRoleCode {
  characters,
  battleline,
  dedicatedTransports,
  fortifications,
  other,
}
extension UnitRoleCodeX on UnitRoleCode {
  String get code => name;


  String get SnakeName
  {
    switch(this){
      case UnitRoleCode.characters:
        return 'characters';
      case UnitRoleCode.battleline:
        return 'battleline';
      case UnitRoleCode.dedicatedTransports:
        return 'dedicated_transports';
      case UnitRoleCode.fortifications:
        return 'fortifications';
      case UnitRoleCode.other:
        return 'other';
    }
  }

  String get title {
    switch (this) {
      case UnitRoleCode.characters:
        return 'Characters';
      case UnitRoleCode.battleline:
        return 'Battleline';
      case UnitRoleCode.dedicatedTransports:
        return 'Dedicated Transports';
      case UnitRoleCode.fortifications:
        return 'Fortifications';
      case UnitRoleCode.other:
        return 'Other';
    }
  }
}





class CodexSeed {
  final CodexCode code;
  final ArmyCode army;

  const CodexSeed({
    required this.code,
    required this.army,
  });

  String get name => code.title;
}

class ArmySeed {
  final ArmyCode armyCode;
  final String armyName;
  final FactionCode factionCode;

  const ArmySeed({
    required this.armyCode,
    required this.armyName,
    required this.factionCode,
  });
}

class UnitSeed {
  // ID теперь необязателен. Если null, будет сгенерирован при вставке.
  final String? id;
  final String name;
  final ArmyCode army;
  final CodexCode? codex;
  final UnitRoleCode role;

  const UnitSeed({
    this.id,
    required this.name,
    required this.army,
    required this.role,
    this.codex,
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
  final CodexCode codex;


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

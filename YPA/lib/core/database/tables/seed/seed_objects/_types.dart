
import 'package:ypa/domain/models/unit/unit_stats.dart';


// ==========================================
// ENUM
// ==========================================
enum GamePhase {
  command,
  movement,
  shooting,
  charge,
  fight,
}

enum WeaponType {
  melee,
  ranged,
}

enum DamageType {
  normal,
  mortal,
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
  // Imperium
  adeptaSororitas,
  adeptusCustodes,
  adeptusMechanicus,
  adeptusTitanicus,
  astraMilitarum,
  greyKnights,
  imperialAgents,
  imperialKnights,
  spaceMarines,
  // Chaos
  chaosDaemons,
  chaosKnights,
  chaosSpaceMarines,
  deathGuard,
  emperorsChildren,
  thousandSons,
  worldEaters,
  // Xenos
  aeldari,
  drukhari,
  genestealerCults,
  leaguesOfVotann,
  necrons,
  orks,
  tauEmpire,
  tyranids,

}
extension ArmyCodeX on ArmyCode {
  String get code {
    switch (this) {
     case ArmyCode.adeptaSororitas:
        return 'adepta_sororitas';
      case ArmyCode.adeptusCustodes:
        return 'adeptus_custodes';
      case ArmyCode.adeptusMechanicus:
        return 'adeptus_mechanicus';
      case ArmyCode.adeptusTitanicus:
        return 'adeptus_titanicus';
      case ArmyCode.astraMilitarum:
        return 'astra_militarum';
      case ArmyCode.greyKnights:
        return 'grey_knights';
      case ArmyCode.imperialAgents:
        return 'imperial_agents';
      case ArmyCode.imperialKnights:
        return 'imperial_knights';
      case ArmyCode.spaceMarines:
        return 'space_marines';
      case ArmyCode.chaosDaemons:
        return 'chaos_daemons';
      case ArmyCode.chaosKnights:
        return 'chaos_knights';
      case ArmyCode.chaosSpaceMarines:
        return 'chaos_space_marines';
      case ArmyCode.deathGuard:
        return 'death_guard';
      case ArmyCode.emperorsChildren:
        return 'emperors_children';
      case ArmyCode.thousandSons:
        return 'thousand_sons';
      case ArmyCode.worldEaters:
        return 'world_eaters';
      case ArmyCode.aeldari:
        return 'aeldari';
      case ArmyCode.drukhari:
        return 'drukhari';
      case ArmyCode.genestealerCults:
        return 'genestealer_cults';
      case ArmyCode.leaguesOfVotann:
        return 'leagues_of_votann';
      case ArmyCode.necrons:
        return 'necrons';
      case ArmyCode.orks:
        return 'orks';
      case ArmyCode.tauEmpire:
        return 'tau_empire';
      case ArmyCode.tyranids:
        return 'tyranids';
    }
  }

  String get title {
    switch (this) {
      case ArmyCode.adeptaSororitas:
        return 'Adepta Sororitas';
      case ArmyCode.adeptusCustodes:
        return 'Adeptus Custodes';
      case ArmyCode.adeptusMechanicus:
        return 'Adeptus Mechanicus';
      case ArmyCode.adeptusTitanicus:
        return 'Adeptus Titanicus';
      case ArmyCode.astraMilitarum:
        return 'Astra Militarum';
      case ArmyCode.greyKnights:
        return 'Grey Knights';
      case ArmyCode.imperialAgents:
        return 'Imperial Agents';
      case ArmyCode.imperialKnights:
        return 'Imperial Knights';
      case ArmyCode.spaceMarines:
        return 'Space Marines';
      case ArmyCode.chaosDaemons:
        return 'Chaos Daemons';
      case ArmyCode.chaosKnights:
        return 'Chaos Knights';
      case ArmyCode.chaosSpaceMarines:
        return 'Chaos Space Marines';
      case ArmyCode.deathGuard:
        return 'Death Guard';
      case ArmyCode.emperorsChildren:
        return 'Emperors Children';
      case ArmyCode.thousandSons:
        return 'Thousand Sons';
      case ArmyCode.worldEaters:
        return 'World Eaters';
      case ArmyCode.aeldari:
        return 'Aeldari';
      case ArmyCode.drukhari:
        return 'Drukhari';
      case ArmyCode.genestealerCults:
        return 'Genestealer Cults';
      case ArmyCode.leaguesOfVotann:
        return 'Leagues of Votann';
      case ArmyCode.necrons:
        return 'Necrons';
      case ArmyCode.orks:
        return 'Orks';
      case ArmyCode.tauEmpire:
        return 'Tau Empire';
      case ArmyCode.tyranids:
        return 'Tyranids';
    }
  }

  FactionCode get faction {
    switch (this) {
     case ArmyCode.adeptaSororitas:
       return FactionCode.imperium;
      case ArmyCode.adeptusCustodes:
        return FactionCode.imperium;
      case ArmyCode.adeptusMechanicus:
        return FactionCode.imperium;
      case ArmyCode.adeptusTitanicus:
        return FactionCode.imperium;
      case ArmyCode.astraMilitarum:
        return FactionCode.imperium;
      case ArmyCode.greyKnights:
        return FactionCode.imperium;
      case ArmyCode.imperialAgents:
        return FactionCode.imperium;
      case ArmyCode.imperialKnights:
        return FactionCode.imperium;
      case ArmyCode.spaceMarines:
        return FactionCode.imperium;
      case ArmyCode.chaosDaemons:
        return FactionCode.chaos;
      case ArmyCode.chaosKnights:
        return FactionCode.chaos;
      case ArmyCode.chaosSpaceMarines:
        return FactionCode.chaos;
      case ArmyCode.deathGuard:
        return FactionCode.chaos;
      case ArmyCode.emperorsChildren:
        return FactionCode.chaos;
      case ArmyCode.thousandSons:
        return FactionCode.chaos;
      case ArmyCode.worldEaters:
        return FactionCode.chaos;
      case ArmyCode.aeldari:
        return FactionCode.xenos;
      case ArmyCode.drukhari:
        return FactionCode.xenos;
      case ArmyCode.genestealerCults:
        return FactionCode.xenos;
      case ArmyCode.leaguesOfVotann:
        return FactionCode.xenos;
      case ArmyCode.necrons:
        return FactionCode.xenos;
      case ArmyCode.orks:
        return FactionCode.xenos;
      case ArmyCode.tauEmpire:
        return FactionCode.xenos;
      case ArmyCode.tyranids:
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

enum WeaponAbilitiesCode {
  assault,
  rapidFire,
  ignoresCover,
  twinLinked,
  pistol,
  torrent,
  lethalHits,
  lance,
  indirectFire,
  blast,
  precision,
  melta,
  heavy,
  hazardous,
  sustainedHits,
  extraAttacks,
  devastatingWounds,
  anti,
}

extension WeaponAbilitiesCodeX on WeaponAbilitiesCode {
  String get code => name;

  String get SnakeName {
    switch (this) {
      case WeaponAbilitiesCode.assault:
        return 'assault';
      case WeaponAbilitiesCode.rapidFire:
        return 'rapid_fire';
      case WeaponAbilitiesCode.ignoresCover:
        return 'ignores_cover';
      case WeaponAbilitiesCode.twinLinked:
        return 'twin_linked';
      case WeaponAbilitiesCode.pistol:
        return 'pistol';
      case WeaponAbilitiesCode.torrent:
        return 'torrent';
      case WeaponAbilitiesCode.lethalHits:
        return 'lethal_hits';
      case WeaponAbilitiesCode.lance:
        return 'lance';
      case WeaponAbilitiesCode.indirectFire:
        return 'indirect_fire';
      case WeaponAbilitiesCode.blast:
        return 'blast';
      case WeaponAbilitiesCode.precision:
        return 'precision';
      case WeaponAbilitiesCode.melta:
        return 'melta';
      case WeaponAbilitiesCode.heavy:
        return 'heavy';
      case WeaponAbilitiesCode.hazardous:
        return 'hazardous';
      case WeaponAbilitiesCode.sustainedHits:
        return 'sustained_hits';
      case WeaponAbilitiesCode.extraAttacks:
        return 'extra_attacks';
      case WeaponAbilitiesCode.devastatingWounds:
        return 'devastating_wounds';
      case WeaponAbilitiesCode.anti:
        return 'anti';
    }
  }

  String get title {
    switch (this) {
      case WeaponAbilitiesCode.assault:
        return 'Assault';
      case WeaponAbilitiesCode.rapidFire:
        return 'Rapid Fire';
      case WeaponAbilitiesCode.ignoresCover:
        return 'Ignores Cover';
      case WeaponAbilitiesCode.twinLinked:
        return 'Twin Linked';
      case WeaponAbilitiesCode.pistol:
        return 'Pistol';
      case WeaponAbilitiesCode.torrent:
        return 'Torrent';
      case WeaponAbilitiesCode.lethalHits:
        return 'Lethal Hits';
      case WeaponAbilitiesCode.lance:
        return 'Lance';
      case WeaponAbilitiesCode.indirectFire:
        return 'Indirect Fire';
      case WeaponAbilitiesCode.blast:
        return 'Blast';
      case WeaponAbilitiesCode.precision:
        return 'Precision';
      case WeaponAbilitiesCode.melta:
        return 'Melta';
      case WeaponAbilitiesCode.heavy:
        return 'Heavy';
      case WeaponAbilitiesCode.hazardous:
        return 'Hazardous';
      case WeaponAbilitiesCode.sustainedHits:
        return 'Sustained Hits';
      case WeaponAbilitiesCode.extraAttacks:
        return 'Extra Attacks';
      case WeaponAbilitiesCode.devastatingWounds:
        return 'Devastating Wounds';
      case WeaponAbilitiesCode.anti:
        return 'Anti';
    }
  }
}

enum UnitAbilitiesCode {
  deepStrike,
  deadlyDemise,
  fightsFirst,
  firingDeck,
  hover,
  infiltrators,
  leader,
  loneOperative,
  scouts,
  stealth,
  transport,
}

extension UnitAbilitiesCodeX on UnitAbilitiesCode {
  String get code => name;

  String get SnakeName {
    switch (this) {
      case UnitAbilitiesCode.deepStrike: return 'deep_strike';
      case UnitAbilitiesCode.deadlyDemise: return 'deadly_demise';
      case UnitAbilitiesCode.fightsFirst: return 'fights_first';
      case UnitAbilitiesCode.firingDeck: return 'firing_deck';
      case UnitAbilitiesCode.hover: return 'hover';
      case UnitAbilitiesCode.infiltrators: return 'infiltrators';
      case UnitAbilitiesCode.leader: return 'leader';
      case UnitAbilitiesCode.loneOperative: return 'lone_operative';
      case UnitAbilitiesCode.scouts: return 'scouts';
      case UnitAbilitiesCode.stealth: return 'stealth';
      case UnitAbilitiesCode.transport: return 'transport';
    }
  }

  String get title {
    switch (this) {
      case UnitAbilitiesCode.deepStrike: return 'Deep Strike';
      case UnitAbilitiesCode.deadlyDemise: return 'Deadly Demise';
      case UnitAbilitiesCode.fightsFirst: return 'Fights First';
      case UnitAbilitiesCode.firingDeck: return 'Firing Deck';
      case UnitAbilitiesCode.hover: return 'Hover';
      case UnitAbilitiesCode.infiltrators: return 'Infiltrators';
      case UnitAbilitiesCode.leader: return 'Leader';
      case UnitAbilitiesCode.loneOperative: return 'Lone Operative';
      case UnitAbilitiesCode.scouts: return 'Scouts';
      case UnitAbilitiesCode.stealth: return 'Stealth';
      case UnitAbilitiesCode.transport: return 'Transport';
    }
  }
}

// ==========================================
// OBJECTS CLASS
// ==========================================

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
  // Добавляем stats для JSON поля
  final UnitStats stats;

  const UnitSeed({
    this.id,
    required this.name,
    required this.army,
    required this.role,
    this.codex,
    required this.stats,
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





class WeaponAbilitySeed {

  final String? id;
  final String code;
  final String name;
  final String shortDescription;
  final String description;

  const WeaponAbilitySeed({
    this.id,
    required this.code,
    required this.name,
    required this.shortDescription,
    required this.description,
  });
}

class UnitAbilitySeed {
  final String? id;
  final String code;
  final String name;
  final String shortDescription;
  final String description;

  const UnitAbilitySeed({
    this.id,
    required this.code,
    required this.name,
    required this.shortDescription,
    required this.description,
  });
}

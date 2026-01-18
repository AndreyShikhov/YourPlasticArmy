
import 'package:ypa/domain/models/unit/unit_stats.dart';

import '../../../../../domain/models/faction/faction.dart';


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
  none,
  melee,
  ranged,
}

enum DamageType {
  normal,
  mortal,
}

enum FactionTypeCode {
  imperium,
  chaos,
  xenos,
}
extension FactionTypeCodeX on FactionTypeCode {
  String get code => name; // imperium
  String get title {
    switch (this) {
      case FactionTypeCode.imperium:
        return 'Imperium';
      case FactionTypeCode.chaos:
        return 'Chaos';
      case FactionTypeCode.xenos:
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

  FactionTypeCode get faction {
    switch (this) {
     case ArmyCode.adeptaSororitas:
       return FactionTypeCode.imperium;
      case ArmyCode.adeptusCustodes:
        return FactionTypeCode.imperium;
      case ArmyCode.adeptusMechanicus:
        return FactionTypeCode.imperium;
      case ArmyCode.adeptusTitanicus:
        return FactionTypeCode.imperium;
      case ArmyCode.astraMilitarum:
        return FactionTypeCode.imperium;
      case ArmyCode.greyKnights:
        return FactionTypeCode.imperium;
      case ArmyCode.imperialAgents:
        return FactionTypeCode.imperium;
      case ArmyCode.imperialKnights:
        return FactionTypeCode.imperium;
      case ArmyCode.spaceMarines:
        return FactionTypeCode.imperium;
      case ArmyCode.chaosDaemons:
        return FactionTypeCode.chaos;
      case ArmyCode.chaosKnights:
        return FactionTypeCode.chaos;
      case ArmyCode.chaosSpaceMarines:
        return FactionTypeCode.chaos;
      case ArmyCode.deathGuard:
        return FactionTypeCode.chaos;
      case ArmyCode.emperorsChildren:
        return FactionTypeCode.chaos;
      case ArmyCode.thousandSons:
        return FactionTypeCode.chaos;
      case ArmyCode.worldEaters:
        return FactionTypeCode.chaos;
      case ArmyCode.aeldari:
        return FactionTypeCode.xenos;
      case ArmyCode.drukhari:
        return FactionTypeCode.xenos;
      case ArmyCode.genestealerCults:
        return FactionTypeCode.xenos;
      case ArmyCode.leaguesOfVotann:
        return FactionTypeCode.xenos;
      case ArmyCode.necrons:
        return FactionTypeCode.xenos;
      case ArmyCode.orks:
        return FactionTypeCode.xenos;
      case ArmyCode.tauEmpire:
        return FactionTypeCode.xenos;
      case ArmyCode.tyranids:
        return FactionTypeCode.xenos;
    }
  }
}

enum CodexCode {
  adeptaSororitas,
  adeptusCustodes,
  adeptusMechanicus,
  adeptusTitanicus,
  astraMilitarum,
  greyKnights,
  imperialAgents,
  imperialKnights,
  blackTemplars,
  bloodAngels,
  darkAngels,
  deathWatch,
  imperialFists,
  ironHands,
  ravenGuard,
  salamanders,
  ultramarines,
  whiteScars,
  spaceWolves,

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
extension CodexCodeX on CodexCode {
  String get code {
    switch (this) {
      case CodexCode.adeptaSororitas:
        return 'adepta_sororitas';
      case CodexCode.adeptusCustodes:
        return 'adeptus_custodes';
      case CodexCode.adeptusMechanicus:
        return 'adeptus_mechanicus';
      case CodexCode.adeptusTitanicus:
        return 'adeptus_titanicus';
      case CodexCode.astraMilitarum:
        return 'astra_militarum';
      case CodexCode.greyKnights:
        return 'grey_knights';
      case CodexCode.imperialAgents:
        return 'imperial_agents';
      case CodexCode.imperialKnights:
        return 'imperial_knights';
      case CodexCode.blackTemplars:
        return 'black_templars';
      case CodexCode.bloodAngels:
        return 'blood_angels';
      case CodexCode.darkAngels:
        return 'dark_angels';
      case CodexCode.deathWatch:
        return 'death_watch';
      case CodexCode.imperialFists:
        return 'imperial_fists';
      case CodexCode.ironHands:
        return 'iron_hands';
      case CodexCode.ravenGuard:
        return 'raven_guard';
      case CodexCode.salamanders:
        return 'salamanders';
      case CodexCode.ultramarines:
        return 'ultramarines';
      case CodexCode.whiteScars:
        return 'white_scars';
      case CodexCode.spaceWolves:
        return 'space_wolves';
      case CodexCode.chaosDaemons:
        return 'chaos_daemons';
      case CodexCode.chaosKnights:
        return 'chaos_knights';
      case CodexCode.chaosSpaceMarines:
        return 'chaos_space_marines';
      case CodexCode.deathGuard:
        return 'death_guard';
      case CodexCode.emperorsChildren:
        return 'emperors_children';
      case CodexCode.thousandSons:
        return 'thousand_sons';
      case CodexCode.worldEaters:
        return 'world_eaters';
      case CodexCode.aeldari:
        return 'aeldari';
      case CodexCode.drukhari:
        return 'drukhari';
      case CodexCode.genestealerCults:
        return 'genestealer_cults';
      case CodexCode.leaguesOfVotann:
        return 'leagues_of_votann';
      case CodexCode.necrons:
        return 'necrons';
      case CodexCode.orks:
        return 'orks';
      case CodexCode.tauEmpire:
        return 'tau_empire';
      case CodexCode.tyranids:
        return 'tyranids';
    }
  }

  String get title {
    switch (this) {
      case CodexCode.adeptaSororitas:
        return 'Adepta Sororitas';
      case CodexCode.adeptusCustodes:
        return 'Adeptus Custodes';
      case CodexCode.adeptusMechanicus:
        return 'Adeptus Mechanicus';
      case CodexCode.adeptusTitanicus:
        return 'Adeptus Titanicus';
      case CodexCode.astraMilitarum:
        return 'Astra Militarum';
      case CodexCode.greyKnights:
        return 'Grey Knights';
      case CodexCode.imperialAgents:
        return 'Imperial Agents';
      case CodexCode.imperialKnights:
        return 'Imperial Knights';
      case CodexCode.blackTemplars:
        return 'Black Templars';
      case CodexCode.bloodAngels:
        return 'Blood Angels';
      case CodexCode.darkAngels:
        return 'Dark Angels';
      case CodexCode.deathWatch:
        return 'Death Watch';
      case CodexCode.imperialFists:
        return 'Imperial Fists';
      case CodexCode.ironHands:
        return 'Iron Hands';
      case CodexCode.ravenGuard:
        return 'Raven Guard';
      case CodexCode.salamanders:
        return 'Salamanders';
      case CodexCode.ultramarines:
        return 'Ultramarines';
      case CodexCode.whiteScars:
        return 'White Scars';
      case CodexCode.spaceWolves:
        return 'Space Wolves';
      case CodexCode.chaosDaemons:
        return 'Chaos Daemons';
      case CodexCode.chaosKnights:
        return 'Chaos Knights';
      case CodexCode.chaosSpaceMarines:
        return 'Chaos Space Marines';
      case CodexCode.deathGuard:
        return 'Death Guard';
      case CodexCode.emperorsChildren:
        return 'Emperors Children';
      case CodexCode.thousandSons:
        return 'Thousand Sons';
      case CodexCode.worldEaters:
        return 'World Eaters';
      case CodexCode.aeldari:
        return 'Aeldari';
      case CodexCode.drukhari:
        return 'Drukhari';
      case CodexCode.genestealerCults:
        return 'Genestealer Cults';
      case CodexCode.leaguesOfVotann:
        return 'Leagues of Votann';
      case CodexCode.necrons:
        return 'Necrons';
      case CodexCode.orks:
        return 'Orks';
      case CodexCode.tauEmpire:
        return 'Tau Empire';
      case CodexCode.tyranids:
        return 'Tyranids';
    }
  }

  ArmyCode get army {
    switch (this) {
      case CodexCode.adeptaSororitas:
        return ArmyCode.adeptaSororitas;
      case CodexCode.adeptusCustodes:
        return ArmyCode.adeptusCustodes;
      case CodexCode.adeptusMechanicus:
        return ArmyCode.adeptusMechanicus;
      case CodexCode.adeptusTitanicus:
        return ArmyCode.adeptusTitanicus;
      case CodexCode.astraMilitarum:
        return ArmyCode.astraMilitarum;
      case CodexCode.greyKnights:
        return ArmyCode.greyKnights;
      case CodexCode.imperialAgents:
        return ArmyCode.imperialAgents;
      case CodexCode.imperialKnights:
        return ArmyCode.imperialKnights;
      case CodexCode.blackTemplars:
        return ArmyCode.spaceMarines;
      case CodexCode.bloodAngels:
        return ArmyCode.spaceMarines;
      case CodexCode.darkAngels:
        return ArmyCode.spaceMarines;
      case CodexCode.deathWatch:
        return ArmyCode.spaceMarines;
      case CodexCode.imperialFists:
        return ArmyCode.spaceMarines;
      case CodexCode.ironHands:
        return ArmyCode.spaceMarines;
      case CodexCode.ravenGuard:
        return ArmyCode.spaceMarines;
      case CodexCode.salamanders:
        return ArmyCode.spaceMarines;
      case CodexCode.ultramarines:
        return ArmyCode.spaceMarines;
      case CodexCode.whiteScars:
        return ArmyCode.spaceMarines;
      case CodexCode.spaceWolves:
        return ArmyCode.spaceMarines;
      case CodexCode.chaosDaemons:
        return ArmyCode.chaosDaemons;
      case CodexCode.chaosKnights:
        return ArmyCode.chaosKnights;
      case CodexCode.chaosSpaceMarines:
        return ArmyCode.chaosSpaceMarines;
      case CodexCode.deathGuard:
        return ArmyCode.deathGuard;
      case CodexCode.emperorsChildren:
        return ArmyCode.emperorsChildren;
      case CodexCode.thousandSons:
        return ArmyCode.thousandSons;
      case CodexCode.worldEaters:
        return ArmyCode.worldEaters;
      case CodexCode.aeldari:
        return ArmyCode.aeldari;
      case CodexCode.drukhari:
        return ArmyCode.drukhari;
      case CodexCode.genestealerCults:
        return ArmyCode.genestealerCults;
      case CodexCode.leaguesOfVotann:
        return ArmyCode.leaguesOfVotann;
      case CodexCode.necrons:
        return ArmyCode.necrons;
      case CodexCode.orks:
        return ArmyCode.orks;
      case CodexCode.tauEmpire:
        return ArmyCode.tauEmpire;
      case CodexCode.tyranids:
        return ArmyCode.tyranids;
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
  none,
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
      case WeaponAbilitiesCode.none:
        return 'none';
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
      case WeaponAbilitiesCode.none:
        return 'none';
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
  none,
  deepStrike,
  deadlyDemise,
  fightsFirst,
  firingDeck,
  hover,
  infiltrators,
  loneOperative,
  scouts,
  stealth,
  transport,
}

extension UnitAbilitiesCodeX on UnitAbilitiesCode {
  String get code => name;

  String get SnakeName {
    switch (this) {
      case UnitAbilitiesCode.none: return 'none';
      case UnitAbilitiesCode.deepStrike: return 'deep_strike';
      case UnitAbilitiesCode.deadlyDemise: return 'deadly_demise';
      case UnitAbilitiesCode.fightsFirst: return 'fights_first';
      case UnitAbilitiesCode.firingDeck: return 'firing_deck';
      case UnitAbilitiesCode.hover: return 'hover';
      case UnitAbilitiesCode.infiltrators: return 'infiltrators';
      case UnitAbilitiesCode.loneOperative: return 'lone_operative';
      case UnitAbilitiesCode.scouts: return 'scouts';
      case UnitAbilitiesCode.stealth: return 'stealth';
      case UnitAbilitiesCode.transport: return 'transport';
    }
  }

  String get title {
    switch (this) {
      case UnitAbilitiesCode.none: return 'none';
      case UnitAbilitiesCode.deepStrike: return 'Deep Strike';
      case UnitAbilitiesCode.deadlyDemise: return 'Deadly Demise';
      case UnitAbilitiesCode.fightsFirst: return 'Fights First';
      case UnitAbilitiesCode.firingDeck: return 'Firing Deck';
      case UnitAbilitiesCode.hover: return 'Hover';
      case UnitAbilitiesCode.infiltrators: return 'Infiltrators';
      case UnitAbilitiesCode.loneOperative: return 'Lone Operative';
      case UnitAbilitiesCode.scouts: return 'Scouts';
      case UnitAbilitiesCode.stealth: return 'Stealth';
      case UnitAbilitiesCode.transport: return 'Transport';
    }
  }
}

enum  FactionUnitAbilityCode {
  none,
  oathOfMoment,

}

extension  FactionUnitAbilityCodeX on FactionUnitAbilityCode {
  String get code => name;

  String get SnakeName {
    switch (this) {
      case FactionUnitAbilityCode.none: return 'none';
      case FactionUnitAbilityCode.oathOfMoment: return 'oath_of_moment';

    }
  }

  String get title {
    switch (this) {
      case FactionUnitAbilityCode.none: return 'none';
      case FactionUnitAbilityCode.oathOfMoment: return 'Oath of Moment';
    }
  }
}

enum CoreUnitAbilityCode {
  none,
  leader,
  deepStrike,
  scouts,
  infiltrators,
}

extension CoreUnitAbilityCodeX on CoreUnitAbilityCode {
  String get code => name;

  String get SnakeName {
    switch (this) {
      case CoreUnitAbilityCode.none: return 'none';
      case CoreUnitAbilityCode.leader: return 'leader';
      case CoreUnitAbilityCode.deepStrike: return 'deep_strike';
      case CoreUnitAbilityCode.scouts: return 'scouts';
      case CoreUnitAbilityCode.infiltrators: return 'infiltrators';

    }
  }

  String get title {
    switch (this) {
      case CoreUnitAbilityCode.none: return 'none';
      case CoreUnitAbilityCode.leader: return 'Leader';
      case CoreUnitAbilityCode.deepStrike: return 'Deep Strike';
      case CoreUnitAbilityCode.scouts: return 'Scouts';
      case CoreUnitAbilityCode.infiltrators: return 'Infiltrators';
    }
  }
}

enum StratagemsCode {
  none,
  eitherPlayersTurn,
  yourTurn,
  opponentsTurn,
}

extension StratagemsCodeX on StratagemsCode {
  String get code => name;

  String get SnakeName {
    switch (this) {
      case StratagemsCode.none: return 'none';
      case StratagemsCode.eitherPlayersTurn: return 'either_players_turn';
      case StratagemsCode.yourTurn: return 'your_turn';
      case StratagemsCode.opponentsTurn: return 'opponents_turn';

    }
  }

  String get title {
    switch (this) {
      case StratagemsCode.none: return 'none';
      case StratagemsCode.eitherPlayersTurn: return 'Either Player\'s Turn';
      case StratagemsCode.yourTurn: return 'Your Turn';
      case StratagemsCode.opponentsTurn: return 'Opponent\'s Turn';
    }
  }
}

// ==========================================
// OBJECTS CLASS
// ==========================================


class FactionSeed {
  final FactionTypeCode code;
  final FactionName name;

  const FactionSeed({
    required this.code,
    required this.name,
  });

  String get title => name.value;
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
  final ArmyCode armyCode;
  final String name;
  final String description;
  final String ruleName;
  final String ruleShort;
  final String ruleFull;

  const DetachmentSeed({
    required this.code,
    required this.armyCode,
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
  final bool isGeneral;


  const DetachmentCodexLinkSeed({
    required this.detachmentCode,
    required this.codex,
    required this.isGeneral,
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
  final String          id;
  final StratagemsCode  code;
  final String          name;
  final String          when;
  final String          target;
  final String          effect;
  final int             cost;
  final String?         codexId; // codex code
  final String?         detachmentId;  // detachment code

  const StrategemsSeed({
    required this.id,
    required this.code,
    required this.name,
    required this.when,
    required this.target,
    required this.effect,
    required this.cost,
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

class CoreUnitAbilitySeed {
  final String? id;
  final String code;
  final String name;
  final String shortDescription;
  final String description;

  const CoreUnitAbilitySeed({
    this.id,
    required this.code,
    required this.name,
    required this.shortDescription,
    required this.description,
  });
}

class FactionUnitAbilitySeed {
  final String? id;
  final String code;
  final String name;
  final String shortDescription;
  final String description;

  const FactionUnitAbilitySeed({
    this.id,
    required this.code,
    required this.name,
    required this.shortDescription,
    required this.description,
  });
}

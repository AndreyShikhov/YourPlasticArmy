/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/
import 'package:ypa/domain/models/unit/model_stats.dart';
import '../../../../../domain/models/faction/faction.dart';

// ==========================================
// ENUMS (Modern Enhanced Style)
// ==========================================

enum GamePhase { command, movement, shooting, charge, fight }

enum WeaponType { none, melee, ranged }

enum DamageType { normal, mortal }

enum FactionTypeCode {
  none('none', 'none'),
  imperium('imperium', 'Imperium'),
  chaos('chaos', 'Chaos'),
  xenos('xenos', 'Xenos');

  final String code;
  final String title;
  const FactionTypeCode(this.code, this.title);

  static FactionTypeCode? fromName(String name) =>
      values.where((e) => e.name == name).firstOrNull;
}

enum ArmyTypeCode {
  none('none', 'none', FactionTypeCode.none),
  // Imperium
  adeptaSororitas('adepta_sororitas', 'Adepta Sororitas', FactionTypeCode.imperium),
  adeptusCustodes('adeptus_custodes', 'Adeptus Custodes', FactionTypeCode.imperium),
  adeptusMechanicus('adeptus_mechanicus', 'Adeptus Mechanicus', FactionTypeCode.imperium),
  adeptusTitanicus('adeptus_titanicus', 'Adeptus Titanicus', FactionTypeCode.imperium),
  astraMilitarum('astra_militarum', 'Astra Militarum', FactionTypeCode.imperium),
  greyKnights('grey_knights', 'Grey Knights', FactionTypeCode.imperium),
  imperialAgents('imperial_agents', 'Imperial Agents', FactionTypeCode.imperium),
  imperialKnights('imperial_knights', 'Imperial Knights', FactionTypeCode.imperium),
  spaceMarines('space_marines', 'Space Marines', FactionTypeCode.imperium),
  // Chaos
  chaosDaemons('chaos_daemons', 'Chaos Daemons', FactionTypeCode.chaos),
  chaosKnights('chaos_knights', 'Chaos Knights', FactionTypeCode.chaos),
  chaosSpaceMarines('chaos_space_marines', 'Chaos Space Marines', FactionTypeCode.chaos),
  deathGuard('death_guard', 'Death Guard', FactionTypeCode.chaos),
  emperorsChildren('emperors_children', 'Emperors Children', FactionTypeCode.chaos),
  thousandSons('thousand_sons', 'Thousand Sons', FactionTypeCode.chaos),
  worldEaters('world_eaters', 'World Eaters', FactionTypeCode.chaos),
  // Xenos
  aeldari('aeldari', 'Aeldari', FactionTypeCode.xenos),
  drukhari('drukhari', 'Drukhari', FactionTypeCode.xenos),
  genestealerCults('genestealer_cults', 'Genestealer Cults', FactionTypeCode.xenos),
  leaguesOfVotann('leagues_of_votann', 'Leagues of Votann', FactionTypeCode.xenos),
  necrons('necrons', 'Necrons', FactionTypeCode.xenos),
  orks('orks', 'Orks', FactionTypeCode.xenos),
  tauEmpire('tau_empire', 'Tau Empire', FactionTypeCode.xenos),
  tyranids('tyranids', 'Tyranids', FactionTypeCode.xenos);

  final String code;
  final String title;
  final FactionTypeCode faction;

  const ArmyTypeCode(this.code, this.title, this.faction);

  static ArmyTypeCode? fromCode(String code) =>
      values.where((e) => e.code == code).firstOrNull;

  static ArmyTypeCode? fromName(String name) =>
      values.where((e) => e.name == name).firstOrNull;
}

enum CodexTypeCode {
  none('none', 'none', ArmyTypeCode.none),
  adeptaSororitas('adepta_sororitas', 'Adepta Sororitas', ArmyTypeCode.adeptaSororitas),
  adeptusCustodes('adeptus_custodes', 'Adeptus Custodes', ArmyTypeCode.adeptusCustodes),
  adeptusMechanicus('adeptus_mechanicus', 'Adeptus Mechanicus', ArmyTypeCode.adeptusMechanicus),
  adeptusTitanicus('adeptus_titanicus', 'Adeptus Titanicus', ArmyTypeCode.adeptusTitanicus),
  astraMilitarum('astra_militarum', 'Astra Militarum', ArmyTypeCode.astraMilitarum),
  greyKnights('grey_knights', 'Grey Knights', ArmyTypeCode.greyKnights),
  imperialAgents('imperial_agents', 'Imperial Agents', ArmyTypeCode.imperialAgents),
  imperialKnights('imperial_knights', 'Imperial Knights', ArmyTypeCode.imperialKnights),
  blackTemplars('black_templars', 'Black Templars', ArmyTypeCode.spaceMarines),
  bloodAngels('blood_angels', 'Blood Angels', ArmyTypeCode.spaceMarines),
  darkAngels('dark_angels', 'Dark Angels', ArmyTypeCode.spaceMarines),
  deathWatch('death_watch', 'Death Watch', ArmyTypeCode.spaceMarines),
  imperialFists('imperial_fists', 'Imperial Fists', ArmyTypeCode.spaceMarines),
  ironHands('iron_hands', 'Iron Hands', ArmyTypeCode.spaceMarines),
  ravenGuard('raven_guard', 'Raven Guard', ArmyTypeCode.spaceMarines),
  salamanders('salamanders', 'Salamanders', ArmyTypeCode.spaceMarines),
  ultramarines('ultramarines', 'Ultramarines', ArmyTypeCode.spaceMarines),
  whiteScars('white_scars', 'White Scars', ArmyTypeCode.spaceMarines),
  spaceWolves('space_wolves', 'Space Wolves', ArmyTypeCode.spaceMarines),
  chaosDaemons('chaos_daemons', 'Chaos Daemons', ArmyTypeCode.chaosDaemons),
  chaosKnights('chaos_knights', 'Chaos Knights', ArmyTypeCode.chaosKnights),
  chaosSpaceMarines('chaos_space_marines', 'Chaos Space Marines', ArmyTypeCode.chaosSpaceMarines),
  deathGuard('death_guard', 'Death Guard', ArmyTypeCode.deathGuard),
  emperorsChildren('emperors_children', 'Emperors Children', ArmyTypeCode.emperorsChildren),
  thousandSons('thousand_sons', 'Thousand Sons', ArmyTypeCode.thousandSons),
  worldEaters('world_eaters', 'World Eaters', ArmyTypeCode.worldEaters),
  aeldari('aeldari', 'Aeldari', ArmyTypeCode.aeldari),
  drukhari('drukhari', 'Drukhari', ArmyTypeCode.drukhari),
  genestealerCults('genestealer_cults', 'Genestealer Cults', ArmyTypeCode.genestealerCults),
  leaguesOfVotann('leagues_of_votann', 'Leagues of Votann', ArmyTypeCode.leaguesOfVotann),
  necrons('necrons', 'Necrons', ArmyTypeCode.necrons),
  orks('orks', 'Orks', ArmyTypeCode.orks),
  tauEmpire('tau_empire', 'Tau Empire', ArmyTypeCode.tauEmpire),
  tyranids('tyranids', 'Tyranids', ArmyTypeCode.tyranids);

  final String code;
  final String title;
  final ArmyTypeCode army;

  const CodexTypeCode(this.code, this.title, this.army);

  static CodexTypeCode? fromCode(String code) =>
      values.where((e) => e.code == code).firstOrNull;

  static CodexTypeCode? fromName(String name) =>
      values.where((e) => e.name == name).firstOrNull;
}

enum UnitRoleCode {
  characters('characters', 'Characters'),
  battleline('battleline', 'Battleline'),
  dedicatedTransports('dedicated_transports', 'Dedicated Transports'),
  fortifications('fortifications', 'Fortifications'),
  other('other', 'Other');

  final String code;
  final String title;
  const UnitRoleCode(this.code, this.title);

  static UnitRoleCode? fromTitle(String title) =>
      values.where((e) => e.title == title).firstOrNull;

  static UnitRoleCode? fromName(String name) =>
      values.where((e) => e.name == name).firstOrNull;
}

enum WeaponAbilitiesCode {
  none('none', 'none'),
  assault('assault', 'Assault'),
  rapidFire('rapid_fire', 'Rapid Fire'),
  ignoresCover('ignores_cover', 'Ignores Cover'),
  twinLinked('twin_linked', 'Twin Linked'),
  pistol('pistol', 'Pistol'),
  torrent('torrent', 'Torrent'),
  lethalHits('lethal_hits', 'Lethal Hits'),
  lance('lance', 'Lance'),
  indirectFire('indirect_fire', 'Indirect Fire'),
  blast('blast', 'Blast'),
  precision('precision', 'Precision'),
  melta('melta', 'Melta'),
  heavy('heavy', 'Heavy'),
  hazardous('hazardous', 'Hazardous'),
  sustainedHits('sustained_hits', 'Sustained Hits'),
  extraAttacks('extra_attacks', 'Extra Attacks'),
  devastatingWounds('devastating_wounds', 'Devastating Wounds'),
  anti('anti', 'Anti');

  final String code;
  final String title;
  const WeaponAbilitiesCode(this.code, this.title);
}

enum FactionUnitAbilityCode {
  none('none', 'none'),
  oathOfMoment('oath_of_moment', 'Oath of Moment');

  final String code;
  final String title;
  const FactionUnitAbilityCode(this.code, this.title);

  static FactionUnitAbilityCode? fromName(String name) =>
      values.where((e) => e.name == name).firstOrNull;
}

enum CoreUnitAbilityCode {
  none('none', 'none'),
  leader('leader', 'Leader'),
  deepStrike('deep_strike', 'Deep Strike'),
  scouts('scouts', 'Scouts'),
  infiltrators('infiltrators', 'Infiltrators');

  final String code;
  final String title;
  const CoreUnitAbilityCode(this.code, this.title);

  static CoreUnitAbilityCode? fromName(String name) =>
      values.where((e) => e.name == name).firstOrNull;
}

enum StratagemsCode {
  none('none', 'none'),
  eitherPlayersTurn('either_players_turn', 'Either Player\'s Turn'),
  yourTurn('your_turn', 'Your Turn'),
  opponentsTurn('opponents_turn', 'Opponent\'s Turn');

  final String code;
  final String title;
  const StratagemsCode(this.code, this.title);
}

enum BattleSizeCode {
  incursion('incursion', 'Incursion'),
  strikeForce('strike_force', 'Strike Force'),
  onslaught('onslaught', 'Onslaught');

  final String code;
  final String title;
  const BattleSizeCode(this.code, this.title);

  static BattleSizeCode? fromTitle(String title) =>
      values.where((e) => e.title == title).firstOrNull;

  static BattleSizeCode? fromName(String name) =>
      values.where((e) => e.name == name).firstOrNull;
}

// ==========================================
// SEED & SUPPORT CLASSES
// ==========================================

class FactionSeed {
  final FactionTypeCode code;
  final FactionName name;
  const FactionSeed({required this.code, required this.name});
  String get title => name.value;
}

class CodexSeed {
  final CodexTypeCode code;
  final ArmyTypeCode army;
  const CodexSeed({required this.code, required this.army});
  String get name => code.title;
}

class ArmySeed {
  final ArmyTypeCode armyCode;
  final String armyName;
  final FactionCode factionCode;
  const ArmySeed({required this.armyCode, required this.armyName, required this.factionCode});
}

class UnitSeed {
  final String? id;
  final String name;
  final ArmyTypeCode army;
  final CodexTypeCode? codex;
  final UnitRoleCode role;
  final int repeat;
  final List<String> keywords;
  final List<String> factionKeywords;
  final UnitComposition unitComposition;
  final List<String> unitAbility;
  final List<CoreUnitAbilityCode> coreAbilities;
  final List<FactionUnitAbilityCode> factionAbilities;
  final List<LeaderFilter> leader;
  final List<LeaderFilter> ledBy;
  final Map<String, ModelStatsDom> modelStats;

  const UnitSeed({
    this.id,
    required this.name,
    required this.army,
    this.codex,
    required this.role,
    required this.repeat,
    required this.keywords,
    required this.factionKeywords,
    required this.unitComposition,
    required this.unitAbility,
    required this.coreAbilities,
    required this.factionAbilities,
    required this.leader,
    required this.ledBy,
    required this.modelStats,
  });
}

class DetachmentSeed {
  final String code;
  final ArmyTypeCode armyCode;
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
  final CodexTypeCode codex;
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
  final String id;
  final StratagemsCode code;
  final String name;
  final String when;
  final String target;
  final String effect;
  final int cost;
  final String? codexId;
  final String? detachmentId;

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

class BattleSize {
  final Map<BattleSizeCode, int> battleSize;
  final BattleSizeCode? selected;

  const BattleSize({required this.battleSize, this.selected});

  factory BattleSize.base() => const BattleSize(
        battleSize: {
          BattleSizeCode.incursion: 1000,
          BattleSizeCode.strikeForce: 2000,
          BattleSizeCode.onslaught: 3000,
        },
        selected: null,
      );

  factory BattleSize.selected(BattleSizeCode selected) => BattleSize(
        battleSize: {
          BattleSizeCode.incursion: 1000,
          BattleSizeCode.strikeForce: 2000,
          BattleSizeCode.onslaught: 3000,
        },
        selected: selected,
      );

  int get total => battleSize[selected] ?? 0;
}

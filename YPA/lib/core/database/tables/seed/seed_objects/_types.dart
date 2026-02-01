/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/
import 'package:ypa/domain/models/unit/model_stats.dart';

import '../../../../../domain/models/faction/faction.dart';

// ==========================================
// ENUM
// ==========================================
enum GamePhase
{
    command,
    movement,
    shooting,
    charge,
    fight
}

enum WeaponType
{
    none,
    melee,
    ranged
}

enum DamageType
{
    normal,
    mortal
}

enum FactionTypeCode
{
    none,
    imperium,
    chaos,
    xenos
}
extension FactionTypeCodeX on FactionTypeCode
{
    String get code => name; // imperium
    String get title
    {
        switch (this)
        {
            case FactionTypeCode.none:
                return 'none';
            case FactionTypeCode.imperium:
                return 'Imperium';
            case FactionTypeCode.chaos:
                return 'Chaos';
            case FactionTypeCode.xenos:
                return 'Xenos';
        }
    }
}

enum ArmyTypeCode
{

    none,
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
    tyranids

}
extension ArmyTypeCodeX on ArmyTypeCode
{
    String get code
    {
        switch (this)
        {
            case ArmyTypeCode.none:
                return 'none';
            case ArmyTypeCode.adeptaSororitas:
                return 'adepta_sororitas';
            case ArmyTypeCode.adeptusCustodes:
                return 'adeptus_custodes';
            case ArmyTypeCode.adeptusMechanicus:
                return 'adeptus_mechanicus';
            case ArmyTypeCode.adeptusTitanicus:
                return 'adeptus_titanicus';
            case ArmyTypeCode.astraMilitarum:
                return 'astra_militarum';
            case ArmyTypeCode.greyKnights:
                return 'grey_knights';
            case ArmyTypeCode.imperialAgents:
                return 'imperial_agents';
            case ArmyTypeCode.imperialKnights:
                return 'imperial_knights';
            case ArmyTypeCode.spaceMarines:
                return 'space_marines';
            case ArmyTypeCode.chaosDaemons:
                return 'chaos_daemons';
            case ArmyTypeCode.chaosKnights:
                return 'chaos_knights';
            case ArmyTypeCode.chaosSpaceMarines:
                return 'chaos_space_marines';
            case ArmyTypeCode.deathGuard:
                return 'death_guard';
            case ArmyTypeCode.emperorsChildren:
                return 'emperors_children';
            case ArmyTypeCode.thousandSons:
                return 'thousand_sons';
            case ArmyTypeCode.worldEaters:
                return 'world_eaters';
            case ArmyTypeCode.aeldari:
                return 'aeldari';
            case ArmyTypeCode.drukhari:
                return 'drukhari';
            case ArmyTypeCode.genestealerCults:
                return 'genestealer_cults';
            case ArmyTypeCode.leaguesOfVotann:
                return 'leagues_of_votann';
            case ArmyTypeCode.necrons:
                return 'necrons';
            case ArmyTypeCode.orks:
                return 'orks';
            case ArmyTypeCode.tauEmpire:
                return 'tau_empire';
            case ArmyTypeCode.tyranids:
                return 'tyranids';
        }
    }

    String get title
    {
        switch (this)
        {
            case ArmyTypeCode.none:
                return 'none';
            case ArmyTypeCode.adeptaSororitas:
                return 'Adepta Sororitas';
            case ArmyTypeCode.adeptusCustodes:
                return 'Adeptus Custodes';
            case ArmyTypeCode.adeptusMechanicus:
                return 'Adeptus Mechanicus';
            case ArmyTypeCode.adeptusTitanicus:
                return 'Adeptus Titanicus';
            case ArmyTypeCode.astraMilitarum:
                return 'Astra Militarum';
            case ArmyTypeCode.greyKnights:
                return 'Grey Knights';
            case ArmyTypeCode.imperialAgents:
                return 'Imperial Agents';
            case ArmyTypeCode.imperialKnights:
                return 'Imperial Knights';
            case ArmyTypeCode.spaceMarines:
                return 'Space Marines';
            case ArmyTypeCode.chaosDaemons:
                return 'Chaos Daemons';
            case ArmyTypeCode.chaosKnights:
                return 'Chaos Knights';
            case ArmyTypeCode.chaosSpaceMarines:
                return 'Chaos Space Marines';
            case ArmyTypeCode.deathGuard:
                return 'Death Guard';
            case ArmyTypeCode.emperorsChildren:
                return 'Emperors Children';
            case ArmyTypeCode.thousandSons:
                return 'Thousand Sons';
            case ArmyTypeCode.worldEaters:
                return 'World Eaters';
            case ArmyTypeCode.aeldari:
                return 'Aeldari';
            case ArmyTypeCode.drukhari:
                return 'Drukhari';
            case ArmyTypeCode.genestealerCults:
                return 'Genestealer Cults';
            case ArmyTypeCode.leaguesOfVotann:
                return 'Leagues of Votann';
            case ArmyTypeCode.necrons:
                return 'Necrons';
            case ArmyTypeCode.orks:
                return 'Orks';
            case ArmyTypeCode.tauEmpire:
                return 'Tau Empire';
            case ArmyTypeCode.tyranids:
                return 'Tyranids';
        }
    }

    FactionTypeCode get faction
    {
        switch (this)
        {
            case ArmyTypeCode.none:
                return FactionTypeCode.none;
            case ArmyTypeCode.adeptaSororitas:
                return FactionTypeCode.imperium;
            case ArmyTypeCode.adeptusCustodes:
                return FactionTypeCode.imperium;
            case ArmyTypeCode.adeptusMechanicus:
                return FactionTypeCode.imperium;
            case ArmyTypeCode.adeptusTitanicus:
                return FactionTypeCode.imperium;
            case ArmyTypeCode.astraMilitarum:
                return FactionTypeCode.imperium;
            case ArmyTypeCode.greyKnights:
                return FactionTypeCode.imperium;
            case ArmyTypeCode.imperialAgents:
                return FactionTypeCode.imperium;
            case ArmyTypeCode.imperialKnights:
                return FactionTypeCode.imperium;
            case ArmyTypeCode.spaceMarines:
                return FactionTypeCode.imperium;
            case ArmyTypeCode.chaosDaemons:
                return FactionTypeCode.chaos;
            case ArmyTypeCode.chaosKnights:
                return FactionTypeCode.chaos;
            case ArmyTypeCode.chaosSpaceMarines:
                return FactionTypeCode.chaos;
            case ArmyTypeCode.deathGuard:
                return FactionTypeCode.chaos;
            case ArmyTypeCode.emperorsChildren:
                return FactionTypeCode.chaos;
            case ArmyTypeCode.thousandSons:
                return FactionTypeCode.chaos;
            case ArmyTypeCode.worldEaters:
                return FactionTypeCode.chaos;
            case ArmyTypeCode.aeldari:
                return FactionTypeCode.xenos;
            case ArmyTypeCode.drukhari:
                return FactionTypeCode.xenos;
            case ArmyTypeCode.genestealerCults:
                return FactionTypeCode.xenos;
            case ArmyTypeCode.leaguesOfVotann:
                return FactionTypeCode.xenos;
            case ArmyTypeCode.necrons:
                return FactionTypeCode.xenos;
            case ArmyTypeCode.orks:
                return FactionTypeCode.xenos;
            case ArmyTypeCode.tauEmpire:
                return FactionTypeCode.xenos;
            case ArmyTypeCode.tyranids:
                return FactionTypeCode.xenos;
        }
    }

    static ArmyTypeCode? fromName(String name)
    {
      try
      {
        return ArmyTypeCode.values.firstWhere((e) => e.name == name);
      } catch (_)
      {
        return null;
      }
    }

    static ArmyTypeCode? fromCode(String name)
    {
      try
      {
        return ArmyTypeCode.values.firstWhere((e) => e.code == name);
      } catch (_)
      {
        return null;
      }
    }
}

enum CodexTypeCode
{
    none,

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
    tyranids

}
extension CodexTypeCodeX on CodexTypeCode
{
    String get code
    {
        switch (this)
        {
            case CodexTypeCode.none:
                return 'none';
            case CodexTypeCode.adeptaSororitas:
                return 'adepta_sororitas';
            case CodexTypeCode.adeptusCustodes:
                return 'adeptus_custodes';
            case CodexTypeCode.adeptusMechanicus:
                return 'adeptus_mechanicus';
            case CodexTypeCode.adeptusTitanicus:
                return 'adeptus_titanicus';
            case CodexTypeCode.astraMilitarum:
                return 'astra_militarum';
            case CodexTypeCode.greyKnights:
                return 'grey_knights';
            case CodexTypeCode.imperialAgents:
                return 'imperial_agents';
            case CodexTypeCode.imperialKnights:
                return 'imperial_knights';
            case CodexTypeCode.blackTemplars:
                return 'black_templars';
            case CodexTypeCode.bloodAngels:
                return 'blood_angels';
            case CodexTypeCode.darkAngels:
                return 'dark_angels';
            case CodexTypeCode.deathWatch:
                return 'death_watch';
            case CodexTypeCode.imperialFists:
                return 'imperial_fists';
            case CodexTypeCode.ironHands:
                return 'iron_hands';
            case CodexTypeCode.ravenGuard:
                return 'raven_guard';
            case CodexTypeCode.salamanders:
                return 'salamanders';
            case CodexTypeCode.ultramarines:
                return 'ultramarines';
            case CodexTypeCode.whiteScars:
                return 'white_scars';
            case CodexTypeCode.spaceWolves:
                return 'space_wolves';
            case CodexTypeCode.chaosDaemons:
                return 'chaos_daemons';
            case CodexTypeCode.chaosKnights:
                return 'chaos_knights';
            case CodexTypeCode.chaosSpaceMarines:
                return 'chaos_space_marines';
            case CodexTypeCode.deathGuard:
                return 'death_guard';
            case CodexTypeCode.emperorsChildren:
                return 'emperors_children';
            case CodexTypeCode.thousandSons:
                return 'thousand_sons';
            case CodexTypeCode.worldEaters:
                return 'world_eaters';
            case CodexTypeCode.aeldari:
                return 'aeldari';
            case CodexTypeCode.drukhari:
                return 'drukhari';
            case CodexTypeCode.genestealerCults:
                return 'genestealer_cults';
            case CodexTypeCode.leaguesOfVotann:
                return 'leagues_of_votann';
            case CodexTypeCode.necrons:
                return 'necrons';
            case CodexTypeCode.orks:
                return 'orks';
            case CodexTypeCode.tauEmpire:
                return 'tau_empire';
            case CodexTypeCode.tyranids:
                return 'tyranids';
        }
    }

    String get title
    {
        switch (this)
        {
            case CodexTypeCode.none:
                return 'none';
            case CodexTypeCode.adeptaSororitas:
                return 'Adepta Sororitas';
            case CodexTypeCode.adeptusCustodes:
                return 'Adeptus Custodes';
            case CodexTypeCode.adeptusMechanicus:
                return 'Adeptus Mechanicus';
            case CodexTypeCode.adeptusTitanicus:
                return 'Adeptus Titanicus';
            case CodexTypeCode.astraMilitarum:
                return 'Astra Militarum';
            case CodexTypeCode.greyKnights:
                return 'Grey Knights';
            case CodexTypeCode.imperialAgents:
                return 'Imperial Agents';
            case CodexTypeCode.imperialKnights:
                return 'Imperial Knights';
            case CodexTypeCode.blackTemplars:
                return 'Black Templars';
            case CodexTypeCode.bloodAngels:
                return 'Blood Angels';
            case CodexTypeCode.darkAngels:
                return 'Dark Angels';
            case CodexTypeCode.deathWatch:
                return 'Death Watch';
            case CodexTypeCode.imperialFists:
                return 'Imperial Fists';
            case CodexTypeCode.ironHands:
                return 'Iron Hands';
            case CodexTypeCode.ravenGuard:
                return 'Raven Guard';
            case CodexTypeCode.salamanders:
                return 'Salamanders';
            case CodexTypeCode.ultramarines:
                return 'Ultramarines';
            case CodexTypeCode.whiteScars:
                return 'White Scars';
            case CodexTypeCode.spaceWolves:
                return 'Space Wolves';
            case CodexTypeCode.chaosDaemons:
                return 'Chaos Daemons';
            case CodexTypeCode.chaosKnights:
                return 'Chaos Knights';
            case CodexTypeCode.chaosSpaceMarines:
                return 'Chaos Space Marines';
            case CodexTypeCode.deathGuard:
                return 'Death Guard';
            case CodexTypeCode.emperorsChildren:
                return 'Emperors Children';
            case CodexTypeCode.thousandSons:
                return 'Thousand Sons';
            case CodexTypeCode.worldEaters:
                return 'World Eaters';
            case CodexTypeCode.aeldari:
                return 'Aeldari';
            case CodexTypeCode.drukhari:
                return 'Drukhari';
            case CodexTypeCode.genestealerCults:
                return 'Genestealer Cults';
            case CodexTypeCode.leaguesOfVotann:
                return 'Leagues of Votann';
            case CodexTypeCode.necrons:
                return 'Necrons';
            case CodexTypeCode.orks:
                return 'Orks';
            case CodexTypeCode.tauEmpire:
                return 'Tau Empire';
            case CodexTypeCode.tyranids:
                return 'Tyranids';
        }
    }

    ArmyTypeCode get army
    {
        switch (this)
        {
            case CodexTypeCode.none:
                return ArmyTypeCode.none;
            case CodexTypeCode.adeptaSororitas:
                return ArmyTypeCode.adeptaSororitas;
            case CodexTypeCode.adeptusCustodes:
                return ArmyTypeCode.adeptusCustodes;
            case CodexTypeCode.adeptusMechanicus:
                return ArmyTypeCode.adeptusMechanicus;
            case CodexTypeCode.adeptusTitanicus:
                return ArmyTypeCode.adeptusTitanicus;
            case CodexTypeCode.astraMilitarum:
                return ArmyTypeCode.astraMilitarum;
            case CodexTypeCode.greyKnights:
                return ArmyTypeCode.greyKnights;
            case CodexTypeCode.imperialAgents:
                return ArmyTypeCode.imperialAgents;
            case CodexTypeCode.imperialKnights:
                return ArmyTypeCode.imperialKnights;
            case CodexTypeCode.blackTemplars:
                return ArmyTypeCode.spaceMarines;
            case CodexTypeCode.bloodAngels:
                return ArmyTypeCode.spaceMarines;
            case CodexTypeCode.darkAngels:
                return ArmyTypeCode.spaceMarines;
            case CodexTypeCode.deathWatch:
                return ArmyTypeCode.spaceMarines;
            case CodexTypeCode.imperialFists:
                return ArmyTypeCode.spaceMarines;
            case CodexTypeCode.ironHands:
                return ArmyTypeCode.spaceMarines;
            case CodexTypeCode.ravenGuard:
                return ArmyTypeCode.spaceMarines;
            case CodexTypeCode.salamanders:
                return ArmyTypeCode.spaceMarines;
            case CodexTypeCode.ultramarines:
                return ArmyTypeCode.spaceMarines;
            case CodexTypeCode.whiteScars:
                return ArmyTypeCode.spaceMarines;
            case CodexTypeCode.spaceWolves:
                return ArmyTypeCode.spaceMarines;
            case CodexTypeCode.chaosDaemons:
                return ArmyTypeCode.chaosDaemons;
            case CodexTypeCode.chaosKnights:
                return ArmyTypeCode.chaosKnights;
            case CodexTypeCode.chaosSpaceMarines:
                return ArmyTypeCode.chaosSpaceMarines;
            case CodexTypeCode.deathGuard:
                return ArmyTypeCode.deathGuard;
            case CodexTypeCode.emperorsChildren:
                return ArmyTypeCode.emperorsChildren;
            case CodexTypeCode.thousandSons:
                return ArmyTypeCode.thousandSons;
            case CodexTypeCode.worldEaters:
                return ArmyTypeCode.worldEaters;
            case CodexTypeCode.aeldari:
                return ArmyTypeCode.aeldari;
            case CodexTypeCode.drukhari:
                return ArmyTypeCode.drukhari;
            case CodexTypeCode.genestealerCults:
                return ArmyTypeCode.genestealerCults;
            case CodexTypeCode.leaguesOfVotann:
                return ArmyTypeCode.leaguesOfVotann;
            case CodexTypeCode.necrons:
                return ArmyTypeCode.necrons;
            case CodexTypeCode.orks:
                return ArmyTypeCode.orks;
            case CodexTypeCode.tauEmpire:
                return ArmyTypeCode.tauEmpire;
            case CodexTypeCode.tyranids:
                return ArmyTypeCode.tyranids;
        }
    }
}

enum UnitRoleCode
{
    characters,
    battleline,
    dedicatedTransports,
    fortifications,
    other
}
extension UnitRoleCodeX on UnitRoleCode
{
    String get code => name;

    String get SnakeName
    {
        switch (this)
        {
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

    String get title
    {
        switch (this)
        {
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

    static UnitRoleCode? fromTitle(String title)
    {
        try
        {
            return UnitRoleCode.values.firstWhere((e) => e.title == title);
        } catch (_)
        {
            return null; // Если это не титул, вернет null
        }
    }

    static UnitRoleCode? fromName(String name)
    {
        try
        {
            return UnitRoleCode.values.firstWhere((e) => e.name == name);
        } catch (_)
        {
            return null;
        }
    }
}

enum WeaponAbilitiesCode
{
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
    anti
}

extension WeaponAbilitiesCodeX on WeaponAbilitiesCode
{
    String get code => name;

    String get SnakeName
    {
        switch (this)
        {
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

    String get title
    {
        switch (this)
        {
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

enum  FactionUnitAbilityCode
{
    none,
    oathOfMoment

}

extension  FactionUnitAbilityCodeX on FactionUnitAbilityCode
{
    String get code => name;

    String get SnakeName
    {
        switch (this)
        {
            case FactionUnitAbilityCode.none: return 'none';
            case FactionUnitAbilityCode.oathOfMoment: return 'oath_of_moment';

        }
    }

    String get title
    {
        switch (this)
        {
            case FactionUnitAbilityCode.none: return 'none';
            case FactionUnitAbilityCode.oathOfMoment: return 'Oath of Moment';
        }
    }

    static FactionUnitAbilityCode? fromName(String name)
    {
        try
        {
            return FactionUnitAbilityCode.values.firstWhere((e) => e.name == name);
        } catch (_)
        {
            return null; // Если это не титул, вернет null
        }
    }
}

enum CoreUnitAbilityCode
{
    none,
    leader,
    deepStrike,
    scouts,
    infiltrators
}

extension CoreUnitAbilityCodeX on CoreUnitAbilityCode
{
    String get code => name;

    String get SnakeName
    {
        switch (this)
        {
            case CoreUnitAbilityCode.none: return 'none';
            case CoreUnitAbilityCode.leader: return 'leader';
            case CoreUnitAbilityCode.deepStrike: return 'deep_strike';
            case CoreUnitAbilityCode.scouts: return 'scouts';
            case CoreUnitAbilityCode.infiltrators: return 'infiltrators';

        }
    }

    String get title
    {
        switch (this)
        {
            case CoreUnitAbilityCode.none: return 'none';
            case CoreUnitAbilityCode.leader: return 'Leader';
            case CoreUnitAbilityCode.deepStrike: return 'Deep Strike';
            case CoreUnitAbilityCode.scouts: return 'Scouts';
            case CoreUnitAbilityCode.infiltrators: return 'Infiltrators';
        }
    }

    static CoreUnitAbilityCode? fromName(String name)
    {
        try
        {
            return CoreUnitAbilityCode.values.firstWhere((e) => e.name == name);
        } catch (_)
        {
            return null; // Если это не титул, вернет null
        }
    }
}

enum StratagemsCode
{
    none,
    eitherPlayersTurn,
    yourTurn,
    opponentsTurn
}

extension StratagemsCodeX on StratagemsCode
{
    String get code => name;

    String get SnakeName
    {
        switch (this)
        {
            case StratagemsCode.none: return 'none';
            case StratagemsCode.eitherPlayersTurn: return 'either_players_turn';
            case StratagemsCode.yourTurn: return 'your_turn';
            case StratagemsCode.opponentsTurn: return 'opponents_turn';

        }
    }

    String get title
    {
        switch (this)
        {
            case StratagemsCode.none: return 'none';
            case StratagemsCode.eitherPlayersTurn: return 'Either Player\'s Turn';
            case StratagemsCode.yourTurn: return 'Your Turn';
            case StratagemsCode.opponentsTurn: return 'Opponent\'s Turn';
        }
    }
}

enum BattleSizeCode
{
    incursion,
    strikeForce,
    onslaught
}

extension BattleSizeCodeX on BattleSizeCode
{
    String get code => name;

    String get SnakeName
    {
        switch (this)
        {
            case BattleSizeCode.incursion: return 'incursion';
            case BattleSizeCode.strikeForce: return 'strike_force';
            case BattleSizeCode.onslaught: return 'onslaught';
        }
    }

    String get title
    {
        switch (this)
        {
            case BattleSizeCode.incursion:
                return 'Incursion';
            case BattleSizeCode.strikeForce:
                return 'Strike Force';
            case BattleSizeCode.onslaught:
                return 'Onslaught';
        }
    }

    static BattleSizeCode? fromTitle(String title)
    {
        try
        {
            return BattleSizeCode.values.firstWhere((e) => e.title == title);
        } catch (_)
        {
            return null; // Если это не титул, вернет null
        }
    }

    static BattleSizeCode? fromName(String name)
    {
        try
        {
            return BattleSizeCode.values.firstWhere((e) => e.name == name);
        } catch (_)
        {
            return null; // Если это не титул, вернет null
        }
    }
}

// ==========================================
// OBJECTS CLASS
// ==========================================

class FactionSeed
{
    final FactionTypeCode code;
    final FactionName name;

    const FactionSeed({
        required this.code,
        required this.name
    });

    String get title => name.value;
}

class CodexSeed
{
    final CodexTypeCode code;
    final ArmyTypeCode army;

    const CodexSeed({
        required this.code,
        required this.army
    });

    String get name => code.title;
}

class ArmySeed
{
    final ArmyTypeCode armyCode;
    final String armyName;
    final FactionCode factionCode;

    const ArmySeed({
        required this.armyCode,
        required this.armyName,
        required this.factionCode
    });
}

class UnitSeed
{
    // ID теперь необязателен. Если null, будет сгенерирован при вставке.
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
        required this.modelStats
    });
}

class DetachmentSeed
{

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
        required this.ruleFull
    });
}

class DetachmentCodexLinkSeed
{
    final String detachmentCode;
    final CodexTypeCode codex;
    final bool isGeneral;

    const DetachmentCodexLinkSeed({
        required this.detachmentCode,
        required this.codex,
        required this.isGeneral
    });
}

class EnhancementSeed
{
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
        this.points = 0
    });
}

class StrategemsSeed
{
    final String id;
    final StratagemsCode code;
    final String name;
    final String when;
    final String target;
    final String effect;
    final int cost;
    final String? codexId; // codex code
    final String? detachmentId;  // detachment code

    const StrategemsSeed({
        required this.id,
        required this.code,
        required this.name,
        required this.when,
        required this.target,
        required this.effect,
        required this.cost,
        this.codexId,
        this.detachmentId
    });
}

class WeaponAbilitySeed
{

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
        required this.description
    });
}

class UnitAbilitySeed
{
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
        required this.description
    });
}

class CoreUnitAbilitySeed
{
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
        required this.description
    });
}

class FactionUnitAbilitySeed
{
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
        required this.description
    });
}

class BattleSize
{
    final Map<BattleSizeCode, int> battleSize;
    final BattleSizeCode? selected;

    const BattleSize({
        required this.battleSize,
        this.selected
    });

    factory BattleSize.base()
    {
        return const BattleSize(
            battleSize:
            {
                BattleSizeCode.incursion: 1000,
                BattleSizeCode.strikeForce: 2000,
                BattleSizeCode.onslaught: 3000
            },
            selected: null
        );
    }

    factory BattleSize.selected(BattleSizeCode selected)
    {
        return BattleSize(
            battleSize:
            {
                BattleSizeCode.incursion: 1000,
                BattleSizeCode.strikeForce: 2000,
                BattleSizeCode.onslaught: 3000
            },
            selected: selected);
    }

    int get total => battleSize[selected] ?? 0;
}


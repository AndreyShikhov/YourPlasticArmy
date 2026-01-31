/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/domain/models/faction/faction.dart';

import '../_types.dart';

List<ArmySeed> getAllArmies()
{
    return [
        // Imperium
        ArmySeed(armyCode: ArmyTypeCode.adeptaSororitas, armyName: ArmyTypeCode.adeptaSororitas.title, factionCode: FactionCode(FactionTypeCode.imperium.code)),
        ArmySeed(armyCode: ArmyTypeCode.adeptusCustodes, armyName: ArmyTypeCode.adeptusCustodes.title, factionCode: FactionCode(FactionTypeCode.imperium.code)),
        ArmySeed(armyCode: ArmyTypeCode.adeptusMechanicus, armyName: ArmyTypeCode.adeptusMechanicus.title, factionCode: FactionCode(FactionTypeCode.imperium.code)),
        ArmySeed(armyCode: ArmyTypeCode.adeptusTitanicus, armyName: ArmyTypeCode.adeptusTitanicus.title, factionCode: FactionCode(FactionTypeCode.imperium.code)),
        ArmySeed(armyCode: ArmyTypeCode.astraMilitarum, armyName: ArmyTypeCode.astraMilitarum.title, factionCode: FactionCode(FactionTypeCode.imperium.code)),
        ArmySeed(armyCode: ArmyTypeCode.greyKnights, armyName: ArmyTypeCode.greyKnights.title, factionCode: FactionCode(FactionTypeCode.imperium.code)),
        ArmySeed(armyCode: ArmyTypeCode.imperialAgents, armyName: ArmyTypeCode.imperialAgents.title, factionCode: FactionCode(FactionTypeCode.imperium.code)),
        ArmySeed(armyCode: ArmyTypeCode.imperialKnights, armyName: ArmyTypeCode.imperialKnights.title, factionCode: FactionCode(FactionTypeCode.imperium.code)),
        ArmySeed(armyCode: ArmyTypeCode.spaceMarines, armyName: ArmyTypeCode.spaceMarines.title, factionCode: FactionCode(FactionTypeCode.imperium.code)),

        // Chaos
        ArmySeed(armyCode: ArmyTypeCode.chaosDaemons, armyName: ArmyTypeCode.chaosDaemons.title, factionCode: FactionCode(FactionTypeCode.chaos.code)),
        ArmySeed(armyCode: ArmyTypeCode.chaosKnights, armyName: ArmyTypeCode.chaosKnights.title, factionCode: FactionCode(FactionTypeCode.chaos.code)),
        ArmySeed(armyCode: ArmyTypeCode.chaosSpaceMarines, armyName: ArmyTypeCode.chaosSpaceMarines.title, factionCode: FactionCode(FactionTypeCode.chaos.code)),
        ArmySeed(armyCode: ArmyTypeCode.deathGuard, armyName: ArmyTypeCode.deathGuard.title, factionCode: FactionCode(FactionTypeCode.chaos.code)),
        ArmySeed(armyCode: ArmyTypeCode.emperorsChildren, armyName: ArmyTypeCode.emperorsChildren.title, factionCode: FactionCode(FactionTypeCode.chaos.code)),
        ArmySeed(armyCode: ArmyTypeCode.thousandSons, armyName: ArmyTypeCode.thousandSons.title, factionCode: FactionCode(FactionTypeCode.chaos.code)),
        ArmySeed(armyCode: ArmyTypeCode.worldEaters, armyName: ArmyTypeCode.worldEaters.title, factionCode: FactionCode(FactionTypeCode.chaos.code)),

        // Xenos
        ArmySeed(armyCode: ArmyTypeCode.aeldari, armyName: ArmyTypeCode.aeldari.title, factionCode: FactionCode(FactionTypeCode.xenos.code)),
        ArmySeed(armyCode: ArmyTypeCode.drukhari, armyName: ArmyTypeCode.drukhari.title, factionCode: FactionCode(FactionTypeCode.xenos.code)),
        ArmySeed(armyCode: ArmyTypeCode.genestealerCults, armyName: ArmyTypeCode.genestealerCults.title, factionCode: FactionCode(FactionTypeCode.xenos.code)),
        ArmySeed(armyCode: ArmyTypeCode.leaguesOfVotann, armyName: ArmyTypeCode.leaguesOfVotann.title, factionCode: FactionCode(FactionTypeCode.xenos.code)),
        ArmySeed(armyCode: ArmyTypeCode.necrons, armyName: ArmyTypeCode.necrons.title, factionCode: FactionCode(FactionTypeCode.xenos.code)),
        ArmySeed(armyCode: ArmyTypeCode.orks, armyName: ArmyTypeCode.orks.title, factionCode: FactionCode(FactionTypeCode.xenos.code)),
        ArmySeed(armyCode: ArmyTypeCode.tauEmpire, armyName: ArmyTypeCode.tauEmpire.title, factionCode: FactionCode(FactionTypeCode.xenos.code)),
        ArmySeed(armyCode: ArmyTypeCode.tyranids, armyName: ArmyTypeCode.tyranids.title, factionCode: FactionCode(FactionTypeCode.xenos.code))
    ];
}


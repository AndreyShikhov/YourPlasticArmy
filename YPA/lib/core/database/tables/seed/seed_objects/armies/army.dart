import 'package:ypa/domain/models/faction/faction.dart';

import '../_types.dart';

List<ArmySeed> getAllArmies() {
  return [
    // Imperium
    ArmySeed(armyCode: ArmyCode.adeptaSororitas, armyName: ArmyCode.adeptaSororitas.title, factionCode: FactionCode(FactionTypeCode.imperium.code)),
    ArmySeed(armyCode: ArmyCode.adeptusCustodes, armyName: ArmyCode.adeptusCustodes.title,factionCode: FactionCode(FactionTypeCode.imperium.code)),
    ArmySeed(armyCode: ArmyCode.adeptusMechanicus, armyName: ArmyCode.adeptusMechanicus.title,factionCode: FactionCode(FactionTypeCode.imperium.code)),
    ArmySeed(armyCode: ArmyCode.adeptusTitanicus, armyName: ArmyCode.adeptusTitanicus.title, factionCode:FactionCode(FactionTypeCode.imperium.code)),
    ArmySeed(armyCode: ArmyCode.astraMilitarum, armyName: ArmyCode.astraMilitarum.title, factionCode: FactionCode(FactionTypeCode.imperium.code)),
    ArmySeed(armyCode: ArmyCode.greyKnights, armyName: ArmyCode.greyKnights.title, factionCode: FactionCode(FactionTypeCode.imperium.code)),
    ArmySeed(armyCode: ArmyCode.imperialAgents, armyName: ArmyCode.imperialAgents.title, factionCode: FactionCode(FactionTypeCode.imperium.code)),
    ArmySeed(armyCode: ArmyCode.imperialKnights, armyName: ArmyCode.imperialKnights.title, factionCode: FactionCode(FactionTypeCode.imperium.code)),
    ArmySeed(armyCode: ArmyCode.spaceMarines, armyName: ArmyCode.spaceMarines.title, factionCode: FactionCode(FactionTypeCode.imperium.code)),

    // Chaos
    ArmySeed(armyCode: ArmyCode.chaosDaemons, armyName: ArmyCode.chaosDaemons.title, factionCode: FactionCode(FactionTypeCode.chaos.code)),
    ArmySeed(armyCode: ArmyCode.chaosKnights, armyName: ArmyCode.chaosKnights.title, factionCode: FactionCode(FactionTypeCode.chaos.code)),
    ArmySeed(armyCode: ArmyCode.chaosSpaceMarines, armyName: ArmyCode.chaosSpaceMarines.title, factionCode: FactionCode(FactionTypeCode.chaos.code)),
    ArmySeed(armyCode: ArmyCode.deathGuard, armyName: ArmyCode.deathGuard.title, factionCode: FactionCode(FactionTypeCode.chaos.code)),
    ArmySeed(armyCode: ArmyCode.emperorsChildren, armyName: ArmyCode.emperorsChildren.title, factionCode: FactionCode(FactionTypeCode.chaos.code)),
    ArmySeed(armyCode: ArmyCode.thousandSons, armyName: ArmyCode.thousandSons.title, factionCode: FactionCode(FactionTypeCode.chaos.code)),
    ArmySeed(armyCode: ArmyCode.worldEaters, armyName: ArmyCode.worldEaters.title, factionCode: FactionCode(FactionTypeCode.chaos.code)),

    // Xenos
    ArmySeed(armyCode: ArmyCode.aeldari, armyName: ArmyCode.aeldari.title, factionCode: FactionCode(FactionTypeCode.xenos.code)),
    ArmySeed(armyCode: ArmyCode.drukhari, armyName: ArmyCode.drukhari.title, factionCode: FactionCode(FactionTypeCode.xenos.code)),
    ArmySeed(armyCode: ArmyCode.genestealerCults, armyName: ArmyCode.genestealerCults.title, factionCode: FactionCode(FactionTypeCode.xenos.code)),
    ArmySeed(armyCode: ArmyCode.leaguesOfVotann, armyName: ArmyCode.leaguesOfVotann.title, factionCode: FactionCode(FactionTypeCode.xenos.code)),
    ArmySeed(armyCode: ArmyCode.necrons, armyName: ArmyCode.necrons.title, factionCode: FactionCode(FactionTypeCode.xenos.code)),
    ArmySeed(armyCode: ArmyCode.orks, armyName: ArmyCode.orks.title, factionCode: FactionCode(FactionTypeCode.xenos.code)),
    ArmySeed(armyCode: ArmyCode.tauEmpire, armyName: ArmyCode.tauEmpire.title, factionCode: FactionCode(FactionTypeCode.xenos.code)),
    ArmySeed(armyCode: ArmyCode.tyranids, armyName: ArmyCode.tyranids.title, factionCode:FactionCode(FactionTypeCode.xenos.code)),
  ];
}

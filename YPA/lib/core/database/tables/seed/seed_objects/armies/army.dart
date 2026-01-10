import 'package:ypa/domain/models/faction/faction_code.dart';

import '../_types.dart';



List<ArmySeed> getAllArmies() {
  return
  [
    
    ArmySeed(
        armyCode: ArmyCode.adeptaSororitas, 
        armyName: ArmyCodeX(ArmyCode.adeptaSororitas).title, 
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.imperium).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.adeptusCustodes,
        armyName: ArmyCodeX(ArmyCode.adeptusCustodes).title,
        factionCode:FactionCode(FactionTypeCodeX(FactionTypeCode.imperium).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.adeptusMechanicus,
        armyName: ArmyCodeX(ArmyCode.adeptusMechanicus).title,
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.imperium).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.astraMilitarum,
        armyName: ArmyCodeX(ArmyCode.astraMilitarum).title,
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.imperium).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.greyKnights,
        armyName: ArmyCodeX(ArmyCode.greyKnights).title,
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.imperium).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.imperialKnights,
        armyName: ArmyCodeX(ArmyCode.imperialKnights).title,
        factionCode:FactionCode(FactionTypeCodeX(FactionTypeCode.imperium).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.spaceMarines,
        armyName: ArmyCodeX(ArmyCode.spaceMarines).title,
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.imperium).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.chaosDaemons,
        armyName: ArmyCodeX(ArmyCode.chaosDaemons).title,
        factionCode:FactionCode(FactionTypeCodeX(FactionTypeCode.chaos).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.chaosKnights,
        armyName: ArmyCodeX(ArmyCode.chaosKnights).title,
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.chaos).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.chaosSpaceMarines,
        armyName: ArmyCodeX(ArmyCode.chaosSpaceMarines).title,
        factionCode:FactionCode(FactionTypeCodeX(FactionTypeCode.chaos).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.deathGuard,
        armyName: ArmyCodeX(ArmyCode.deathGuard).title,
        factionCode:FactionCode(FactionTypeCodeX(FactionTypeCode.chaos).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.emperorsChildren,
        armyName: ArmyCodeX(ArmyCode.emperorsChildren).title,
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.chaos).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.thousandSons,
        armyName: ArmyCodeX(ArmyCode.thousandSons).title,
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.chaos).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.worldEaters,
        armyName: ArmyCodeX(ArmyCode.worldEaters).title,
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.chaos).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.aeldari,
        armyName: ArmyCodeX(ArmyCode.aeldari).title,
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.xenos).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.drukhari,
        armyName: ArmyCodeX(ArmyCode.drukhari).title,
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.xenos).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.genestealerCults,
        armyName: ArmyCodeX(ArmyCode.genestealerCults).title,
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.xenos).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.leaguesOfVotann,
        armyName: ArmyCodeX(ArmyCode.leaguesOfVotann).title,
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.xenos).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.necrons,
        armyName: ArmyCodeX(ArmyCode.necrons).title,
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.xenos).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.orks,
        armyName: ArmyCodeX(ArmyCode.orks).title,
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.xenos).title)
    ),
    ArmySeed(
        armyCode: ArmyCode.tauEmpire,
        armyName: ArmyCodeX(ArmyCode.tauEmpire).title,
        factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.xenos).title)
    ), ArmySeed(
      armyCode: ArmyCode.tyranids,
      armyName: ArmyCodeX(ArmyCode.tyranids).title,
      factionCode: FactionCode(FactionTypeCodeX(FactionTypeCode.xenos).title)
  ),
  ];
}

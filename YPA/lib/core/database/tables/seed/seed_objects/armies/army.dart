import '../_types.dart';



List<ArmySeed> getAllArmies() {
  return
  [
    ArmySeed(
        armyCode: ArmyCode.spaceMarines,
        armyName: ArmyCodeX(ArmyCode.spaceMarines).title,
        factionCode: FactionCode.imperium),
  ];
}
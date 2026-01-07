import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';

List<UnitAbilitySeed> allUnitAbilities() {
  return [
    UnitAbilitySeed(
      code: UnitAbilitiesCodeX(UnitAbilitiesCode.deepStrike).SnakeName,
      name: UnitAbilitiesCodeX(UnitAbilitiesCode.deepStrike).title,
      shortDescription: 'Reserve deployment',
      description: 'During the Declare Battle Formations step, you can set this unit up in Reserves instead of on the battlefield. In the Reinforcements step of one of your Movement phases, you can set this unit up anywhere on the battlefield that is more than 9" horizontally away from all enemy models.',
    ),
    UnitAbilitySeed(
      code: UnitAbilitiesCodeX(UnitAbilitiesCode.deadlyDemise).SnakeName,
      name: UnitAbilitiesCodeX(UnitAbilitiesCode.deadlyDemise).title,
      shortDescription: 'Explodes on death',
      description: 'When this model is destroyed, roll one D6. On a 6, each unit within 6" suffers D3 mortal wounds (or a specific value stated like Deadly Demise D3).',
    ),
    UnitAbilitySeed(
      code: UnitAbilitiesCodeX(UnitAbilitiesCode.fightsFirst).SnakeName,
      name: UnitAbilitiesCodeX(UnitAbilitiesCode.fightsFirst).title,
      shortDescription: 'Strike first in combat',
      description: 'Units with this ability that are eligible to fight do so in the Fights First step, before those without this ability.',
    ),
    UnitAbilitySeed(
      code: UnitAbilitiesCodeX(UnitAbilitiesCode.firingDeck).SnakeName,
      name: UnitAbilitiesCodeX(UnitAbilitiesCode.firingDeck).title,
      shortDescription: 'Passengers can shoot',
      description: 'Each time such a model is selected to shoot in the Shooting phase, you can select up to ‘x’ models embarked within it. Then, for each of those embarked models, you can select one ranged weapon that embarked model is equipped with. Until that Transport model has resolved all of its attacks, it counts as being equipped with all of the weapons you selected in this way, in addition to its other weapons.',
    ),
    UnitAbilitySeed(
      code: UnitAbilitiesCodeX(UnitAbilitiesCode.hover).SnakeName,
      name: UnitAbilitiesCodeX(UnitAbilitiesCode.hover).title,
      shortDescription: 'Lose Aircraft rules',
      description: 'If a model with this ability starts the battle in Hover mode, its Move characteristic is reduced to 20", it loses the Aircraft keyword and all associated rules.',
    ),
    UnitAbilitySeed(
      code: UnitAbilitiesCodeX(UnitAbilitiesCode.infiltrators).SnakeName,
      name: UnitAbilitiesCodeX(UnitAbilitiesCode.infiltrators).title,
      shortDescription: 'Deploy anywhere >9"',
      description: 'During deployment, you can set this unit up anywhere on the battlefield that is more than 9" horizontally away from the enemy deployment zone and all enemy models.',
    ),
    UnitAbilitySeed(
      code: UnitAbilitiesCodeX(UnitAbilitiesCode.leader).SnakeName,
      name: UnitAbilitiesCodeX(UnitAbilitiesCode.leader).title,
      shortDescription: 'Attach to Bodyguards',
      description: 'During the Declare Battle Formations step, for each Leader in your army, you can select one of that Leader’s Attached Units to attach it to.',
    ),
    UnitAbilitySeed(
      code: UnitAbilitiesCodeX(UnitAbilitiesCode.loneOperative).SnakeName,
      name: UnitAbilitiesCodeX(UnitAbilitiesCode.loneOperative).title,
      shortDescription: 'Can\'t be shot >12"',
      description: 'Unless part of an Attached Unit, this unit can only be selected as the target of a ranged attack if the attacking model is within 12".',
    ),
    UnitAbilitySeed(
      code: UnitAbilitiesCodeX(UnitAbilitiesCode.scouts).SnakeName,
      name: UnitAbilitiesCodeX(UnitAbilitiesCode.scouts).title,
      shortDescription: 'Pre-game move',
      description: 'At the start of the first battle round, before the first turn begins, this unit can make a Normal move of up to x".',
    ),
    UnitAbilitySeed(
      code: UnitAbilitiesCodeX(UnitAbilitiesCode.stealth).SnakeName,
      name: UnitAbilitiesCodeX(UnitAbilitiesCode.stealth).title,
      shortDescription: '-1 to Hit',
      description: 'If every model in a unit has this ability, then each time a ranged attack is made against it, subtract 1 from that attack’s Hit roll.',
    ),
    UnitAbilitySeed(
      code: UnitAbilitiesCodeX(UnitAbilitiesCode.transport).SnakeName,
      name: UnitAbilitiesCodeX(UnitAbilitiesCode.transport).title,
      shortDescription: 'Carries models',
      description: 'This model has a transport capacity and can embark models.',
    ),
  ];
}

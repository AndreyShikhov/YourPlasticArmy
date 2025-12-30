import 'package:ypa/domain/models/army/army_id.dart';

import '../detachment/create_detachment.dart';

class DetachmentSeedData {
  final String name;
  final int armyId;
  final String dtCode;
  final String dtDescription;
  final String dtRuleName;
  final String dtRuleShort;
  final String dtRuleFull;

  const DetachmentSeedData(
      this.name,
      this.armyId,
      this.dtCode,
      this.dtDescription,
      this.dtRuleName,
      this.dtRuleShort,
      this.dtRuleFull
  );

}

const detachmentSeeds = [

  DetachmentSeedData(
    'Vanguard Detachment',
    1,
    'VD',
    'Vanguard Detachment',
    'Vanguard',
    'VD',
    'Vanguard Detachment Rule',
  ),
  DetachmentSeedData(
    'Anvil Siege Force',
    2,
    'ASF',
    'Anvil Siege Force',
    'Anvil',
    'ASF',
    'Anvil Siege Force Rule',
  ),

  DetachmentSeedData(
    'Rapid Assault',
    3,
    'RA',
    'Rapid Assault',
    'Rapid',
    'RA',
    'Rapid Assault Rule',
  ),

];

class SeedDetachments {
  final CreateDetachment createDetachment;

  SeedDetachments(this.createDetachment);

  Future<void> run() async {
    for (final seed in detachmentSeeds) {

      await createDetachment(
        name: seed.name,
        armyId: ArmyId.fromInt(seed.armyId),
        dtCode: seed.dtCode,
        dtDescription: seed.dtDescription,
        dtRuleName: seed.dtRuleName,
        dtRuleShort:seed.dtRuleShort,
        dtRuleFull: seed.dtRuleFull,
      );
    }
  }
}

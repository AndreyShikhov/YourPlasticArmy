import 'package:ypa/domain/models/army/army_id.dart';

import '../detachment/create_detachment.dart';

class DetachmentSeedData {
  final String name;
  final int armyId;

  const DetachmentSeedData(this.name, this.armyId);
}

const detachmentSeeds = [

  DetachmentSeedData('Vanguard Detachment', 1),
  DetachmentSeedData('Anvil Siege Force', 1),
  DetachmentSeedData('Rapid Assault', 1),
];

class SeedDetachments {
  final CreateDetachment createDetachment;

  SeedDetachments(this.createDetachment);

  Future<void> run() async {
    for (final seed in detachmentSeeds) {
      await createDetachment(
          name: seed.name,
          armyId: ArmyId.fromInt(seed.armyId) ,
      );
    }
  }
}

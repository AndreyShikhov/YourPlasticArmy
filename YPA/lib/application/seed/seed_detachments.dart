import '../detachment/create_detachment.dart';

class DetachmentSeedData {
  final String name;

  const DetachmentSeedData(this.name);
}

const detachmentSeeds = [
  DetachmentSeedData('Vanguard Detachment'),
  DetachmentSeedData('Anvil Siege Force'),
  DetachmentSeedData('Rapid Assault'),
];

class SeedDetachments {
  final CreateDetachment createDetachment;

  SeedDetachments(this.createDetachment);

  Future<void> run() async {
    for (final seed in detachmentSeeds) {
      await createDetachment(name: seed.name);
    }
  }
}

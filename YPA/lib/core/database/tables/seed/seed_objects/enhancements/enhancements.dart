import '../_types.dart';


List<EnhancementSeed> enhancementSeed() {
  return const[
    EnhancementSeed(
        code: 'MASTER_OF_WAR',
        name: 'Master of War',
        description:
            'Once per battle, this model can use a Strategic Ploy Stratagem '
            'for 0CP, even if another unit has already used it this phase.',
        detachmentCode: 'GLADIUS_TASK_FORCE',
      points:  15,
    ),
    EnhancementSeed(
      code: 'ADEPT_OF_THE_CODEX',
      name: 'Adept of the Codex',
      description:
      'Each time you gain a Command point, on a 5+ you gain one additional CP.',
      detachmentCode: 'GLADIUS_TASK_FORCE',
      points:  20,
    ),
  ];
}
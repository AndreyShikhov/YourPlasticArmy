/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../_types.dart';

List<EnhancementSeed> enhancementSeed()
{
    return const[
      /// ---------space marine-------------
        EnhancementSeed(
            code: 'artificer_armour',
            name: 'Artificer Armour',
            description:
            'ADEPTUS ASTARTES model only. The bearer has a Save characteristic of 2+ and the Feel No Pain 5+ ability',
            detachmentCode: 'gladius_task_force',
            points: 10
        ),
        EnhancementSeed(
            code: 'yhe_honour_vehement',
            name: 'The Honour Vehement',
            description:
            'ADEPTUS ASTARTES model only. Add 1 to the Attacks and Strength characteristics of the bearer’s melee weapons. While the bearer is under the effects of the Assault Doctrine, add 2 to the Attacks and Strength characteristics of the bearers melee weapons instead.',
            detachmentCode: 'gladius_task_force',
            points: 15
        ),
        EnhancementSeed(
            code: 'adept_of_the_codex',
            name: 'Adept of the Codex',
            description:
            'CAPTAIN model only. At the start of your Command phase, if the bearer is on the battlefield, instead of selecting a Combat Doctrine to be active for your army, you can select the Tactical Doctrine. If you do, until the start of your next Command phase, that Combat Doctrine is active for the bearer’s unit only, even if you have already selected that Combat Doctrine to be active for your army this battle.',
            detachmentCode: 'gladius_task_force',
            points: 20
        ),
      EnhancementSeed(
            code: 'fire_discipline',
            name: 'Fire Discipline',
            description:
            'ADEPTUS ASTARTES model only. While the bearer is leading a unit, ranged weapons equipped by models in that unit have the [SUSTAINED HITS 1] ability. In addition, while the bearer’s unit is under the effects of the Devastator Doctrine, you can reroll Advance rolls made for that unit.',
            detachmentCode: 'gladius_task_force',
            points: 25
        ),

      EnhancementSeed(
          code: 'fire_discipline',
          name: 'Fire Discipline',
          description:
          'ADEPTUS ASTARTES model only. While the bearer is leading a unit, ranged weapons equipped by models in that unit have the [SUSTAINED HITS 1] ability. In addition, while the bearer’s unit is under the effects of the Devastator Doctrine, you can reroll Advance rolls made for that unit.',
          detachmentCode: 'gladius_task_force',
          points: 25
      ),

      /// ---------space marine blood angels-------------
      EnhancementSeed(
          code: 'artisan_of_war',
          name: 'Artisan of War',
          description:
          'ADEPTUS ASTARTES JUMP PACK model only. Improve the Armour Penetration characteristic of the bearers weapons by 1, and the bearer has a Save characteristic of 2+.',
          detachmentCode: 'the_angelic_host',
          points: 20
      ),
      EnhancementSeed(
          code: 'visage_of_death',
          name: 'Visage of Death',
          description:
          'ADEPTUS ASTARTES JUMP PACK model only. In the Battle-shock step of your opponents Command phase, each enemy unit (excluding MONSTERS and VEHICLES) within Engagement Range of the bearer must take a Battle-shock test.',
          detachmentCode: 'the_angelic_host',
          points: 15
      ),
      EnhancementSeed(
          code: 'archangels_shard',
          name: 'Archangel’s Shard',
          description:
          'ADEPTUS ASTARTES JUMP PACK model only. The bearer’s melee weapons have the [Anti-Chaos 5+] and [Lance] abilities.',
          detachmentCode: 'the_angelic_host',
          points: 15
      ),
      EnhancementSeed(
          code: 'gleaming_pinions',
          name: 'Gleaming Pinions',
          description:
          'ADEPTUS ASTARTES JUMP PACK model only. Once per turn, when an enemy unit ends a Normal, Advance or Fall Back move within 9" of the bearer, if this bearer’s unit is not within Engagement Range of one or more enemy units, it can make a Normal move of up to 6' ,
          detachmentCode: 'the_angelic_host',
          points: 25
      ),
    ];
}

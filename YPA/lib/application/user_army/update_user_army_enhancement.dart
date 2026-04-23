/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/domain/models/enhancement/enhancement.dart';

import '../../domain/models/user_army/user_army_repository.dart';

class UpdateUserArmyEnhancement
{

    final UserArmyRepository repository;

    UpdateUserArmyEnhancement(this.repository);

    Future<void> call({
        required String armyId,
        required Map<String, EnhancementDOM> selectedEnhancement
    }) async
    {
        final army = await repository.getUserArmyById(armyId);
        if (army != null) 
        {
            return await repository.updateArmyEnhancement(armyId, selectedEnhancement);
        }
    }

}

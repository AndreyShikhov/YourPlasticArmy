/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/domain/models/user_army/user_army_repository.dart';

class UpdateUserArmyWarlord
{
    final UserArmyRepository repository;

    UpdateUserArmyWarlord(this.repository);

    Future<void> call({
        required String armyId,
        required String newWarlordInstanceId
    }) async
    {
        final army = await repository.getUserArmyById(armyId);
        if (army != null) 
        {
            await repository.updateWarlord(armyId, newWarlordInstanceId);
        }
    }
}

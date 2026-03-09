/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/domain/models/user_army/user_army_repository.dart';

class UpdateUserArmyName
{
    final UserArmyRepository repository;

    UpdateUserArmyName(this.repository);

    Future<void> call({
        required String id,
        required String newUserArmyName
    }) async
    {
        final army = await repository.getUserArmyById(id);
        if (army != null) 
        {
          repository.updateUserArmyName(id, newUserArmyName);

        }
    }
}

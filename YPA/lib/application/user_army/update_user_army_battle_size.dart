/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/domain/models/user_army/user_army_repository.dart';

import '../../../core/database/tables/seed/seed_objects/_types.dart';

class UpdateUserArmyBattleSize
{
    final UserArmyRepository repository;

    UpdateUserArmyBattleSize(this.repository);

    Future<void> call({
        required String id,
        required BattleSizeCode newSize
    }) async
    {
        await repository.updateBattleSize(id, newSize);
    }
}

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
        required String id,
        required String newWarlordInstanceId
    }) async
    {
        await repository.updateWarlord(id, newWarlordInstanceId);
    }
}

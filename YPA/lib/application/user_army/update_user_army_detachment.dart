/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/domain/models/detachment/detachment.dart';

import '../../domain/models/user_army/user_army_repository.dart';

class UpdateUserArmyDetachment
{
    final UserArmyRepository repository;

    UpdateUserArmyDetachment(this.repository);

    Future<void> call({
        required String id,
        required DetachmentDOM newDetachment
    }) async
    {
        final army = await repository.getUserArmyById(id);
        if (army != null)
        {
            repository.updateUserArmyDetachment(id, newDetachment, newDetachment.id.value);
        }
    }
}

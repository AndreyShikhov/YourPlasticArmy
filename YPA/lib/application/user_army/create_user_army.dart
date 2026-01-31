/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:uuid/uuid.dart';
import 'package:ypa/domain/models/codex/codex_id.dart';
import 'package:ypa/domain/models/user_army/user_army_dom.dart';
import 'package:ypa/domain/models/user_army/user_army_repository.dart';

import '../../core/database/tables/seed/seed_objects/_types.dart';
import '../../domain/models/army/army_id.dart';
import '../../domain/models/faction/faction.dart';

class CreateUserArmy
{
    final UserArmyRepository repository;

    CreateUserArmy(this.repository);

    Future<void> call({
        required String userArmyName,
        required FactionId factionId,
        required ArmyId armyId,
        required CodexId codexId
    }) async
    {
        final newUserArmy = UserArmyDOM(
            id: const Uuid().v4(),
            userArmyName: userArmyName,
            factionId: factionId,
            armyId: armyId,
            codexId: codexId,
            selectedBattleSize: BattleSize.base(),
            jsonData: '{"version": 1, "units": []}',
            createdAt: DateTime.now()
        );

        await repository.saveUserArmy(newUserArmy);
    }
}

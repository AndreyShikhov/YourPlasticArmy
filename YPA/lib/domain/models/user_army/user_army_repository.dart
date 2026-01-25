/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../../core/database/tables/seed/seed_objects/_types.dart';
import 'user_army_dom.dart';

abstract class UserArmyRepository
{
    Future<List<UserArmyDOM>> findAll();
    Future<List<Map<UserArmyDOM, String>>> findAllWithCodexNames();
    Future<UserArmyDOM?> findUserArmyById(String id);
    Future<void> saveUserArmy(UserArmyDOM userArmy);
    Future<void> deleteUserArmy(String id);
    Future<void> addUnitToUserArmy(UserArmyDOM userArmy);
    Future<void> removeLastUnitFromUserArmy(String armyId, UnitRoleCode role, String unitId);

    Future<void> updateBattleSize(String armyId, BattleSizeCode newSize);
}

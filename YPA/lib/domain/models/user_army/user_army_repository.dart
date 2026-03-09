/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/domain/models/detachment/detachment.dart';

import '../../../core/database/tables/seed/seed_objects/_types.dart';
import 'user_army_dom.dart';

abstract class UserArmyRepository
{
    Future<List<UserArmyDOM>> getAllUserArmy();
    Future<List<Map<UserArmyDOM,  (String, String?)>>> getAllUserArmyWithCodexNames();
    Future<UserArmyDOM?> getUserArmyById(String id);
    Future<void> saveUserArmy(UserArmyDOM userArmy);
    Future<void> deleteUserArmy(String id);
    Future<void> addUnitToUserArmy(UserArmyDOM userArmy);
    Future<void> dublecateUnitToUserArmy(String armyId, String instanceId, UnitRoleCode role);
    Future<void> removeLastUnitFromUserArmy(String armyId, UnitRoleCode role, String unitId);
    Future<void> updateUnitInstanceFromUserArmy(String armyId, String instanceId, UnitRoleCode role, SaveCategoryCode category, dynamic updateData);

    Future<void> updateUserArmyName(String armyId, String newUserArmyName);
    Future<void> updateBattleSize(String armyId, BattleSizeCode newSize);
    Future<void> updateUserArmyDetachment(String armyId, DetachmentDOM newDetachment, String newDetachmentId);
    Future<void> updateWarlord(String armyId, String newInstanceIdWarlord);

}

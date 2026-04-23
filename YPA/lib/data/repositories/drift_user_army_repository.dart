/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:drift/drift.dart';
import 'package:ypa/core/database/app_database.dart';
import 'package:ypa/data/mappers/user_army_mapper.dart';
import 'package:ypa/domain/models/enhancement/enhancement_dom.dart';

import '../../../core/database/tables/seed/seed_objects/_types.dart';
import '../../domain/models/detachment/detachment.dart';
import '../../domain/models/user_army/user_army.dart';

class DriftUserArmyRepository implements UserArmyRepository
{
    final AppDatabase db;

    DriftUserArmyRepository(this.db);

    // Вспомогательный метод для атомарного обновления jsonData
    Future<void> _updateJsonData(String armyId, String jsonData) async
    {
        await (db.update(db.userArmies)..where((t) => t.id.equals(armyId))).write(
            UserArmiesCompanion(jsonData: Value(jsonData))
        );
    }

    @override
    Future<List<UserArmyDOM>> getAllUserArmy() async
    {
        final rows = await db.select(db.userArmies).get();
        return rows.map((row) => UserArmyMapper.fromRow(row)).toList();
    }

    @override
    Future<List<Map<UserArmyDOM,  (String, String?)>>> getAllUserArmyWithCodexNames() async
    {
        final query = db.select(db.userArmies).join([
                innerJoin(db.codexes, db.codexes.id.equalsExp(db.userArmies.codexId)),
                leftOuterJoin(db.detachments, db.detachments.id.equalsExp(db.userArmies.detachmentId))
            ]);

        final rows = await query.get();
        return rows.map((row)
            {
                final userArmyRow = row.readTable(db.userArmies);
                final codexRow = row.readTable(db.codexes);
                final detachmentRow = row.readTableOrNull(db.detachments);

                return
                {
                    UserArmyMapper.fromRow(userArmyRow): (codexRow.name, detachmentRow?.name)
                };
            }).toList();
    }

    @override
    Future<UserArmyDOM?> getUserArmyById(String id) async
    {
        final query = db.select(db.userArmies)..where((t) => t.id.equals(id));
        final row = await query.getSingleOrNull();
        return row != null ? UserArmyMapper.fromRow(row) : null;
    }

    @override
    Future<void> saveUserArmy(UserArmyDOM userArmy) async
    {
        // Используется при первом создании или полной перезаписи. 
        // Твой маппер теперь застрахован, но атомарные методы ниже еще надежнее.
        await db.into(db.userArmies).insertOnConflictUpdate(UserArmyMapper.toCompanion(userArmy));
    }

    @override
    Future<void> deleteUserArmy(String id) async
    {
        await (db.delete(db.userArmies)..where((t) => t.id.equals(id))).go();
    }

    @override
    Future<void> addUnitToUserArmy(UserArmyDOM userArmy) async
    {
        // Обновляем ТОЛЬКО jsonData, чтобы не задеть detachmentId
        await _updateJsonData(userArmy.id, userArmy.jsonData);
    }

    @override
    Future<void> removeLastUnitFromUserArmy(String armyId, UnitRoleCode role, String unitId) async
    {
        final army = await getUserArmyById(armyId);
        if (army != null)
        {
            final updatedArmy = await army.removeLastUnitFromUserArmy(unitId, role.name);
            await _updateJsonData(armyId, updatedArmy.jsonData);
        }
    }

    @override
    Future<void> updateUserArmyName(String armyId, String newUserArmyName) async
    {
        await (db.update(db.userArmies)..where((t) => t.id.equals(armyId))).write(
            UserArmiesCompanion(name: Value(newUserArmyName))
        );
    }

    @override
    Future<void> updateBattleSize(String armyId, BattleSizeCode newSize) async
    {
        await (db.update(db.userArmies)..where((t) => t.id.equals(armyId))).write(
            UserArmiesCompanion(selectedBattleSize: Value(newSize.code))
        );
    }

    @override
    Future<void> updateUserArmyDetachment(String armyId, DetachmentDOM newDetachment, String newDetachmentId) async
    {
        await (db.update(db.userArmies)..where((t) => t.id.equals(armyId))).write(
            UserArmiesCompanion(detachmentId: Value(newDetachmentId))
        );
    }

    @override
    Future<void> updateWarlord(String armyId, String newInstanceIdWarlord) async
    {
        await (db.update(db.userArmies)..where((t) => t.id.equals(armyId))).write(
            UserArmiesCompanion(selectedWarlordInstanceId: Value(newInstanceIdWarlord))
        );
    }

    @override
    Future<void> dublecateUnitToUserArmy(String armyId, String instanceId, UnitRoleCode role) async
    {
        final army = await getUserArmyById(armyId);
        if (army != null)
        {
            final updatedArmy = await army.duplicateUnitInstance(instanceId, role.name);
            await _updateJsonData(armyId, updatedArmy.jsonData);
        }
    }

    @override
    Future<void> updateUnitInstanceFromUserArmy(String armyId, String instanceId, UnitRoleCode role, SaveCategoryCode category, dynamic updateData) async
    {
        final army = await getUserArmyById(armyId);
        if (army != null)
        {
            final updatedArmy = await army.updateUnitInstance(instanceId, role.name, category, updateData);
            await _updateJsonData(armyId, updatedArmy.jsonData);
        }
    }

    @override
    Future<void> updateArmyEnhancement(String armyId, Map<String, EnhancementDOM> selectedEnhancement) async
    {
        final army = await getUserArmyById(armyId);
        if (army != null)
        {
            final updatedArmy = await army.updateUnitInstanceEnhancement( selectedEnhancement);
            await _updateJsonData(armyId, updatedArmy.jsonData);
        }
    }
}

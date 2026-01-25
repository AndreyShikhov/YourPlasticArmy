/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../domain/models/unit/unit.dart';
import '../../domain/models/user_army/user_army_repository.dart';

class AddUnitToUserRoster
{
    final UserArmyRepository armyRepository;
    final UnitRepository unitRepository; // Понадобится, чтобы узнать роль юнита

    AddUnitToUserRoster(this.armyRepository, this.unitRepository);

    Future<void> call({
        required String armyId,
        required String unitId
    }) async
    {
        // 1. Получаем армию
        final army = await armyRepository.findUserArmyById(armyId);
        // 2. Получаем юнит (чтобы знать, в какую категорию его положить)
        final unit = await unitRepository.findUnitByIdFromDb(UnitId.fromString(unitId));

        if (army != null && unit != null) 
        {
            // 3. Вызываем доменную логику (она вернет обновленный объект армии)
            final updatedArmy = await army.addUnitToUserArmy(unitId, unit.role.value.name);

            // 4. Сохраняем
            await armyRepository.saveUserArmy(updatedArmy);
        }
    }
}

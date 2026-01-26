/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../domain/models/unit/unit.dart';

class GetUnitByIdFromDb
{
    final UnitRepositoryDom repository;

    // Имя конструктора теперь совпадает с именем класса
    GetUnitByIdFromDb(this.repository);

    // Добавлен знак вопроса (UnitDOM?), так как юнита может не быть в базе
    Future<UnitDOM?> call(UnitIdDom unitId) async
    {
        return await repository.findUnitByIdFromDb(unitId);
    }
}

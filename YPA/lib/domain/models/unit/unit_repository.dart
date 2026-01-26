/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/domain/models/codex/codex.dart';

import '../army/army_id.dart';
import 'unit_dom.dart';
import 'unit_id.dart';

abstract class UnitRepositoryDom
{
    /// Сохранить или обновить Unit
    Future<void> saveUnit(UnitDOM unit);

    /// Найти Unit по ID
    Future<UnitDOM?> findUnitByIdFromDb(UnitIdDom id);

    /// Получить все Unit
    Future<List<UnitDOM>> findAllUnits();

    /// Найти Unit по ID армии
    Future<List<UnitDOM>> findUnitsByArmy(ArmyId armyId);

    /// Найти Unit по ID кодекса
    Future<List<UnitDOM>> findUnitsByCodex(CodexId codexId);

    /// Удалить Unit
    Future<void> deleteUnit(UnitIdDom id);
}


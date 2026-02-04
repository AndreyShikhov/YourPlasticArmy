/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_controller.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/select_unit/select_units_dialog.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/units_block/army_units_block.dart';

import '../../../../database/tables/seed/seed_objects/_types.dart';
import '../army_builder_item_ui.dart';

class CategoryContainer extends ConsumerWidget
{
    final String armyId;
    final UnitRoleCode role;
    final bool isSelectionModeContainer;

    /// Конструктор должен выглядеть так:
    const CategoryContainer({
        super.key,
        required this.armyId,
        required this.role,
        this.isSelectionModeContainer = false
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final state = ref.watch(armyBuilderControllerProvider(armyId));

        /// получить все юниты определённой роли из юзхер армии
        final allCategoryUnitsFromUserArmy = state.getAllUnitsByRoleFromUserArmy(role.name); // все юниты (армия/кодекс) из армии пользователя

        /// Здесь будет ваша логика и контейнер со скроллом
        return Container(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    /// load data from user army
                    children: [
                        /// 1. Список юнитов, которые УЖЕ в армии (показываем всегда)
                        if (allCategoryUnitsFromUserArmy.isNotEmpty && !isSelectionModeContainer) ...[
                            ..._getUnitsUserArmyWindowByList(allCategoryUnitsFromUserArmy),
                            const SizedBox(height: 20)
                        ],

                        /// 2. Список доступных для выбора юнитов (показываем ТОЛЬКО в режиме выбора)
                        if (isSelectionModeContainer) ...[_showUnitsSelectionDialog(), const SizedBox(height: 20)]
                    ]
                // load data from data base
                )
            )
        );
    }

    /// проверть детачмент на специальные правила, может быть будет нужно добавить или убрать юнитов
    void _checkDetachment()
    {
    }

    List<Widget> _getUnitsDBWindowByList(List<ArmyBuilderUnitItemUi> listUnit)
    {
        if (listUnit.isEmpty)
        {
            debugPrint('Warning: listUnit is null or empty');
            return [];
        }

        return listUnit.map((unit) => SelectUnitsDialog(armyId: armyId, role: role)).toList();
    }

    List<ArmyUnitsBlock> _getUnitsUserArmyWindowByList(List<ArmyBuilderUnitItemUi> listUnit)
    {
        ///1. Группируем юниты по имени в один проход через Map
        final Map<String, List<ArmyBuilderUnitItemUi>> groupedUnits = {};

        for (final unit in listUnit)
        {
            groupedUnits.putIfAbsent(unit.name, () => []).add(unit);
        }

        bool isLight = false;
        /// 2. Преобразуем сгруппированные данные в список виджетов
        return groupedUnits.values.map((unitsGroup)
            {
                isLight = !isLight;
                return ArmyUnitsBlock(
                    armyId: armyId,
                    units: unitsGroup,
                    bgColor: isLight ? const Color.fromARGB(64, 255, 255, 255) : const Color.fromARGB(64, 30, 30, 30)
                );
            }).toList();
    }

    Widget _showUnitsSelectionDialog()
    {
        return SelectUnitsDialog(armyId: armyId, role: role);
    }
}

/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_controller.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/select_unit/text_unit_button.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/select_unit/unit_search_widget.dart';

import '../../../../../database/tables/seed/seed_objects/_types.dart';
import '../../army_builder_item_ui.dart';

class SelectUnitsDialog extends ConsumerStatefulWidget
{
    final String armyId;
    final UnitRoleCode role;

    const SelectUnitsDialog({super.key, required this.armyId, required this.role});

    @override
    ConsumerState<SelectUnitsDialog> createState() => _SelectUnitsDialogState();
}

class _SelectUnitsDialogState extends ConsumerState<SelectUnitsDialog>
{
    String _searchQuery = ''; /// Состояние поискового запроса

    @override
    Widget build(BuildContext context)
    {
        final state = ref.watch(armyBuilderControllerProvider(widget.armyId));

        /// 1. Получаем все юниты для данной роли из БД
        final allUnits = state.getAllUnitsByRoleFromDB(widget.role.name);

        /// 2. ФИЛЬТРАЦИЯ: Оставляем только те, что содержат поисковый запрос
        final filteredUnits = _searchQuery.isEmpty
            ? allUnits /// Если поиск пустой — показываем ВСЕХ юнитов
            : allUnits.where((unit)
                {
                    final name = unit.name.toLowerCase();
                    final query = _searchQuery.toLowerCase();
                    return name.contains(query);
                }).toList();

        return Container(
            padding: const EdgeInsets.all(16.0),
            color: const Color.fromARGB(255, 55, 55, 55),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    /// Виджет поиска
                    UnitSearchWidget(
                        armyId: widget.armyId,
                        onSearch: (text)
                        {
                            setState(()
                                {
                                    _searchQuery = text;
                                });
                        }
                    ),
                    const SizedBox(height: 10),

                    /// Список ОТФИЛЬТРОВАННЫХ юнитов
                    if (filteredUnits.isNotEmpty)
                    ..._getUnitButtons(filteredUnits)
                    else if (_searchQuery.isNotEmpty)
                    const Center(
                        child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text('Ничего не найдено', style: TextStyle(color: Colors.white38))
                        )
                    )
                ]
            )
        );
    }

    List<TextUnitButton> _getUnitButtons(List<ArmyBuilderUnitItemUi> units)
    {
        return List.generate(
            units.length,
            (i) => TextUnitButton(
                unit: units[i],
                armyId: widget.armyId,
                baseColor: i.isEven ? const Color.fromARGB(77, 255, 255, 255) : const Color.fromARGB(
                    77, 149, 149, 149)
            )
        );
    }
}

/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_controller.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/category_container.dart';
import 'package:ypa/core/ui/widgets/expandable_section.dart';

import '../../screens/army_builder/army_builder_item_ui.dart';
import 'button_open_select_units.dart';

class CategoryExpanded extends ConsumerStatefulWidget
{
    final String armyId;
    final UnitRoleCode role;

    const CategoryExpanded({
      super.key,
      required this.armyId,
      required this.role
    });

    @override
    ConsumerState<CategoryExpanded> createState() => _CategoryExpandedState();
}

class _CategoryExpandedState extends ConsumerState<CategoryExpanded>
{
    // Единственный источник истины для состояния открытия
    bool _isExpanded = false;
    bool _isSelectionMode = false;

    @override
    Widget build(BuildContext context,)
    {
        final state = ref.watch(armyBuilderControllerProvider(widget.armyId));
        final roleUnits = state.getAllUnitsByRoleFromUserArmy(widget.role.name);



        // В будущем тут будет реальный подсчет очков
        final subtitle = '${_getPTSFromCategory(roleUnits)} pts  ${roleUnits.length} units';

        return ExpandableSection(
            title: widget.role.title,
            subtitle: subtitle,
            isExpanded: _isExpanded, // Передаем состояние "сверху"
            onExpansionChanged: (expanded)
            {
                setState(()
                    {
                      // Если пытаемся открыть категорию, а в ней нет юнитов
                      if (expanded && (state.userArmyUnits?[widget.role]?.isEmpty ?? true)) {
                        _isSelectionMode = true; // сразу включаем режим выбора
                      }
                        _isExpanded = expanded; // Меняем состояние здесь
                        if (!expanded) _isSelectionMode = false;
                    });
            },
            trailing: ButtonOpenSelectUnits(
                icon: _isSelectionMode ? Icons.remove : Icons.add,
                // Кнопка теперь четко знает, развернута ли секция
                enabled: !state.isLoading && _isExpanded,
                onTap: ()
                {
                    setState(()
                        {
                            _isSelectionMode = !_isSelectionMode; // Переключаем режим
                        });
                }
            ),
            child: CategoryContainer(
                armyId: widget.armyId,
                role: widget.role,
                isSelectionModeContainer: _isSelectionMode
            )
        );
    }

    int _getPTSFromCategory(List<ArmyBuilderUnitItemUi> units) =>
    units.fold(0, (sum, u) =>
        sum + u.unitComposition.totalUnitCost);
}

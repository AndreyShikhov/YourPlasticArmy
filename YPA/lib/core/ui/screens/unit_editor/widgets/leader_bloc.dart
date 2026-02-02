/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_state.dart';
import 'package:ypa/domain/models/codex/codex.dart';
import 'package:ypa/domain/models/detachment/detachment.dart';
import 'package:ypa/domain/models/unit/model_stats.dart';

import '../../army_builder/army_builder_controller.dart';
import '../unit_editor_controller.dart';

class LeaderBloc extends ConsumerWidget
{
    final String armyId;
    final String instanceId;
    final String roleCode;
    final List<LeaderFilter> filters;

    const LeaderBloc({
        super.key,
        required this.armyId,
        required this.instanceId,
        required this.roleCode,
        required this.filters
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final armyState = ref.watch(armyBuilderControllerProvider(armyId));
        final unitState = ref.watch(unitEditorControllerProvider((armyId, instanceId, roleCode)));

        final Map<String, bool> unitsInArmy = _getUnitsInArmy(
            armyState, 
            unitState.armyTypeCode!, 
            armyState.codex, 
            armyState.detachment
        );

        final entries = unitsInArmy.entries.toList();

        return Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 4, // Отступ между строками
            children: [
                for (int i = 0; i < entries.length; i++) ...[
                        Text(
                            entries[i].key,
                            style: TextStyle(
                                color: entries[i].value
                                    ? CupertinoColors.systemYellow
                                    : CupertinoColors.white,
                                fontSize: 14,
                                fontWeight: entries[i].value ? FontWeight.bold : FontWeight.normal
                            )
                        ),
                        // Добавляем разделитель, если это не последний элемент
                        if (i < entries.length - 1)
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                                '|',
                                style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 12)
                            )
                        )
                    ]
            ]
        );
    }

    Map<String, bool> _getUnitsInArmy(ArmyBuilderState armyState, ArmyTypeCode armyCode, CodexDom? codex, DetachmentDOM? detachment) 
    {
        Set<String> unitNamesInUserArmy = _getAllUnitsNameInArmy(armyState);

        Set<String> names = {};
        Map<String, bool> result = {};
        for (LeaderFilter filter in filters)
        {
            bool isFilterCodex = (filter.codex != CodexTypeCode.none);
            bool isFilterDetachment = ( filter.detachmentCode != '');

            if ((filter.army == filter.army) && !isFilterCodex && !isFilterDetachment)
            {
              names.addAll(filter.names);
              continue;
            }

            if(isFilterCodex && filter.codex!.code == codex?.code.value){
              names.addAll(filter.names);
              continue;
            }

            if(isFilterDetachment && filter.detachmentCode == detachment?.code.value){
              names.addAll(filter.names);
              continue;
            }
        }


        if (names.isNotEmpty)
        {
            for (String unitName in names)
            {
                result[unitName] = unitNamesInUserArmy.contains(unitName);
            }
        }
        return result;
    }

    Set<String> _getAllUnitsNameInArmy(ArmyBuilderState armyState)
    {
        return armyState.userArmyUnits?.values
            .expand((units) => units) // «Схлопывает» все списки в один общий поток
            .map((unit) => unit.name) // Берет только поле name
            .toSet() ?? {};           // Оставляет только уникальные и превращает в Set
    }
}

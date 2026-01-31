/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/domain/models/codex/codex.dart';
import 'package:ypa/domain/models/detachment/detachment.dart';
import 'package:ypa/domain/models/unit/model_stats.dart';

import '../../army_builder/army_builder_controller.dart';

class LeaderBloc extends ConsumerWidget
{

    final String armyId;  
    final List<LeaderFilter> filters;

    const LeaderBloc({
        super.key,
        required this.armyId,
        required this.filters
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {

        // Получаем доступ к ТОМУ ЖЕ САМОМУ стейту, который видит ArmyBuilderScreen
        final armyState = ref.watch(armyBuilderControllerProvider(armyId));

        // Теперь вы можете читать любые данные армии
        final currentDetachment = armyState.detachment;
        final allUnits = armyState.userArmyUnits;
        final Map<String, bool> unitsInArmy = _getUnitsInArmy(armyState.userArmyName, armyState.codex, armyState.detachment);

        return Column(
          children: [
            Text(unitsInArmy.keys.first)
          ],
        );
    }

    Map<String, bool> _getUnitsInArmy(String armyId, CodexDom? codex, DetachmentDOM? detachment)
    {
        List<String> names = [];
        for (LeaderFilter filter in filters)
        {
            if (filter.army.name == armyId)
            {
                names.addAll(filter.names);
                if (filter.codex != null &&
                    codex != null &&
                    filter.codex == codex.code.value)
                {
                    names.addAll(filter.names);

                    if (filter.detachmentCode != null &&
                        detachment != null &&
                        filter.detachmentCode == detachment.code.value)
                    {
                        names.addAll(filter.names);
                    }
                }
            }
        }

        return {};
    }
}

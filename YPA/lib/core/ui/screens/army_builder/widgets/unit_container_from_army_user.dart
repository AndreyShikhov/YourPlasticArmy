/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/select_unit/text_unit_button.dart';

import '../army_builder_controller.dart';

class UnitContainerFromArmyUser extends ConsumerWidget
{
    final String armyId;
    final String unitId;

    UnitContainerFromArmyUser({super.key, required this.armyId, required this.unitId});

    @override
    Widget build(BuildContext context, WidgetRef ref) 
    {
        final state = ref.watch(armyBuilderControllerProvider(armyId));

        return Container(
            key: key,
            child: Column(
                children: [
                    TextUnitButton(unit: state.getUnitByIdFromDb(unitId), armyId: armyId),
                    SizedBox(height: 5)
                ]
            )
        );

        throw UnimplementedError();
    }
}

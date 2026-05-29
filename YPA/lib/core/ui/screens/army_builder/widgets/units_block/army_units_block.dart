/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_item_ui.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/units_block/unit_widget.dart';

import '../../../data/style_data.dart';

class ArmyUnitsBlock extends ConsumerWidget
{
    final String armyId;
    final List<ArmyBuilderUnitItemUi> units;
    final Color bgColor;

    const ArmyUnitsBlock({super.key, required this.armyId, required this.units, required this.bgColor});

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        return Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: 
                [
                    ..._getUnitsWidgets(context, ref),
                  const SizedBox(height: 8)

                ]
            )
        );
    }

    List<Widget> _getUnitsWidgets(BuildContext context, WidgetRef ref)
    {
        List<Widget> resultWidgets = [];
        for (int i = 0; i < units.length; i++)
        {
            StylePosition position;
            if (i == 0 && units.length > 1)
            {
                position = StylePosition.first;
            } else if (i == units.length - 1 && units.length > 1)
            {
                position = StylePosition.last;
            } else if (i > 0 && i < units.length)
            {
                position = StylePosition.middle;
            } else
            {
                position = StylePosition.single;
            }
            resultWidgets.add(UnitWidget(
                armyId: armyId,
                unit: units[i],
                numberUnit: i + 1,
                bgColor: bgColor,
                position: position
            ));
            if (i < units.length - 1)
            {
                resultWidgets.add(const SizedBox(height: 2));
            }
        }

        return resultWidgets;
    }
}

/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_item_ui.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/units_block/unit_widget.dart';

class ArmyUnitsBlock extends ConsumerWidget {
  final String armyId;
  final List<ArmyBuilderUnitItemUi> units;
  final Color bgColor;

  ArmyUnitsBlock({super.key, required this.armyId, required this.units, required this.bgColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
        child: Column(mainAxisSize: MainAxisSize.min, children: [..._getUnitsWidgets(context, ref)]),
      ),
    );
  }

  List<UnitWidget> _getUnitsWidgets(BuildContext context, WidgetRef ref) {
    return units.map((u) => UnitWidget(armyId: armyId, unit: u)).toList();
  }
}

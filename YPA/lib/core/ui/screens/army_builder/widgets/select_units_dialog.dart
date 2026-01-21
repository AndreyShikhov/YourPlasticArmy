import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_controller.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/text_unit_button.dart';

import '../../../../database/tables/seed/seed_objects/_types.dart';





class SelectUnitsDialog extends ConsumerWidget {
  final String armyId;
  final UnitRoleCode role;

  const SelectUnitsDialog({
    super.key,
    required this.armyId,
    required this.role,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(armyBuilderControllerProvider(armyId));
    final units = state.getAllUnitsByRoleFromDB(role.code);

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: const Color.fromARGB(255, 55, 55, 55),
      child: Column(
        children: units.map((unit) {
          return TextUnitButton(
            unit: unit,
            armyId: armyId,
          );
        }).toList(),
      ),
    );
  }
}
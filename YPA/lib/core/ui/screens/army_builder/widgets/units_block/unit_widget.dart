import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_item_ui.dart';



class UnitWidget extends ConsumerWidget {

  final String armyId;
  final ArmyBuilderUnitItemUi unit;


  UnitWidget({
    super.key,
    required this.armyId,
    required this.unit,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Text(unit.name),
      );
  }

}

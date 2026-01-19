import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/slide_to_confirm_unit_button.dart';

import '../army_builder_controller.dart';




class UnitContainer extends ConsumerWidget {

  final String armyId;
  final String unitId;


  UnitContainer({
    super.key,
    required this.armyId,
    required this.unitId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(armyBuilderControllerProvider(armyId));

    return Container(
      key: key,
      child: Column(
        children: [
          SlideToConfirmUnitButton(
            unitName: unitId,
            maxRepeat: state.getUnitByIdFromDb(unitId).repeat,
            onConfirmed: ()=>{},
          ),
          SizedBox(height: 50,)
        ],
      ),
    );

    throw UnimplementedError();
  }

}
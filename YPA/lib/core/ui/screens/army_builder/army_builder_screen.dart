import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../database/tables/seed/seed_objects/_types.dart';
import '../../widgets/expandable_section.dart';
import 'army_builder_controller.dart';
import 'army_builder_state.dart';

class ArmyBuilderScreen extends ConsumerWidget {
  final String armyId;

  const ArmyBuilderScreen({
    super.key,
    required this.armyId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(armyBuilderControllerProvider(armyId));

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text( state.armyName.isEmpty
                ? 'Loading...'
                : '${state.codexName?.value ?? "Unknown"}: ${state.armyName}'),
          ),
          flexibleSpace: SafeArea(
            child: Container(

              alignment: Alignment.centerLeft,

              padding: const EdgeInsets.only(left: 82, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text(
                    state.armyDetachmentName?.value ?? 'No detachment',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(width: 25),

                  Text(
                    '${state.totalPts} pts',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
        body: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView( // Используем ListView для прокрутки секций
          children: _buildSections(state, ref),
        ),
    );
  }
  
  
  
  
  // build all sections
  List<Widget> _buildSections(ArmyBuilderState state, WidgetRef ref) {
    
    List<String> titles = [];
    titles.add('Army Description');
    titles.add(UnitRoleCode.characters.title);
    titles.add(UnitRoleCode.battleline.title);
    titles.add(UnitRoleCode.other.title);
    titles.add(UnitRoleCode.dedicatedTransports.title);
    titles.add(UnitRoleCode.fortifications.title);

    List<Widget> tempWidgets = [];

   for(String title in titles)
   {
     if(title == 'Army Description'){
       tempWidgets.add(ExpandableSection(
         title: title,
         child: Column(
           children: [
             Text('xui'),
           ],
         ),
       ));
     } else {

       // 1. Получаем список юнитов этой роли из ростера
       final roleUnits = state.getAllUnitsByRole(title);

       tempWidgets.add(ExpandableSection(
           title: title,
           subtitle: '${roleUnits.length} units', // Показываем кол-во
           child: Column(
             children: roleUnits.map((unit) => Text(unit.name, style: TextStyle(color: Colors.white))).toList(),
           ),
       ));
     }

   }

    return tempWidgets;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/models/detachment/detachment.dart';
import '../../../database/tables/seed/seed_objects/_types.dart';
import '../../widgets/expandable_section.dart';
import 'army_builder_controller.dart';
import 'army_builder_state.dart';
import 'widgets/army_name_editor.dart'; // Добавлен импорт

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
            child: Text(state.armyName.isEmpty
                ? 'Loading...'
                : '${state.codex?.name.value ?? "Unknown"}: ${state.armyName}'),
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
                    state.detachment?.name.value ?? 'No detachment',
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
          : ListView(
        children: _buildSections(state, ref),
      ),
    );
  }

  List<Widget> _buildSections(ArmyBuilderState state, WidgetRef ref) {
    List<String> titles = [
      'Army Description',
      UnitRoleCode.characters.title,
      UnitRoleCode.battleline.title,
      UnitRoleCode.other.title,
      UnitRoleCode.dedicatedTransports.title,
      UnitRoleCode.fortifications.title,
    ];

    List<Widget> tempWidgets = [];

    for (String title in titles) {
      if (title == 'Army Description') {
        tempWidgets.add(ExpandableSection(
            title: title,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ArmyNameEditor(
                    armyId: armyId,
                    initialName: state.armyName,
                  ),
                  SizedBox(height: 20,),
                  DropdownButtonFormField<String>(
                    value: state.detachment?.name.value,
                    // Текущее значение
                    dropdownColor: const Color.fromARGB(255, 55, 55, 55),
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: 'Select Detachment',
                      labelStyle: TextStyle(color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white24)),
                    ),
                    items: _getAlllDetuchments(state),
                    onChanged: (newValue) {
                      ref.read(armyBuilderControllerProvider(armyId).notifier).updateDetachment(newValue!);
                      // TODO: вызвать метод контроллера для сохранения детачмента
                      print('Selected detachment: $newValue');
                    },
                  ),
                ],
              ),
            )
        ));
      } else {
        final roleUnits = state.getAllUnitsByRole(title);

        tempWidgets.add(ExpandableSection(
          title: title,
          trailing: IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              print('Add $title unit pressed');
            },
          ),
          subtitle: '${roleUnits.length} pts  ${roleUnits.length} units',
          child: Column(
            children: roleUnits
                .map((unit) =>
                Text(unit.name, style: const TextStyle(color: Colors.white)))
                .toList(),
          ),
        ));
      }
    }

    return
      tempWidgets;
  }


  List<DropdownMenuItem<String>> _getAlllDetuchments(ArmyBuilderState state) {
    return state.allDetachments.map((detachment) =>
        DropdownMenuItem<String>(
          value: detachment.name.value,
          child: Text(detachment.name.value),
        )).toList();
  }
}

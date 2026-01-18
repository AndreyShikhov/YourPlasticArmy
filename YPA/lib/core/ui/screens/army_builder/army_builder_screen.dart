import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/army_points_editor.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/category_container.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/detachment_selector.dart';
import 'package:ypa/domain/models/army/army.dart';
import 'package:ypa/domain/models/role/role.dart';

import '../../../database/tables/seed/seed_objects/_types.dart';
import '../../widgets/expandable_section.dart';
import 'army_builder_controller.dart';
import 'army_builder_state.dart';
import 'widgets/army_name_editor.dart';

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
                    _getPtstext(state),
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
                  const SizedBox(height: 20,),
                  DetachmentSelector(
                    armyId: armyId,
                    state: state,
                  ),
                  const SizedBox(height: 20,),
                  ArmyPointsEditor(
                      armyId: armyId, initialPoints: state.totalPts.toString())
                ],
              ),
            )
        ));
      }
      else {
        final roleUnits = state.getAllUnitsByRoleFromUserArmy(title);
        final roleEnum = UnitRoleCodeX.fromTitle(title);

        if (roleEnum == null) {
          continue;
        }

        tempWidgets.add(ExpandableSection(
          title: title,
          trailing: IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {},
          ),
          subtitle: '${roleUnits.length} pts  ${roleUnits.length} units',
          child: Column(
            children: [
              CategoryContainer(
                armyId: state.armyId!,
                role: roleEnum,
              ),
            ],
          ),
        ));
      }
    }

    return tempWidgets;
  }

  String _getPtstext(ArmyBuilderState state) {
    if (state.totalPts == 0) {
      return '${state.totalPts} pts';
    } else {
      // Использование currentPts из стейта (если оно там есть) или 0
      return '0 / ${state.totalPts} pts';
    }
  }
}

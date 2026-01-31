
/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_controller.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_item_ui.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_state.dart';
import 'package:ypa/core/ui/screens/unit_editor/widgets/base_ability_bloc.dart';
import 'package:ypa/core/ui/screens/unit_editor/widgets/basic_stats.dart';
import 'package:ypa/core/ui/screens/unit_editor/widgets/keywords_bloc.dart';
import 'package:ypa/core/ui/screens/unit_editor/widgets/leader_bloc.dart';

import '../../widgets/expanded/expandable_section.dart';

class UnitEditorScreen extends ConsumerWidget
{
    final String armyId;
    final String instanceId;
    final String roleCode;

    UnitEditorScreen({
        super.key,
        required this.armyId,
        required this.instanceId,
        required this.roleCode
    }); 

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
      // 1. Получаем состояние (для отрисовки)
      final state = ref.watch(unitEditorControllerProvider((armyId, instanceId, roleCode)));

      // 2. Получаем контроллер (для вызова методов)
      final notifier = ref.read(unitEditorControllerProvider((armyId, instanceId, roleCode)).notifier);
        // TODO: implement build
        return
        Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(120),
                child: AppBar(
                    centerTitle: false,
                    title: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(state.unit != null ? '${state.unit?.name}' : 'Loading...')
                    ),
                    flexibleSpace: SafeArea(
                        child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 82, bottom: 15),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                    if(state.unit != null)
                                    Text(
                                        'Models: ${state.unit!.selectedComposition.keys.first} / PTS:${state.unit!.selectedComposition.values.first}',
                                        style: const TextStyle(color: Colors.white70, fontSize: 14)
                                    )
                                ]
                            )
                        )
                    )
                )
            ),
            body: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    child: ListView(children: _buildSections(state)
                    )
                )
        );
    }

    Widget _getStatsWidget(UnitEditorItemUi unit)
    {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
                child: BasicStats(unit: unit)
            )
        );
    }

    List<Widget> _buildSections(UnitEditorState state)
    {
        Map<String, Widget> categories = {};
        categories['Wargear Options'] = const Text('Настройки снаряжения');

        if(state.unit!.unitAbility.isNotEmpty){
          categories['Unit Ability'] = UnitAbilityBloc(abilities: state.unitAbilities);
        }

        if(state.unit!.coreAbilities.isNotEmpty){
          categories['Core Abilities'] =  CoreAbilityBloc(abilities: state.coreAbilities);
        }

        if(state.unit!.factionAbilities.isNotEmpty){
          categories['Faction Abilities'] =  FactionAbilityBloc(abilities: state.factionAbilities);
        }



        if (state.unit!.leader.isNotEmpty) {
          categories['Leader'] =  LeaderBloc(armyId: armyId, filters: state.unit!.leader);
        }

        if (state.unit!.ledBy.isNotEmpty) {
          categories['Led By'] = LeaderBloc(armyId: armyId, filters: state.unit!.ledBy);
        }

        categories['Keywords'] = KeywordsBloc(keywords: state.unit!.keywords, factionKeywords: state.unit!.factionKeywords);


        List<Widget> sections = [];
        sections.add(_getStatsWidget(state.unit!));

        categories.forEach((title, content) =>
            sections.add(ExpandableSection(title: title, child: content))
        );

        return sections;
    }

}

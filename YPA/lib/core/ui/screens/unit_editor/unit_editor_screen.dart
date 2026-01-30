
/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_controller.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_item_ui.dart';
import 'package:ypa/core/ui/screens/unit_editor/widgets/base_ability_bloc.dart';
import 'package:ypa/core/ui/screens/unit_editor/widgets/basic_stats.dart';
import 'package:ypa/core/ui/screens/unit_editor/widgets/keywords_bloc.dart';

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
        final state = ref.watch(unitEditorControllerProvider((armyId, instanceId,roleCode)));

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
                    child: ListView(children: _buildSections(state.unit!)
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

    List<Widget> _buildSections(UnitEditorItemUi unit)
    {
        Map<String, Widget> categories = {};
        categories['Wargear Options'] = const Text('Настройки снаряжения');
        categories['Unit Ability'] = const UnitAbilityBloc(description: 'dasd', shortDescription: 'dasdasd');
        categories['Core Abilities'] = const CoreAbilityBloc(description: 'description', shortDescription: 'shortDescription');
        categories['Faction Abilities'] = const FactionAbilityBloc(description: 'asdasdasdadsas', shortDescription: 'asdasdadsadasDad',);


        if (unit.leader.isNotEmpty) {
          categories['Leader'] = const Text('Лидер');
        }

        if (unit.ledBy.isNotEmpty) {
          categories['Led By'] = const Text('Присоединяется к');
        }

        categories['Keywords'] = KeywordsBloc(keywords: unit.keywords, factionKeywords: unit.factionKeywords);


        List<Widget> sections = [];
        sections.add(_getStatsWidget(unit));

        categories.forEach((title, content) =>
            sections.add(ExpandableSection(title: title, child: content))
        );

        return sections;
    }

}

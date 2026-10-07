/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';

import '../../widgets/Stats/base_ability_bloc.dart';
import '../../widgets/Stats/base_unit_stats_bloc.dart';
import '../../widgets/Stats/keywords_bloc.dart';
import '../../widgets/expanded/expandable_section_unit_stats.dart';
import '../unit_editor/unit_editor_item_ui.dart';


class ViewUnitScreen extends StatelessWidget
{
    final String instanceId;
    final UnitEditorItemUi unit;

    const ViewUnitScreen({
        super.key,
        required this.instanceId,
        required this.unit
    });

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: AppBar(
                    centerTitle: false,
                    /// 2. ИСПОЛЬЗУЕМ Consumer, чтобы обновлялся ТОЛЬКО ТЕКСТ в AppBar
                    title: Text(
                        unit.name,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        softWrap: true,
                        maxLines: 2
                    )
                )
            ),
            body:
            ListView(
                children: _buildSections()
            )

        );
    }

    List<Widget> _buildSections()
    {
        List<Widget> sections = [];

        /// Добавляем статы (они константные)
        sections.add(Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(
                child: 
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        ...BaseUnitStatsBloc().createModelsBloc(
                            unit.modelStats,
                            unit.modifiedModelCharacteristics
                        )
                    ]
                ))
        ));

        /// Секция состава

        // if (unit.unitComposition.compositions.length > 1)
        // {
        //   sections.add(ExpandableSection(
        //       title: 'Unit Composition',
        //       child: UnitCompositionBloc(
        //           armyId: armyId,
        //           instanceId: instanceId,
        //           roleCode: roleCode
        //       )
        //   ));
        // }
        //
        // /// секция настройки вооружения
        // sections.add(ExpandableSection(
        //     title: 'Wargear Options',
        //     child: WargearStatsBloc(ids: ids)
        // ));
        //
        /// Секции правил (добавляем только если они есть)
        if (unit.unitAbility.isNotEmpty)
        {
          sections.add(ExpandableSectionUnitStats(
              title: 'Unit Ability',
              child: UnitAbilityBloc(abilities: []) ///unit.unitAbility
          ));
        }

        if (unit.coreAbilities.isNotEmpty)
        {
          sections.add(ExpandableSectionUnitStats(
              title: 'Core Abilities',
              child: UnitAbilityBloc(abilities: [])
          ));
        }

        if (unit.factionAbilities.isNotEmpty)
        {
          sections.add(ExpandableSectionUnitStats(
              title: 'Faction Abilities',
              child: UnitAbilityBloc(abilities: [])
          ));
        }
        //
        // /// таблица юнитов которые этот юнит может лидировать
        // if (unit.leader.isNotEmpty)
        // {
        //   sections.add(ExpandableSection(
        //       title: 'Leader',
        //       child: LeaderBloc(armyId: armyId, instanceId: instanceId, roleCode: roleCode, filters: unit.leader)
        //   ));
        // }
        //
        // /// таблица юнитов которые могут лидировать этот юнит
        // if (unit.ledBy.isNotEmpty)
        // {
        //   sections.add(ExpandableSection(
        //       title: 'Led By',
        //       child: LeaderBloc(armyId: armyId, instanceId: instanceId, roleCode: roleCode, filters: unit.ledBy)
        //   ));
        // }
        //
        /// секция Keywords
        sections.add(ExpandableSectionUnitStats(
            title: 'Keywords',
            child: KeywordsBloc(
                keywords: unit.keywords,
                factionKeywords: unit.factionKeywords
            )
        ));
        //
        // /// секция Enchansment только для Character  и не Epic Heroes
        // if (unit.role == 'character' && !unit.isEpicHero)
        // {
        //   sections.add(ExpandableSection(
        //       title: 'Enhancement',
        //       child: EnhancementBloc(ids: ids, allEnhancement: ref.read(armyBuilderControllerProvider(armyId)).allEnhancement)
        //   ));
        // }

        return sections;
    }
}

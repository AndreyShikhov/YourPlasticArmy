/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/view_unit/view_unit_controller.dart';
import 'package:ypa/core/ui/screens/view_unit/view_unit_state.dart';

import '../../widgets/Stats/base_ability_bloc.dart';
import '../../widgets/Stats/base_unit_stats_bloc.dart';
import '../../widgets/Stats/keywords_bloc.dart';
import '../../widgets/expanded/expandable_section_unit_stats.dart';

class ViewUnitScreen extends ConsumerWidget
{
    final String armyId;
    final String instanceId;
    final String roleCode;
    final String numericUnitName;

    const ViewUnitScreen({
        super.key,
        required this.armyId,
        required this.instanceId,
        required this.roleCode,
        required this.numericUnitName
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final ids = (armyId, instanceId, roleCode); 
        final state = ref.watch(ViewUnitControllerProvider(ids));

        if (state.isLoading) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (state.unit == null) {
          return const Scaffold(body: Center(child: Text('Unit not found')));
        }

        return Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: AppBar(
                    centerTitle: false,
                    /// 2. ИСПОЛЬЗУЕМ Consumer, чтобы обновлялся ТОЛЬКО ТЕКСТ в AppBar
                    title: Text(
                        numericUnitName,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        softWrap: true,
                        maxLines: 2
                    )
                )
            ),
            body:
            ListView(
                children: _buildSections(state)
            )

        );
    }

    List<Widget> _buildSections(ViewUnitState state)
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
                            state.unit!.modelStats,
                            state.unit!.modifiedModelCharacteristics
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
        if (state.unit?.unitAbility.isNotEmpty == true)
        {
            sections.add(ExpandableSectionUnitStats(
                title: 'Unit Ability',
                child: UnitAbilityBloc(abilities: state.unitAbilities) ///unit.unitAbility
            ));
        }

        if (state.unit?.coreAbilities.isNotEmpty == true)
        {
            sections.add(ExpandableSectionUnitStats(
                title: 'Core Abilities',
                child: UnitAbilityBloc(abilities: state.coreAbilities)
            ));
        }

        if (state.unit?.factionAbilities.isNotEmpty == true)
        {
            sections.add(ExpandableSectionUnitStats(
                title: 'Faction Abilities',
                child: UnitAbilityBloc(abilities: state.factionAbilities)
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
                keywords: state.unit!.keywords,
                factionKeywords: state.unit!.factionKeywords
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

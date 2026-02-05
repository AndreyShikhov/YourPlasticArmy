/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_controller.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_state.dart';
import 'package:ypa/core/ui/screens/unit_editor/widgets/base_ability_bloc.dart';
import 'package:ypa/core/ui/screens/unit_editor/widgets/basic_stats.dart';
import 'package:ypa/core/ui/screens/unit_editor/widgets/keywords_bloc.dart';
import 'package:ypa/core/ui/screens/unit_editor/widgets/leader_bloc.dart';
import 'package:ypa/core/ui/screens/unit_editor/widgets/unit_composition_bloc.dart';

import '../../widgets/expanded/expandable_section.dart';

class UnitEditorScreen extends ConsumerWidget
{
    final String armyId;
    final String instanceId;
    final String roleCode;

    const UnitEditorScreen({
        super.key,
        required this.armyId,
        required this.instanceId,
        required this.roleCode
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final ids = (armyId, instanceId, roleCode);

        // 1. СЛУШАЕМ ТОЛЬКО ФЛАГ ЗАГРУЗКИ. 
        // Весь экран перерисуется только ОДИН РАЗ, когда isLoading сменится с true на false.
        final isLoading = ref.watch(unitEditorControllerProvider(ids).select((s) => s.isLoading));
        final hasUnit = ref.watch(unitEditorControllerProvider(ids).select((s) => s.unit != null));

        if (isLoading) return const Scaffold(body: Center(child: CircularProgressIndicator()));
        if (!hasUnit) return const Scaffold(body: Center(child: Text('Unit not found')));

        return Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(120),
                child: AppBar(
                    centerTitle: false,
                    // 2. ИСПОЛЬЗУЕМ Consumer, чтобы обновлялся ТОЛЬКО ТЕКСТ в AppBar
                    title: Consumer(
                        builder: (context, ref, _)
                        {
                            final unitName = ref.watch(unitEditorControllerProvider(ids).select((s) => s.unit?.name ?? ''));
                            final compStr = ref.watch(unitEditorControllerProvider(ids).select((s) => _calculateCompString(s)));

                            return Text(
                                '$unitName : $compStr',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                softWrap: true,
                                maxLines: 2
                            );
                        }
                    )
                )
            ),
            body: ListView(
                // 3. Создаем секции. Они создаются один раз и больше не перерисовываются целиком.
                children: _buildSections(ref, ids)
            )
        );
    }

    // Выносим тяжелый расчет в отдельный метод, который вызывается только при смене состава
    String _calculateCompString(UnitEditorState state)
    {
        if (state.unit == null) return '';
        final base = state.unit!.unitComposition.selectedComposition ?? state.unit!.unitComposition.compositions.firstOrNull;
        int models = base?.amount ?? 0;
        int pts = base?.cost ?? 0;

        for (var m in state.unit!.unitComposition.additionalModels)
        {
            if (m.isSelected)
            {
                models += m.amount;
                pts += m.cost;
            }
        }
        return '$models models / $pts pts';
    }

    List<Widget> _buildSections(WidgetRef ref,  (String, String, String) ids)
    {
        // Получаем СТАТИЧЕСКИЕ данные юнита, которые не меняются (списки кодов способностей)
        final unit = ref.read(unitEditorControllerProvider(ids)).unit!;

        List<Widget> sections = [];

        /// Добавляем статы (они константные)
        sections.add(Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(child: BasicStats(unit: unit))
            ));

        /// Секция состава

        if (unit.unitComposition.compositions.length > 1) 
        {
            sections.add(ExpandableSection(
                    title: 'Unit Composition',
                    child: UnitCompositionBloc(
                        armyId: armyId,
                        instanceId: instanceId,
                        roleCode: roleCode,
                    )
                ));
        }


        /// секция настройки вооружения
        sections.add(const ExpandableSection(
          title: 'Wargear Options',
          child: Text('Настройки снаряжения'),
        ));

        /// Секции правил (добавляем только если они есть)
        if (unit.unitAbility.isNotEmpty)
        {
            sections.add(ExpandableSection(
                    title: 'Unit Ability',
                    child: UnitAbilityBloc(abilities: ref.read(unitEditorControllerProvider(ids)).unitAbilities)
                ));
        }

        if (unit.coreAbilities.isNotEmpty)
        {
          sections.add(ExpandableSection(
              title: 'Core Abilities',
              child: UnitAbilityBloc(abilities: ref.read(unitEditorControllerProvider(ids)).coreAbilities)
          ));
        }

        if (unit.factionAbilities.isNotEmpty)
        {
          sections.add(ExpandableSection(
              title: 'Faction Abilities',
              child: UnitAbilityBloc(abilities: ref.read(unitEditorControllerProvider(ids)).factionAbilities)
          ));
        }

        /// таблица юнитов которые этот юнит может лидировать
        if (unit.leader.isNotEmpty)
        {
          sections.add(ExpandableSection(
              title: 'Leader',
              child: LeaderBloc(armyId: armyId, instanceId: instanceId, roleCode: roleCode, filters: unit.leader),
          ));
        }

        /// таблица юнитов которые могут лидировать этот юнит
        if (unit.ledBy.isNotEmpty)
        {
          sections.add(ExpandableSection(
            title: 'Led By',
            child: LeaderBloc(armyId: armyId, instanceId: instanceId, roleCode: roleCode, filters: unit.ledBy),
          ));
        }

        /// секция Keywords
        sections.add( ExpandableSection(
          title: 'Keywords',
          child: KeywordsBloc(
              keywords: unit.keywords,
              factionKeywords: unit.factionKeywords
          ),
        ));

        return sections;
    }
}

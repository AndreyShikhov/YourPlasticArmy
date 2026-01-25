/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/army_settings/army_points_editor.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/army_settings/detachment_selector.dart';

import '../../../database/tables/seed/seed_objects/_types.dart';
import '../../widgets/expanded/expanded.dart';
import 'army_builder_controller.dart';
import 'army_builder_state.dart';
import 'widgets/army_settings/army_name_editor.dart';

class ArmyBuilderScreen extends ConsumerWidget
{
    final String armyId;

    const ArmyBuilderScreen({super.key, required this.armyId});

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final state = ref.watch(armyBuilderControllerProvider(armyId));

        return Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(120),
                child: AppBar(
                    centerTitle: false,
                    title: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                            state.armyName.isEmpty ? 'Loading...' : '${state.codex?.name.value ?? "Unknown"}: ${state.armyName}'
                        )
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
                                        style: const TextStyle(color: Colors.white70, fontSize: 14)
                                    ),
                                    const SizedBox(width: 25),
                                    Text(_getPtstext(state), style: const TextStyle(color: Colors.white70, fontSize: 14))
                                ]
                            )
                        )
                    )
                )
            ),
            body: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView(children: _buildSections(state, ref))
        );
    }

    List<Widget> _buildSections(ArmyBuilderState state, WidgetRef ref)
    {
        final List<Widget> sections = [];

        // 1. Секция описания армии (настройки)
        sections.add(
            ExpandableSection(
                title: 'Army Description',
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        children: [
                            ArmyNameEditor(armyId: armyId, initialName: state.armyName),
                            const SizedBox(height: 20),
                            DetachmentSelector(armyId: armyId, state: state),
                            const SizedBox(height: 20),
                            ArmyPointsEditor(
                                armyId: armyId,
                                initialPoints: state.battleSize?.values.firstOrNull?.toString() ?? '0'
                            )
                        ]
                    )
                )
            )
        );

        // 2. Секции ролей юнитов
        for (var role in UnitRoleCode.values)
        {
            sections.add(CategoryExpanded(armyId: armyId, role: role));
        }

        return sections;
    }

    String _getPtstext(ArmyBuilderState state)
    {
        return '${state.currentPts ?? 0} / ${state.battleSize?.values.firstOrNull.toString()} pts';
    }
}

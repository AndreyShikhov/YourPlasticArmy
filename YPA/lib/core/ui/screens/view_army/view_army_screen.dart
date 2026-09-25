/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_item_ui.dart';
import 'package:ypa/core/ui/screens/view_army/view_army_controller.dart';
import 'package:ypa/core/ui/widgets/expandable_section.dart';

class ViewArmyScreen extends ConsumerStatefulWidget
{
    final String armyId;
    const ViewArmyScreen({super.key, required this.armyId});

    @override
    ConsumerState<ViewArmyScreen> createState() => _ViewArmyScreenState();
}

class _ViewArmyScreenState extends ConsumerState<ViewArmyScreen>
{
    final ScrollController _scrollController = ScrollController();
    final Map<UnitRoleCode, bool> _expanded = {};

    @override
    void dispose()
    {
        _scrollController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context)
    {
        final state = ref.watch(viewArmyControllerProvider(widget.armyId));

        // ensure expansion keys exist
        for (final role in state.units.keys)
        {
            _expanded.putIfAbsent(role, () => false);
        }
        return Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: AppBar(
                    centerTitle: false,
                    title: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                            state.armyName.isEmpty ? 'Loading...' : '${state.codexName?.value ?? "Unknown"}: ${state.armyName}'
                        )
                    ),
                    flexibleSpace: SafeArea(
                        child: Padding(
                        padding: const EdgeInsets.only(top: 60, left: 84, right: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                                Text(
                                    state.armyDetachmentName?.value ?? 'No detachment',
                                    style: const TextStyle(color: Colors.white70, fontSize: 14)
                                ),
                              const SizedBox(width: 25),
                                Text(
                                    ' ${state.totalPts} / ${state.selectedBattleSize?.total} pts',
                                    style: const TextStyle(color: Colors.white70, fontSize: 14)
                                )
                            ]
                        )
                      ),
                    )
                )
            ),
            body: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Scrollbar(
                    controller: _scrollController,
                    thumbVisibility: true,
                    child: ListView(
                        controller: _scrollController,
                        children: _buildCategories(state.units)
                    )
                )
        );
    }

    List<Widget> _buildCategories(Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>> units)
    {
        List<Widget> result = [];
        if (units.isEmpty)
        {
            return result;
        }

        units.forEach((role, items)
        {
            result.add(
                ExpandableSection(
                    title: role.title,
                    subtitle: items.isNotEmpty ? '${items.length} units' : null,
                    isExpanded: _expanded[role] ?? false,
                    onExpansionChanged: (v) => setState(() => _expanded[role] = v),
                    child: Column(
                        children: items.map((u) => ListTile(title: Text(u.name))).toList()
                    )
                )
            );
        });

        return result;
    }
}

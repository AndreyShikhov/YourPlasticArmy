/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_item_ui.dart';
import 'package:ypa/core/ui/screens/view_army/units_block/unit_button.dart';
import 'package:ypa/core/ui/screens/view_army/view_army_controller.dart';
import 'package:ypa/core/ui/widgets/expanded/expandable_section.dart';

import '../../../../features/common_functions_lib.dart';
import '../data/style_data.dart';

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
                            padding: const EdgeInsets.only(top: 50, left: 84, right: 10),
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
                        )
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
                        children: _buildCategories(state.units, widget.armyId)
                    )
                )
        );
    }

    List<Widget> _buildCategories(Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>> units, String armyId)
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
                            children: _getSortedButtonsUnit(items, role.title)
                        )
                    )
                );
            });

        return result;
    }

    List<Widget> _getSortedButtonsUnit(List<ArmyBuilderUnitItemUi> units, String role)
    {
        if (units.isEmpty) return const[];

        final Map<String, List<String>> groups = {};
        for (final u in units)
        {
            groups.putIfAbsent(u.name, () => []).add(u.instanceId);
        }

        bool isLight = false;
        return groups.entries.expand((entry)
            {
                isLight = !isLight;
                final name = entry.key;
                final ids = entry.value;
                final len = ids.length;
                return List<Widget>.generate(len, (i)
                    {
                        final pos = _stylePositionForIndex(i, len);
                        return ViewUnitButton(

                            name: '$name  ${getRomeNumber(units[i].unitInstanceIndex)}',
                            armyId: widget.armyId,
                            unitInstanceId: ids[i],
                            role: role,
                            position: pos,
                            bgColor: isLight ? const Color.fromARGB(128, 255, 255, 255) : const Color.fromARGB(
                                128, 124, 124, 124)
                        );
                    });
            }).toList();
    }

    StylePosition _stylePositionForIndex(int index, int length)
    {
        if (length == 1) return StylePosition.single;
        if (index == 0) return StylePosition.first;
        if (index == length - 1) return StylePosition.last;
        return StylePosition.middle;
    }
}

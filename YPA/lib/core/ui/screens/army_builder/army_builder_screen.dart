/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/army_settings/army_points_editor.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/army_settings/detachment_selector.dart';

import '../../../database/tables/seed/seed_objects/_types.dart';
import '../../widgets/expandable_section.dart';
import '../../widgets/expanded/category_expanded.dart';
import 'army_builder_controller.dart';
import 'widgets/army_settings/army_name_editor.dart';

class ArmyBuilderScreen extends ConsumerWidget
{
    final String armyId;

    const ArmyBuilderScreen({super.key, required this.armyId});

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final isLoading = ref.watch(armyBuilderControllerProvider(armyId).select((s) => s.isLoading));

        return Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(120),
                child: AppBar(
                    centerTitle: false,
                    title: Consumer(
                        builder: (context, ref, _)
                        {
                            final title = ref.watch(armyBuilderControllerProvider(armyId).select((s) => 
                                    s.userArmyName.isEmpty ? 'Loading...' : '${s.codex?.name.value ?? "Unknown"}: ${s.userArmyName}'));
                            return Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(title)
                            );
                        }
                    ),
                    flexibleSpace: SafeArea(
                        child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 82, bottom: 15),
                            child: Consumer(
                                builder: (context, ref, _)
                                {
                                    final detachmentName = ref.watch(armyBuilderControllerProvider(armyId).select((s) => s.detachment?.name.value ?? 'No detachment'));
                                    final ptsText = ref.watch(armyBuilderControllerProvider(armyId).select((s) => '${s.currentPts ?? 0} / ${s.battleSize?.values.firstOrNull.toString()} pts'));

                                    return Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                            Text(detachmentName, style: const TextStyle(color: Colors.white70, fontSize: 14)),
                                            const SizedBox(width: 25),
                                            Text(ptsText, style: const TextStyle(color: Colors.white70, fontSize: 14))
                                        ]
                                    );
                                }
                            )
                        )
                    )
                )
            ),
            body: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                        ArmySettingsExpanded(armyId: armyId),
                        ...UnitRoleCode.values.map((role) => CategoryExpanded(armyId: armyId, role: role))
                    ]
                )
        );
    }
}

class ArmySettingsExpanded extends ConsumerStatefulWidget
{
  final String armyId;

  const ArmySettingsExpanded({
    super.key,
    required this.armyId,
  });

  @override
  ConsumerState<ArmySettingsExpanded> createState() =>  _ArmySettingsExpandedState();
}

class _ArmySettingsExpandedState extends ConsumerState<ArmySettingsExpanded>
{
    bool _isExpanded = false;

    @override
    Widget build(BuildContext context) 
    {

      final (userArmyName, detachment, allDetachments, battleSize) = ref.watch(
        armyBuilderControllerProvider(widget.armyId).select((s) => (
        s.userArmyName,
        s.detachment,
        s.allDetachments,
        s.battleSize,
        )),
      );
       
        return ExpandableSection(
            title: 'Army Description',
            isExpanded: _isExpanded,
            onExpansionChanged: (expanded) {
                setState(() {
                    _isExpanded = expanded;
                });
            },
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    children: [
                        ArmyNameEditor(armyId: widget.armyId, initialName: userArmyName),
                        const SizedBox(height: 20),
                        DetachmentSelector(armyId: widget.armyId, detachment: detachment, allDetachments: allDetachments,),
                        const SizedBox(height: 20),
                        ArmyPointsEditor(
                            armyId: widget.armyId,
                            initialPoints: battleSize!.values.firstOrNull?.toString() ?? '0'
                        )
                    ]
                )
            ),
        );
    }
}

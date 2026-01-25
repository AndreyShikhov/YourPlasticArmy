/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/view_army/view_army_controller.dart';

class ViewArmyScreen extends ConsumerWidget
{
    final String armyId;

    const ViewArmyScreen({super.key, required this.armyId});

    @override
    Widget build(BuildContext context, WidgetRef ref) 
    {
        final state = ref.watch(viewArmyControllerProvider(armyId));

        return Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(120),
                child: AppBar(
                    centerTitle: false,
                    title: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                            state.armyName.isEmpty ? 'Loading...' : '${state.codexName?.value ?? "Unknown"}: ${state.armyName}'
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
                                        state.armyDetachmentName?.value ?? 'No detachment',
                                        style: const TextStyle(color: Colors.white70, fontSize: 14)
                                    ),

                                    const SizedBox(width: 25),

                                    Text(
                                        '${state.selectedBattleSize?.total} pts',
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
                : ListView.builder(
                    itemCount: state.units.length,
                    itemBuilder: (context, index)
                    {
                        final unit = state.units[index];
                        return ListTile(title: Text(unit.name), subtitle: Text(unit.role));
                    }
                )
        );
    }
}

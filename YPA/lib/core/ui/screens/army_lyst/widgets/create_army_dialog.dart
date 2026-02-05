/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/providers/di/army_providers.dart';
import 'package:ypa/core/providers/di/codex_providers.dart';
import 'package:ypa/core/providers/di/faction_providers.dart';
import 'package:ypa/core/ui/screens/army_lyst/army_lyst_controller.dart';

class CreateArmyDialog extends ConsumerStatefulWidget
{
    const CreateArmyDialog({super.key});

    @override
    ConsumerState<CreateArmyDialog> createState() => _CreateArmyDialogState();
}

class _CreateArmyDialogState extends ConsumerState<CreateArmyDialog>
{
    final TextEditingController nameController = TextEditingController();

    String? selectedFactionId;
    String? selectedArmyName;
    String selectedArmyId = '';
    String? selectedCodexId;

    late final String generatedName;

    @override
    void initState()
    {
        super.initState();
        generatedName = 'New Army ${Random().nextInt(10000)}';
    }

    @override
    void dispose()
    {
        nameController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context)
    {
        return AlertDialog(
            title: const Text('Create New Army'),
            content: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                labelText: 'Army Name',
                                hintText: generatedName
                            )
                        ),
                        const SizedBox(height: 16),

                        // 1. Faction Selector
                        _FactionSelector(
                            selectedId: selectedFactionId,
                            onChanged: (val) => setState(()
                                {
                                    selectedFactionId = val;
                                    selectedArmyName = null;
                                    selectedCodexId = null;
                                })
                        ),

                        const SizedBox(height: 10),

                        // 2. Army Selector
                        if (selectedFactionId != null)
                        _ArmySelector(
                            factionId: selectedFactionId!,
                            selectedArmyId: selectedArmyId,
                            onChanged: (armyName, armyId)
                            {
                                if (armyId != selectedArmyId)
                                {
                                    setState(()
                                        {
                                            selectedArmyName = armyName;
                                            selectedArmyId = armyId;
                                            selectedCodexId = null;
                                        });
                                }
                            }
                        ),

                        const SizedBox(height: 10),

                        // 3. Codex Selector
                        if (selectedArmyName != null)
                        _CodexSelector(
                            armyId: selectedArmyId,
                            selectedId: selectedCodexId,
                            onChanged: (val) => setState(() => selectedCodexId = val)
                        )
                    ]
                )
            ),
            actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('CANCEL')
                ),
                ElevatedButton(
                    onPressed: selectedArmyName != null ? _onCreate : null,
                    child: const Text('CREATE')
                )
            ]
        );
    }

    void _onCreate() async
    {
        String name = nameController.text.trim();
        if (name.isEmpty) name = generatedName;

        final currentCodexes = ref.read(codexesByArmyProvider(selectedArmyName!)).value ?? [];
        final finalCodexId = selectedCodexId ??
            (currentCodexes.length == 1 ? currentCodexes.first.id.value.toString() : null);

        if (finalCodexId != null)
        {
            await ref.read(armyLystControllerProvider.notifier).createArmy(
                userArmyName: name,
                factionId: selectedFactionId!,
                armyId: selectedArmyId,
                codexIdRaw: finalCodexId
            );
            if (mounted) Navigator.of(context).pop();
        }
    }
}

class _FactionSelector extends ConsumerWidget
{
    final String? selectedId;
    final ValueChanged<String?> onChanged;

    const _FactionSelector({required this.selectedId, required this.onChanged});

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final factionsAsync = ref.watch(factionsListProvider);
        return factionsAsync.when(
            data: (factions) => DropdownButtonFormField<String>(
                initialValue: selectedId,
                decoration: const InputDecoration(labelText: 'Select Faction'),
                items: factions
                    .map((f) => DropdownMenuItem(
                            value: f.id.value.toString(), child: Text(f.name.value)))
                    .toList(),
                onChanged: onChanged
            ),
            error: (e, _) => Text('Error: $e'),
            loading: () => const Center(child: LinearProgressIndicator())
        );
    }
}

class _ArmySelector extends ConsumerWidget
{
    final String factionId;
    final String selectedArmyId;
    final void Function(String name, String id) onChanged;

    const _ArmySelector({
        required this.factionId,
        required this.selectedArmyId,
        required this.onChanged
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final armiesAsync = ref.watch(armiesByFactionProvider(factionId));
        return armiesAsync.when(
            data: (armies) => DropdownButtonFormField<String>(
                initialValue: selectedArmyId.isEmpty ? null : selectedArmyId,
                decoration: const InputDecoration(labelText: 'Select Army'),
                items: armies
                    .map((a) => DropdownMenuItem(
                            value: a.id.value, child: Text(a.name.value)))
                    .toList(),
                onChanged: (id)
                {
                    if (id != null)
                    {
                        final army = armies.firstWhere((a) => a.id.value == id);
                        onChanged(army.name.value, army.id.value);
                    }
                }
            ),
            error: (e, _) => Text('Error: $e'),
            loading: () => const LinearProgressIndicator()
        );
    }
}

class _CodexSelector extends ConsumerWidget
{
    final String armyId; // Переименовали поле
    final String? selectedId;
    final ValueChanged<String?> onChanged;

    const _CodexSelector(
    {required this.armyId, required this.selectedId, required this.onChanged});

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final codexsAsync = ref.watch(codexesByArmyProvider(armyId));
        return codexsAsync.when(
            data: (codexs)
            {
                if (codexs.length <= 1) return const SizedBox.shrink();
                return DropdownButtonFormField<String>(
                    initialValue: selectedId,
                    decoration: const InputDecoration(labelText: 'Select Codex'),
                    items: codexs
                        .map((c) => DropdownMenuItem(
                                value: c.id.value, child: Text(c.name.value)))
                        .toList(),
                    onChanged: onChanged
                );
            },
            error: (e, _) => Text('Error: $e'),
            loading: () => const LinearProgressIndicator()
        );
    }
}

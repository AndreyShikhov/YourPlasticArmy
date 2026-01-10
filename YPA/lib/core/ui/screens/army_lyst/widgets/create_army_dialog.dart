import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/providers/di/codex_providers.dart';
import 'package:ypa/core/providers/di/faction_providers.dart';
import 'package:ypa/core/providers/di/army_providers.dart';
import 'package:ypa/core/ui/screens/army_lyst/army_lyst_controller.dart';
import 'package:ypa/domain/models/codex/codex_dom.dart';

class CreateArmyDialog extends ConsumerStatefulWidget {
  const CreateArmyDialog({super.key});

  @override
  ConsumerState<CreateArmyDialog> createState() => _CreateArmyDialogState();
}

class _CreateArmyDialogState extends ConsumerState<CreateArmyDialog> {
  final TextEditingController nameController = TextEditingController();
  String? selectedFactionId;
  String? selectedArmyId;
  String? selectedCodexId;
  
  // Генерируем имя один раз при создании стейта
  late final String generatedName;
  List<CodexDOM> currentCodexes = [];

  @override
  void initState() {
    super.initState();
    // Имя создается один раз и не меняется при перерисовках
    generatedName = 'New Army ${Random().nextInt(10000)}';
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allFactionsAsync = ref.watch(factionsListProvider);
    final allArmiesAsync = selectedFactionId != null
        ? ref.watch(armiesByFactionProvider(selectedFactionId!))
        : null;
    final allCodexsAsync = selectedArmyId != null
        ? ref.watch(codexesByArmyProvider(selectedArmyId!))
        : null;

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
                hintText: generatedName, // Показываем подсказку
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 10),
            
            // 1. Faction
            allFactionsAsync.when(
                data: (factions) => DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Select Faction'),
                    value: selectedFactionId,
                    items: factions.map((f) => DropdownMenuItem(value: f.id.value.toString(), child: Text(f.name.value))).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFactionId = value;
                        selectedArmyId = null;
                        selectedCodexId = null;
                        currentCodexes = [];
                      });
                    }),
                error: (e, __) => Text('Error: $e'),
                loading: () => const CircularProgressIndicator()),

            const SizedBox(height: 10),

            // 2. Army
            if (selectedFactionId != null && allArmiesAsync != null)
              allArmiesAsync.when(
                data: (armies) => DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Select Army'),
                    value: selectedArmyId,
                    items: armies.map((a) => DropdownMenuItem(value: a.id.value.toString(), child: Text(a.name.value))).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedArmyId = value;
                        selectedCodexId = null;
                        currentCodexes = [];
                      });
                    }),
                error: (e, __) => Text('Error: $e'),
                loading: () => const LinearProgressIndicator(),
              ),

            const SizedBox(height: 10),

            // 3. Codex
            if (selectedArmyId != null && allCodexsAsync != null)
              allCodexsAsync.when(
                  data: (codexs) {
                    currentCodexes = codexs;
                    if (codexs.length <= 1) return const SizedBox.shrink();
                    return DropdownButtonFormField<String>(
                        decoration: const InputDecoration(labelText: 'Select Codex'),
                        value: selectedCodexId,
                        items: codexs.map((c) => DropdownMenuItem(value: c.id.value.toString(), child: Text(c.name.value))).toList(),
                        onChanged: (value) {
                          setState(() => selectedCodexId = value);
                        });
                  },
                  error: (e, __) => Text('Error: $e'),
                  loading: () => const LinearProgressIndicator())
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('CANCEL')),
        ElevatedButton(
          onPressed: _canCreate() ? () => _onCreate() : null,
          child: const Text('CREATE'),
        ),
      ],
    );
  }

  bool _canCreate() {
    // Теперь можно создать, если выбрана армия (имя возьмем автогенерируемое, если пусто)
    return selectedArmyId != null;
  }

  void _onCreate() async {
    // Если пользователь не ввел имя, берем сгенерированное
    String name = nameController.text.trim();
    if (name.isEmpty) {
      name = generatedName;
    }

    final finalCodexId = selectedCodexId ?? (currentCodexes.length == 1 ? currentCodexes.first.id.value.toString() : null);

    if (finalCodexId != null) {
      await ref.read(armyLystControllerProvider.notifier).createArmy(
        name: name,
        codexIdRaw: finalCodexId,
      );
      if (mounted) Navigator.of(context).pop();
    }
  }
}

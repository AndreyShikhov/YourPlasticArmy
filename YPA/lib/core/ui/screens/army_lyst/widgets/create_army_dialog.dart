import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/providers/di/codex_providers.dart';
import 'package:ypa/core/providers/di/faction_providers.dart';
import 'package:ypa/core/providers/di/army_providers.dart';

class CreateArmyDialog extends ConsumerStatefulWidget {
  const CreateArmyDialog({super.key});

  @override
  ConsumerState<CreateArmyDialog> createState() => _CreateArmyDialogState();
}

class _CreateArmyDialogState extends ConsumerState<CreateArmyDialog> {
  // Переменные для хранения выбранных значений
  String? selectedFactionId;
  String? selectedArmyId;
  String? selectedCodexId;

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
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Выпадающий список Фракций
          allFactionsAsync.when(
              data: (factions) => DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Select Faction'),
                  value: selectedFactionId,
                  items: factions
                      .map((faction) => DropdownMenuItem(
                          value: faction.id.value.toString(),
                          child: Text(faction.name.value)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedFactionId = value;
                      selectedArmyId = null; // Сброс армии при смене фракции
                      selectedCodexId = null; // Сброс кодекса
                    });
                  }),
              error: (e, __) => Text('Error loading factions: $e'),
              loading: () => const CircularProgressIndicator()),
          
          const SizedBox(height: 10),

          // 2. Выпадающий список Армий
          if (selectedFactionId != null && allArmiesAsync != null)
            allArmiesAsync.when(
              data: (armies) => DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'Select Army'),
                  value: selectedArmyId,
                  items: armies
                      .map((army) => DropdownMenuItem(
                          value: army.id.value.toString(),
                          child: Text(army.name.value)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedArmyId = value;
                      selectedCodexId = null; // Сброс кодекса при смене армии
                    });
                  }),
              error: (e, __) => Text('Error loading armies: $e'),
              loading: () => const LinearProgressIndicator(),
            ),

          const SizedBox(height: 10),

          // 3. Выпадающий список Кодексов (показываем только если их > 1)
          if (selectedArmyId != null && allCodexsAsync != null)
            allCodexsAsync.when(
                data: (codexs) {
                  // Если кодексов 0 или 1, не показываем поле выбора
                  if (codexs.length <= 1) {
                    return const SizedBox.shrink();
                  }
                  return DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: 'Select Codex'),
                      value: selectedCodexId,
                      items: codexs
                          .map((codex) => DropdownMenuItem(
                              value: codex.id.value.toString(),
                              child: Text(codex.name.value)))
                          .toList(),
                      onChanged: (value) {
                        setState(() => selectedCodexId = value);
                      });
                },
                error: (e, __) => Text('Error loading codexes: $e'),
                loading: () => const LinearProgressIndicator())
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('CANCEL'),
        ),
        ElevatedButton(
          onPressed: selectedArmyId == null
              ? null
              : () {
                  // TODO: Логика создания
                  print('Creating army with ID: $selectedArmyId, Codex: $selectedCodexId');
                  Navigator.of(context).pop();
                },
          child: const Text('CREATE'),
        ),
      ],
    );
  }
}

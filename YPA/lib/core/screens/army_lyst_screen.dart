import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/army_list_provider.dart';




class ArmyListScreen extends ConsumerWidget {
  const ArmyListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final armiesAsync = ref.watch(armyListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Armies')),
      body: armiesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (armies) => ListView.builder(
          itemCount: armies.length,
          itemBuilder: (_, i) => ListTile(
            title: Text(armies[i].name),
            subtitle: Text(armies[i].faction),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(armyListProvider.notifier).addArmy(
            name: 'Ultramarines',
            faction: 'Space Marines',
            points: 2000,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
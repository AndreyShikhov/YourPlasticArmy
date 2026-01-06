import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/providers/di/faction_providers.dart';

import 'package:ypa/domain/models/faction/faction_dom.dart';

class FactionsScreen extends ConsumerWidget {
  const FactionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Слушаем провайдер списка фракций
    final factionsAsyncValue = ref.watch(factionsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Factions'),
      ),
      body: factionsAsyncValue.when(
        data: (factions) {
          if (factions.isEmpty) {
            return const Center(child: Text('No factions found'));
          }
          return ListView.builder(
            itemCount: factions.length,
            itemBuilder: (context, index) {
              final faction = factions[index];
              return ListTile(
                title: Text(faction.name.value),
                subtitle: Text('ID: ${faction.id.value}'),
                leading: const Icon(Icons.shield),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';






class ArmyListScreen extends ConsumerWidget {
  const ArmyListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Scaffold(
      appBar: AppBar(title: const Text('Armies')),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
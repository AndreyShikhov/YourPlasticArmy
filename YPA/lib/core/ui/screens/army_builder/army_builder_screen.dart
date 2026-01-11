import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArmyBuilderScreen extends ConsumerWidget {
  final String armyId;

  const ArmyBuilderScreen({
    super.key,
    required this.armyId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Army Builder')),
      body: Center(
        child: Text('Building army with ID: $armyId'),
      ),
    );
  }
}

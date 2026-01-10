import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_lyst/army_list_item_ui.dart';
import 'package:ypa/core/ui/screens/army_lyst/army_lyst_controller.dart';
import 'package:ypa/core/ui/screens/army_lyst/widgets/create_army_dialog.dart';

class ArmyListScreen extends ConsumerWidget {
  const ArmyListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(armyLystControllerProvider);
    final scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(title: const Text('Army list')),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.error != null
          ? Center(child: Text('Error: ${state.error}'))
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: 350,
              child: Scrollbar(
                controller: scrollController,
                thumbVisibility: true,
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: state.items.length,
                  padding: const EdgeInsets.only(right: 15),
                  itemBuilder: (context, index) {
                    return _buildArmyButton(context, ref, state.items[index]);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: 300,
                height: 80,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const CreateArmyDialog(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 78, 73, 73),
                  ),
                  child: const Text(
                    'Add new army',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArmyButton(BuildContext context, WidgetRef ref, ArmyListItemUi item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          SizedBox(
            height: 60,
            width: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: const Color.fromARGB(255, 120, 40, 40),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () => _onDeleteArmyById(context, ref, item),
              child: const Icon(Icons.delete, color: Colors.white, size: 20),
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 60, 60, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  print('Selected army ID: ${item.id}');
                },
                child: Text(
                  _generateTextButton(item),
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          SizedBox(
            height: 60,
            width: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: const Color.fromARGB(255, 60, 60, 60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                // TODO: Переход к редактированию
              },
              child: const Icon(Icons.visibility, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  String _generateTextButton(ArmyListItemUi item) {
    return '${item.codexName}: ${item.title} (${item.pts} pts)';
  }

  Future<void> _onDeleteArmyById(BuildContext context, WidgetRef ref, ArmyListItemUi item) async {
    // Показываем подтверждение
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Army?'),
        content: Text('Are you sure you want to delete "${item.title}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('DELETE', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(armyLystControllerProvider.notifier).deleteArmy(item.id);
      await ref.read(armyLystControllerProvider.notifier).loadArmies();
    }
  }
}

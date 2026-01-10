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
                              return _buildArmyButton(context, state.items[index]);
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
                              // TODO: Логика добавления новой армии через контроллер
                              //ref.read(armyLystControllerProvider.notifier).loadArmies();
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

  Widget _buildArmyButton(BuildContext context, ArmyListItemUi item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 60, 60, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () {
            // TODO: переход на экран редактирования армии
            print('Selected army ID: ${item.id}');
          },
          child: Text(
            item.title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

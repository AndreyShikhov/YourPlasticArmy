import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../army_builder_controller.dart';
import '../army_builder_item_ui.dart';

class TextUnitButton extends ConsumerWidget {
  final ArmyBuilderUnitItemUi unit;
  final String armyId;
  final Color baseColor;
  final Color confirmColor;

  const TextUnitButton({
    super.key,
    required this.unit,
    required this.armyId,
    this.baseColor = Colors.grey,
    this.confirmColor = Colors.green,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2. Подписываемся на состояние контроллера
    final state = ref.watch(armyBuilderControllerProvider(armyId));
    // 3. Получаем доступ к методам контроллера через notifier
    final controller = ref.read(armyBuilderControllerProvider(armyId).notifier);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: baseColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: baseColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              unit.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Кнопка МИНУС
              IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.remove_circle_outline, color: Colors.redAccent),
                onPressed: () {
                  // Вызываем метод удаления в контроллере
                  //controller.removeUnit(unit);
                },
              ),
              const SizedBox(width: 15),
              // Текст с текущим количеством
              Text(
                '${state.getCurrentCountUnitFromUserArmy(unit.name)} / ${unit.repeat}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 15),
              // Кнопка ПЛЮС
              IconButton(
                visualDensity: VisualDensity.compact,
                icon: const Icon(Icons.add_circle_outline, color: Colors.greenAccent),
                onPressed: () {
                  // Вызываем метод добавления в контроллере
                  //controller.addUnit(unit);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
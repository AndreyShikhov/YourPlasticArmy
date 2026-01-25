/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';

import '../../../../widgets/buttons.dart';
import '../../army_builder_controller.dart';
import '../../army_builder_item_ui.dart';

class TextUnitButton extends ConsumerWidget
{
    final ArmyBuilderUnitItemUi unit;
    final String armyId;
    final Color baseColor;
    final Color confirmColor;

    const TextUnitButton({
        super.key,
        required this.unit,
        required this.armyId,
        this.baseColor = Colors.grey,
        this.confirmColor = Colors.green
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        // 2. Подписываемся на состояние контроллера
        final state = ref.watch(armyBuilderControllerProvider(armyId));
        // 3. Получаем доступ к методам контроллера через notifier
        final controller = ref.read(armyBuilderControllerProvider(armyId).notifier);

        // Получаем текущие значения для логики блокировки
        final currentCount = state.getCurrentCountUnitFromUserArmy(unit.name);
        final maxCount = int.tryParse(unit.repeat); // Лимит из правил

        return Container(
            //margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
                color: baseColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
                border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3), width: 2.0))
            ),
            child: Row(
                children: [
                    Expanded(
                        child: Text(
                            unit.name,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)
                        )
                    ),
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            // Кнопка МИНУС
                            AppIconButton(
                                icon: Icons.remove_circle_outline,
                                color: Colors.redAccent,
                                // Кнопка активна только если в армии есть хотя бы один такой юнит
                                enabled: currentCount > 0,
                                onTap: () => controller.removeLastUnitFromUserArmy(unit.dbId, UnitRoleCodeX.fromName(unit.role)!)
                            ),
                            const SizedBox(width: 15),
                            // Текст с текущим количеством
                            Text(
                                '${state.getCurrentCountUnitFromUserArmy(unit.name)} / ${unit.repeat}',
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)
                            ),
                            const SizedBox(width: 15),

                            // Кнопка ПЛЮС
                            AppIconButton(
                                icon: Icons.add_circle_outline,
                                color: Colors.greenAccent,
                                // Кнопка активна только если не превышен лимит
                                enabled: currentCount < maxCount!,
                                onTap: () => controller.addUnitToUserArmy(unit.dbId)
                            )
                        ]
                    )
                ]
            )
        );
    }
}

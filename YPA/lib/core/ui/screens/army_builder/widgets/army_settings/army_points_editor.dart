/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../database/tables/seed/seed_objects/_types.dart';
import '../../army_builder_controller.dart';

class ArmyPointsEditor extends ConsumerWidget
{
    final String armyId;
    final String initialPoints;

    const ArmyPointsEditor({super.key, required this.armyId, required this.initialPoints});

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final state = ref.watch(armyBuilderControllerProvider(armyId));

        /// Получаем текущее выбранное значение Enum из стейта
        final selectedSize = state.battleSize?.keys.firstOrNull;

        return DropdownButtonFormField<BattleSizeCode>(
            dropdownColor: const Color.fromARGB(255, 55, 55, 55),
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                labelText: 'Battle Size (Max points)',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24))
            ),
            items: BattleSizeCode.values.map((size)
                {
                    return DropdownMenuItem<BattleSizeCode>(
                        value: size,
                        child: Text('${size.title} (${BattleSize.base().battleSize[size]} pts)')
                    );
                }).toList(),
            onChanged: (newValue)
            {
                if (newValue != null && newValue != selectedSize)
                {
                    /// Вызываем метод контроллера для обновления размера битвы
                    ref.read(armyBuilderControllerProvider(armyId).notifier).updateBattleSizeArmyRoster(newValue);
                }
            }
        );
    }
}

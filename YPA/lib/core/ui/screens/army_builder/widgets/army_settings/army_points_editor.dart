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
    final String? initialBattleSizeCode;

    const ArmyPointsEditor({super.key, required this.armyId, required this.initialBattleSizeCode});

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final battleSize = ref.watch(armyBuilderControllerProvider(armyId)).selectedBattleSize;

        /// Получаем текущее выбранное значение Enum из стейта
       // final selectedSize = state.selectedBattleSize?.keys.firstOrNull;

        /// 1. Определяем текущий выбранный размер.
        /// Сначала пытаемся взять из загруженного стейта (реактивно),
        /// если там еще пусто (загрузка), пытаемся определить из initialPoints.
        final BattleSizeCode? selectedSize = BattleSizeCode.fromName(initialBattleSizeCode?? '');


        return DropdownButtonFormField<BattleSizeCode>(
            initialValue: selectedSize,
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

    /// Вспомогательный метод для превращения строки/очков обратно в Enum,
    /// если стейт еще не загружен.
    BattleSizeCode? _parseInitialPoints(String points)
    {
      if (points.isEmpty) return null;

      /// Проверяем по названию или по количеству очков
      for (var code in BattleSizeCode.values)
      {
        if (code.name == points || code.title == points) return code;

        /// Если передали именно число очков (например "1000")
        final basePoints = BattleSize.base().battleSize[code].toString();
        if (basePoints == points) return code;
      }
      return null;
    }
}

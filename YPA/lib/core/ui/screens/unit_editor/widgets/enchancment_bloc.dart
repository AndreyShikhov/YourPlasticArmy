/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/models/enhancement/enhancement.dart';
import '../../army_builder/army_builder_controller.dart';

class EnchancmentBloc extends StatelessWidget
{
    final String armyId;
    final String unitInstanceId;
    final List<EnhancementDOM> allEnhancement;

    const EnchancmentBloc({
        super.key,
        required this.armyId,
        required this.unitInstanceId,
        required this.allEnhancement
    });

    @override
    Widget build(BuildContext context) 
    {
        if (allEnhancement.isEmpty) return const SizedBox.shrink();

        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                        'AVAILABLE ENHANCEMENTS:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white54,
                            fontSize: 12,
                            letterSpacing: 1.2
                        )
                    )
                ),
                // Используем ListView или просто Column, так как список обычно короткий
                ...allEnhancement.map((e) => EnchancmentTile(
                        armyId: armyId,
                        unitInstanceId: unitInstanceId,
                        enhancement: e
                    ))
            ]
        );
    }
}

class EnchancmentTile extends ConsumerWidget
{
    final String armyId;
    final String unitInstanceId;
    final EnhancementDOM enhancement;

    const EnchancmentTile({
        super.key,
        required this.armyId,
        required this.unitInstanceId,
        required this.enhancement
    });

    @override
    Widget build(BuildContext context, WidgetRef ref) 
    {
        // ОПТИМИЗАЦИЯ: Виджет перерисуется ТОЛЬКО если статус ЭТОГО энхансмента изменится
        final isSelected = ref.watch(
            armyBuilderControllerProvider(armyId).select(
                (s) => s.selectedEnhancement?[unitInstanceId]?.id == enhancement.id
            )
        );

        return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: isSelected ? Colors.blueGrey.withOpacity(0.2) : Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
                children: [
                    // 1. Левая описательная часть
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                    enhancement.name.value,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    )
                                ),
                                const SizedBox(height: 2),
                                Text(
                                    enhancement.description.value,
                                    style: const TextStyle(color: Colors.white70, fontSize: 12)
                                ),
                                const SizedBox(height: 4),
                                Text(
                                    '${enhancement.points} pts',
                                    style: const TextStyle(color: Colors.orangeAccent, fontSize: 11)
                                )
                            ]
                        )
                    ),

                    const SizedBox(width: 12),

                    // 2. Правая часть - кнопка управления
                    IconButton(
                        icon: Icon(
                            isSelected ? Icons.check_circle : Icons.add_circle_outline,
                            color: isSelected ? Colors.greenAccent : Colors.white38
                        ),
                        onPressed: ()
                        {
                            // Вызываем метод в контроллере для переключения
                             ref.read(armyBuilderControllerProvider(armyId).notifier)
                               .selectEnchancment(unitInstanceId, enhancement, isSelected);
                        }
                    )
                ]
            )
        );
    }
}


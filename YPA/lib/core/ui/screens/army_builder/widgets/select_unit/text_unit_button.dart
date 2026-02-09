/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';

import '../../army_builder_controller.dart';
import '../../army_builder_item_ui.dart';

class TextUnitButton extends StatelessWidget
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
        this.confirmColor = Colors.grey
    });

    @override
    Widget build(BuildContext context) 
    {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.circular(5),
                    border: Border(bottom: BorderSide(color: confirmColor, width: 2.0))
                ),
                child: Row(
                    children: [
                        const SizedBox(width: 8),
                        Expanded(
                            child: Text(
                                unit.name,
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                            )
                        ),
                        
                        /// ОПТИМИЗАЦИЯ: Только эта часть перерисовывается при изменении количества
                        Consumer(
                            builder: (context, ref, _) {
                                final currentCount = ref.watch(armyBuilderControllerProvider(armyId).select(
                                    (s) => s.getCurrentCountUnitFromUserArmy(unit.name)
                                ));
                                
                                final controller = ref.read(armyBuilderControllerProvider(armyId).notifier);
                                final maxCount = unit.repeat;
                                
                                return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                        _AppIconButton(
                                            icon: Icons.remove_circle_outline,
                                            color: Colors.redAccent,
                                            enabled: currentCount > 0,
                                            onTap: () => controller.removeLastUnitFromUserArmy(
                                                unit.dbId, UnitRoleCode.fromName(unit.role)!
                                            )
                                        ),
                                        const SizedBox(width: 8),
                                        SizedBox(
                                            width: 45,
                                            child: Center(
                                                child: Text(
                                                    '$currentCount / $maxCount',
                                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)
                                                ),
                                            ),
                                        ),
                                        const SizedBox(width: 8),
                                        _AppIconButton(
                                            icon: Icons.add_circle_outline,
                                            color: Colors.greenAccent,
                                            enabled: currentCount < maxCount,
                                            onTap: () => controller.addUnitToUserArmy(unit.dbId)
                                        ),
                                    ],
                                );
                            },
                        ),
                        const SizedBox(width: 4),
                    ]
                )
            )
        );
    }
}

/// ЛОКАЛЬНЫЙ ОПТИМИЗИРОВАННЫЙ ВИДЖЕТ КНОПКИ
class _AppIconButton extends StatelessWidget {
    final IconData icon;
    final VoidCallback onTap;
    final bool enabled;
    final Color color;

    const _AppIconButton({
        required this.icon,
        required this.onTap,
        required this.color,
        this.enabled = true,
    });

    @override
    Widget build(BuildContext context) {
        return IconButton(
            onPressed: enabled ? onTap : null,
            icon: Icon(icon, size: 22),
            color: color,
            disabledColor: Colors.white10,
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            splashRadius: 20,
        );
    }
}

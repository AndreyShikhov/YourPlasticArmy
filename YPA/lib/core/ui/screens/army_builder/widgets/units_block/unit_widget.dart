/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_item_ui.dart';
import 'package:ypa/core/ui/screens/data/style_data.dart';

class UnitWidget extends ConsumerWidget
{
    final String armyId;
    final ArmyBuilderUnitItemUi unit;
    final int numberUnit;

    UnitWidget(
    {super.key,
        required this.armyId, 
        required this.unit,
        required this.numberUnit
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
                borderRadius: YPABorderRadius,
                border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3), width: 2.0))
            ),
            child: InkWell(
                onTap: ()
                {
                    // Логика открытия редактора юнита
                    debugPrint('Open editor for: ${unit.name}');
                },
                child: Column(
                    children: [
                        Row( // название юнита и стоимость
                            children: [
                                Text('${unit.name} ${_getRomeNumber(numberUnit)}', style: const TextStyle(color: Colors.white)),
                                const Spacer(),
                                Text('${unit.selectedComposition.values.first}')
                            ]
                        ),
                        Row( // выбранное оружие
                            children: [
                                Column(  // оуржие дальнего боя
                                    children: [
                                        ..._getRangedWeapon()
                                    ]
                                ),
                                Column(// оружие ближнего боя
                                    children: [
                                        ..._getMeleeWeapon()
                                    ]
                                )
                            ]
                        )

                    ]
                )
            )
        );
    }

    String _getRomeNumber(int arabianNumber)
    {
        switch (arabianNumber)
        {
            case 1:
                return 'I';
            case 2:
                return 'II';
            case 3:
                return 'III';
            case 4:
                return 'IV';
            case 5:
                return 'V';
            case 6:
                return 'VI';
            case 7:
                return 'VII';
            case 8:
                return 'VIII';
            case 9:
                return 'IX';
            case 10:
                return 'X';
            default:
            return '';
        }
    }

    List<Text> _getRangedWeapon() 
    {

        List<Text> res = [];//unit.weapons[WeaponType.ranged]!.map((w) => Text(w.name)).toList();
        return res;

    }

    List<Text> _getMeleeWeapon() 
    {

        List<Text> res = [];//unit.weapons[WeaponType.melee]!.map((w) => Text(w.name)).toList();
        return res;
    }
}

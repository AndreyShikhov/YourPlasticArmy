/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../features/common_functions_lib.dart';
import '../../army_builder_controller.dart';

class WarlordSelector extends ConsumerWidget
{

    final String armyId;
    final String? initialWarlordInstanceId;

    const WarlordSelector({
        super.key,
        required this.armyId,
        required this.initialWarlordInstanceId
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {

        final userArmyUnits = ref.watch(armyBuilderControllerProvider(armyId)).userArmyUnits;

        final characterUnits = (userArmyUnits?.values.expand((list) => list) ?? [])
            .where((unit) => unit.keywords.contains("Character"))
            .toList();
        int number = 1;
        String lastUnitName = '';

        ///getRomeNumber(numberUnit);
        return DropdownButtonFormField<String>(
            dropdownColor: const Color.fromARGB(255, 55, 55, 55),
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                labelText: 'Select Warlord',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24))
            ),
            items: characterUnits.map((unit)
                {
                    if (lastUnitName == unit.name) 
                    {
                        number++;
                    } else 
                    {
                        number = 1;
                        lastUnitName = unit.name;
                    }

                    String resultUnitName = lastUnitName + ' ' + getRomeNumber(number);

                    return DropdownMenuItem<String>(
                        value: unit.instanceId,
                        child: Text(resultUnitName)
                    );
                }).toList(),
            onChanged: (newValue)
            {
                if (newValue != null && newValue != initialWarlordInstanceId)
                {
                    ref.read(armyBuilderControllerProvider(armyId).notifier).updateWarlordArmyRoster(newValue);
                }
            }
        );
    }

}

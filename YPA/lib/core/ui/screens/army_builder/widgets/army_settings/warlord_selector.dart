/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_item_ui.dart';

import '../../../../../../features/common_functions_lib.dart';
import '../../../../../database/tables/seed/seed_objects/_types.dart';
import '../../army_builder_controller.dart';

class WarlordSelector extends ConsumerWidget
{

    final String armyId;

    const WarlordSelector({
        super.key,
        required this.armyId
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {

        final userArmyUnits = ref.watch(
            armyBuilderControllerProvider(armyId).select((s) => s.userArmyUnits)
        );

        final warlordInstaceId = ref.watch(
            armyBuilderControllerProvider(armyId).select((s) => s.selectedInstanceIdWarlord)
        );

        final characterUnits = (userArmyUnits?.values.expand((list) => list) ?? [])
            .where((unit) => unit.role == UnitRoleCode.character.code)
            .toList();

        final bool isWarlordInList = characterUnits.any((u) => u.instanceId == warlordInstaceId);
        final String? effectiveValue = (warlordInstaceId != null && warlordInstaceId.isNotEmpty && isWarlordInList)
            ? warlordInstaceId
            : null;


        ///getRomeNumber(numberUnit);
        return DropdownButtonFormField<String>(
            initialValue: effectiveValue,
            dropdownColor: const Color.fromARGB(255, 55, 55, 55),
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                labelText: 'Select Warlord',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
            ),
            items: _buildDropdownItems(characterUnits),
            onChanged: (newValue)
            {
                if (newValue != null && newValue != warlordInstaceId)
                {
                    ref.read(armyBuilderControllerProvider(armyId).notifier).updateWarlordArmyRoster(newValue);
                }
            }
        );
    }

    String _getWarlordName(List<ArmyBuilderUnitItemUi> characterUnits, String? warlordInstanceId)
    {
        return characterUnits
            .where((u) => u.instanceId == warlordInstanceId)
            .firstOrNull
            ?.name ?? '';
    }

    List<DropdownMenuItem<String>> _buildDropdownItems(List<ArmyBuilderUnitItemUi> characterUnits)
    {
        final Map<String, int> nameCounts = {};

        return characterUnits.map((unit)
            {
                /// Считаем, сколько раз мы уже встретили это имя
                final currentCount = (nameCounts[unit.name] ?? 0) + 1;
                nameCounts[unit.name] = currentCount;

                /// Генерируем имя с римской цифрой (например, "Captain II")
                final displayName = "${unit.name} ${getRomeNumber(currentCount)}";

                return DropdownMenuItem<String>(
                    value: unit.instanceId,
                    child: Text(displayName)
                );
            }).toList();
    }

}

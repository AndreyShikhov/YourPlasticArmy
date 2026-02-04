/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../army_builder_controller.dart';
import '../../army_builder_state.dart';

class DetachmentSelector extends ConsumerWidget
{
    final String armyId;
    final ArmyBuilderState state;

    const DetachmentSelector({super.key, required this.armyId, required this.state});

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        return DropdownButtonFormField<String>(
            value: state.detachment?.name.value,
            dropdownColor: const Color.fromARGB(255, 55, 55, 55),
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                labelText: 'Select Detachment',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24))
            ),
            items: _buildDropdownItems(state),
            onChanged: (newValue)
            {
                if (newValue != null && newValue != state.detachment?.name.value)
                {
                    ref.read(armyBuilderControllerProvider(armyId).notifier).updateDetachmentArmyRoster(newValue);
                }
            }
        );
    }

    List<DropdownMenuItem<String>> _buildDropdownItems(ArmyBuilderState state)
    {
        return state.allDetachments.map((detachment)
            {
                return DropdownMenuItem<String>(value: detachment.name.value, child: Text(detachment.name.value));
            }).toList();
    }
}

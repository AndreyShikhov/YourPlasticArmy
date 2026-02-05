/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../domain/models/detachment/detachment.dart';
import '../../army_builder_controller.dart';

class DetachmentSelector extends ConsumerWidget
{
    final String armyId;
    final DetachmentDOM? detachment;
    final List<DetachmentDOM> allDetachments;

    const DetachmentSelector({
      super.key,
      required this.armyId,
      required this.detachment,
      required this.allDetachments
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        return DropdownButtonFormField<String>(
            dropdownColor: const Color.fromARGB(255, 55, 55, 55),
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                labelText: 'Select Detachment',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white24))
            ),
            items: _buildDropdownItems(allDetachments),
            onChanged: (newValue)
            {
                if (newValue != null && newValue != detachment?.name.value)
                {
                    ref.read(armyBuilderControllerProvider(armyId).notifier).updateDetachmentArmyRoster(newValue);
                }
            }
        );
    }

    List<DropdownMenuItem<String>> _buildDropdownItems(List<DetachmentDOM> allDetachments)
    {
        return allDetachments.map((detachment)
            {
                return DropdownMenuItem<String>(value: detachment.name.value, child: Text(detachment.name.value));
            }).toList();
    }
}

/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/domain/models/unit/unit_stats.dart';

import '../unit_editor_controller.dart';

class UnitCompositionBloc extends ConsumerWidget
{
    final String armyId;
    final String instanceId;
    final String roleCode;

    const UnitCompositionBloc({
        super.key,
        required this.armyId,
        required this.instanceId,
        required this.roleCode,
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final ids = (armyId, instanceId, roleCode);
        
        /// Подписываемся на изменения состава конкретного юнита
        final composition = ref.watch(unitEditorControllerProvider(ids).select(
            (s) => s.unit?.unitComposition ?? UnitCompositionDom.emptyComposition
        ));

        final List<Widget> additionalCheckboxes = _getCheckBoxAdditionalModels(ref, composition);

        if (composition.compositions.length > 1)
        {
            final selectedModel = composition.selectedComposition ?? composition.compositions.first;

            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                    SizedBox(
                        width: 200,
                        child: DropdownButtonFormField<UnitCompositionModelDom>(
                            initialValue: selectedModel,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                filled: true,
                                fillColor: const Color.fromARGB(26, 255, 255, 255)
                            ),
                            dropdownColor: const Color(0xFF323232),
                            items: composition.compositions.map((model) => DropdownMenuItem(
                                    value: model,
                                    child: Text('${model.amount} models / ${model.cost} pts', style: const TextStyle(fontSize: 12))
                                )).toList(),
                            onChanged: (newValue)
                            {
                                if (newValue != null && newValue != selectedModel)
                                {
                                    ref.read(unitEditorControllerProvider(ids).notifier)
                                        .updateComposition(newValue);
                                }
                            }
                        )
                    ),
                    if (additionalCheckboxes.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        const Text('Additional Models:', style: TextStyle(color: Colors.white38, fontSize: 11)),
                        const SizedBox(height: 4),
                        Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: additionalCheckboxes
                        )
                    ]
                ]
            );
        }

        /// Если вариант один
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                if (composition.compositions.isNotEmpty)
                    Text(
                        '${composition.compositions.first.amount} models / ${composition.compositions.first.cost} pts',
                        style: const TextStyle(color: Colors.white70, fontSize: 13)
                    ),
                if (additionalCheckboxes.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: additionalCheckboxes
                    )
                ]
            ]
        );
    }

    List<Widget> _getCheckBoxAdditionalModels(WidgetRef ref, UnitCompositionDom composition)
    {
        final ids = (armyId, instanceId, roleCode);

        return composition.additionalModels.map((model)
            {
                return IntrinsicWidth(
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            Checkbox(
                                visualDensity: VisualDensity.compact,
                                value: model.isSelected,
                                activeColor: Colors.orangeAccent,
                                onChanged: (bool? newValue)
                                {
                                    if (newValue != null && newValue != model.isSelected)
                                    {
                                        ref.read(unitEditorControllerProvider(ids).notifier)
                                            .toggleAdditionalModel(model.name, newValue);
                                    }
                                }
                            ),
                            Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(model.name, style: const TextStyle(color: Colors.white, fontSize: 12)),
                                    Text('+ ${model.cost} pts', style: const TextStyle(color: Colors.white38, fontSize: 10))
                                ]
                            ),
                            const SizedBox(width: 12)
                        ]
                    )
                );
            }).toList();
    }
}

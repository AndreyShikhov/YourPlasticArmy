/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/domain/models/unit/model_stats.dart';

import '../unit_editor_controller.dart';

class UnitCompositionBloc extends ConsumerWidget
{
    final String armyId;
    final String instanceId;
    final String roleCode;
    final UnitCompositionDom unitComposition;

    const UnitCompositionBloc({
        super.key,
        required this.armyId,
        required this.instanceId,
        required this.roleCode,
        required this.unitComposition
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final List<Widget> additionalCheckboxes = _getCheckBoxAdditionalModels(ref);

        if (unitComposition.compositions.length > 1)
        {
            final selectedModel = unitComposition.selectedComposition ?? unitComposition.compositions.first;

            return Column( // ИСПРАВЛЕНО: Заменен Row на Column
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                    SizedBox(
                        width: 200,
                        child: DropdownButtonFormField<UnitCompositionModelDom>(
                            value: selectedModel,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.05)
                            ),
                            dropdownColor: const Color(0xFF323232),
                            items: unitComposition.compositions.map((model) => DropdownMenuItem(
                                    value: model,
                                    child: Text('${model.amount} models / ${model.cost} pts', style: const TextStyle(fontSize: 12))
                                )).toList(),
                            onChanged: (newValue)
                            {
                                if (newValue != null)
                                {
                                    ref.read(unitEditorControllerProvider((armyId, instanceId, roleCode)).notifier)
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

        // Если вариант один
        return Column( // ИСПРАВЛЕНО: Заменен Row на Column для консистентности
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                    '${unitComposition.compositions.first.amount} models / ${unitComposition.compositions.first.cost} pts',
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

    List<Widget> _getCheckBoxAdditionalModels(WidgetRef ref)
    {
        return unitComposition.additionalModels.map((model)
            {
                return IntrinsicWidth( // Чтобы Row не занимал всю ширину внутри Wrap
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            Checkbox(
                                visualDensity: VisualDensity.compact,
                                value: model.isSelected,
                                activeColor: Colors.orangeAccent,
                                onChanged: (bool? newValue)
                                {
                                    if (newValue != null)
                                    {
                                        ref.read(unitEditorControllerProvider((armyId, instanceId, roleCode)).notifier)
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

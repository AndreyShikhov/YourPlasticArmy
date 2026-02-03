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
        // Получаем список чекбоксов
        final List<Widget> additionalCheckboxes = _getCheckBoxAdditionalModels(ref);

        if (unitComposition.compositions.length > 1)
        {
            final selectedModel = unitComposition.selectedComposition ?? unitComposition.compositions.first;

            return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                        children: [
                            SizedBox(
                                width: 160,
                                child: DropdownButtonFormField<UnitCompositionModelDom>(
                                    value: selectedModel,
                                    // ... (ваши настройки оформления) ...
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
                            )
                        ]
                    ),
                    // Добавляем чекбоксы ниже
                    if (additionalCheckboxes.isNotEmpty) ...[
                        const SizedBox(height: 10, width: 15),
                        Wrap(

                            children: additionalCheckboxes
                        )
                    ]
                ]
            );
        }

        // Если вариант один
        return Row(
            children: [
                Text('${unitComposition.compositions.first.amount} models / ${unitComposition.compositions.first.cost} pts'),
                ...additionalCheckboxes
            ]
        );
    }

    List<Widget> _getCheckBoxAdditionalModels(WidgetRef ref)
    {
        return unitComposition.additionalModels.map((model)
            {
                return Row(
                    children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                    const SizedBox(width: 12),
                                    Text(model.name, style: const TextStyle(color: Colors.white70, fontSize: 12)),
                                    const SizedBox(height: 2),
                                    Text('+ ${model.cost}', style: const TextStyle(color: Colors.white70, fontSize: 12))
                                ]
                            ) 
                        ),

                        SizedBox(width: 5),
                        Checkbox(
                            value: model.isSelected,
                            activeColor: Colors.orangeAccent,
                            onChanged: (bool? newValue)
                            {
                                if (newValue != null)
                                {
                                    // ВЫЗЫВАЕМ МЕТОД КОНТРОЛЛЕРА
                                    ref.read(unitEditorControllerProvider((armyId, instanceId, roleCode)).notifier)
                                        .toggleAdditionalModel(model.name, newValue);
                                }
                            }
                        )
                    ]
                );
            }).toList();
    }
}

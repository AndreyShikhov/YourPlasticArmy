/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/domain/models/unit/model_stats.dart';



class UnitCompositionBloc extends ConsumerWidget {
  final UnitCompositionDom unitComposition;

  const UnitCompositionBloc({
    super.key,
    required this.unitComposition,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Если вариантов состава больше одного, показываем выпадающий список

      // Пытаемся найти текущую выбранную модель в списке вариантов
      final selectedModel = unitComposition.selectedComposition ?? unitComposition.compositions.first;

      return SizedBox(
        width: 250, // Немного увеличил ширину для вместимости текста PTS
        child: DropdownButtonFormField<UnitCompositionModelDom>(
          value: selectedModel,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.white.withOpacity(0.05),
          ),
          dropdownColor: const Color(0xFF323232),
          style: const TextStyle(color: Colors.white, fontSize: 13),
          items: unitComposition.compositions.map((UnitCompositionModelDom model) {
            return DropdownMenuItem<UnitCompositionModelDom>(
              value: model,
              child: Text(
                '${model.name} (${model.amount} models) - ${model.cost} pts',
                style: const TextStyle(fontSize: 12),
              ),
            );
          }).toList(),
          onChanged: (UnitCompositionModelDom? newValue) {
            if (newValue != null) {
              // В будущем: вызываем метод контроллера для обновления состава
              // ref.read(unitEditorControllerProvider(...).notifier).updateComposition(newValue);
              debugPrint('Selected composition: ${newValue.name}');
            }
          },
        ),
      );
  }
}
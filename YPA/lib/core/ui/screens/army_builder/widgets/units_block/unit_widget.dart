/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_item_ui.dart';
import 'package:ypa/core/ui/screens/army_builder/widgets/units_block/model_from_unit.dart';
import 'package:ypa/core/ui/screens/data/style_data.dart';

import '../../../../../../domain/models/unit/unit.dart';
import '../../army_builder_controller.dart';
import 'btn_action_unit.dart';

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

    List<ModelFromUnit> _getModelsWidgets()
    {
        return unit.modelStats.entries.map((entry)
            {
                return ModelFromUnit(modelStats: {entry.key: entry.value});
            }).toList();
    }

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final state = ref.watch(armyBuilderControllerProvider(armyId));

        /// Исправлено сравнение: проверяем, что текущее количество МЕНЬШЕ лимита
        bool canDuplicate = unit.repeat > state.getAmountUnitsFromUserArmy(unit.role, unit.name);

        return Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 4),

            decoration: BoxDecoration(
                borderRadius: YPABorderRadius,
                border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3), width: 2.0))
            ),
            child: InkWell(
                onTap: ()
                {
                    final String unitInsID = unit.instanceId;
                    final String roleCode = unit.role;
                    context.push('/game_screen/army_lyst/army_builder/$armyId/unit_editor/$roleCode/$unitInsID');
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Row( /// название юнита и стоимость
                                children: [
                                    Expanded(
                                        child: Text(
                                            '${unit.name} ${_getRomeNumber(numberUnit)}',
                                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                        ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                        ' ${_getModelsAndPts(unit.unitComposition)}',
                                        style: const TextStyle(color: Colors.white70, fontSize: 12),
                                    )
                                ]
                            ),
                            const SizedBox(height: 8),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                    // 1. Оборачиваем список моделей в Expanded
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                ..._getModelsWidgets()
                                            ]
                                        )
                                    ),
                                    // 2. Кнопки действий
                                    Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                            if(canDuplicate)
                                            BTNActionUnit(
                                                bgColor: Colors.black26,
                                                actionType: BTNunitActionType.dublicate,
                                                onAction: ()
                                                {
                                                    ref.read(armyBuilderControllerProvider(armyId).notifier)
                                                        .addUnitToUserArmy(unit.dbId);
                                                }
                                            ),
                                            const SizedBox(width: 8),
                                            BTNActionUnit(
                                                bgColor: Colors.black26,
                                                actionType: BTNunitActionType.remove,
                                                onAction: ()
                                                {
                                                    final roleEnum = UnitRoleCode.fromName(unit.role)!;
                                                    ref.read(armyBuilderControllerProvider(armyId).notifier)
                                                        .removeLastUnitFromUserArmy(unit.dbId, roleEnum);
                                                }
                                            )
                                        ]
                                    )
                                ]
                            )
                        ]
                    )
                )
            )
        );
    }

    String _getRomeNumber(int arabianNumber)
    {
        switch (arabianNumber)
        {
            case 1: return 'I';
            case 2: return 'II';
            case 3: return 'III';
            case 4: return 'IV';
            case 5: return 'V';
            case 6: return 'VI';
            case 7: return 'VII';
            case 8: return 'VIII';
            case 9: return 'IX';
            case 10: return 'X';
            default: return '';
        }
    }

    String _getModelsAndPts(UnitCompositionDom composition)
    {
      // 1. Берем базовый состав (выбранный или первый по умолчанию)
      final base = composition.selectedComposition ?? composition.compositions.firstOrNull;

      int models = base?.amount ?? 0;
      int pts = base?.cost ?? 0;

      // 2. Добавляем данные из дополнительных выбранных моделей
      for (var model in composition.additionalModels)
      {
        if (model.isSelected)
        {
          models += model.amount;
          pts += model.cost;
        }
      }


      return  '$models models / $pts pts';
    }
}

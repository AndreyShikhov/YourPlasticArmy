/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_controller.dart';

import '../../../../../domain/models/enhancement/enhancement.dart';
import '../../army_builder/army_builder_controller.dart';

class EnhancementBloc extends StatelessWidget
{
    final  (String, String, String) ids;
    final List<EnhancementDOM> allEnhancement;

    const EnhancementBloc({
        super.key,
        required this.ids,
        required this.allEnhancement
    });

    @override
    Widget build(BuildContext context)
    {
        if (allEnhancement.isEmpty) return const SizedBox.shrink();

        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
                const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                        'AVAILABLE ENHANCEMENTS:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white54,
                            fontSize: 12,
                            letterSpacing: 1.2
                        )
                    )
                ),
                ...allEnhancement.map((e) => EnhancementTile(
                        ids: ids,
                        enhancement: e
                    ))
            ]
        );
    }
}

class EnhancementTile extends ConsumerWidget
{
    final  (String, String, String) ids;
    final EnhancementDOM enhancement;

    const EnhancementTile({
        super.key,
        required this.ids,
        required this.enhancement
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        /// 1. Подписываемся на ВСЮ карту выбранных энхансментов (реактивно)
        final allSelected = ref.watch(
            armyBuilderControllerProvider(ids.$1).select((s) => s.selectedEnhancement)
        ) ?? {};

        /// 2. Вычисляем статусы
        final bool isSelectedByMe = allSelected[ids.$2]?.id == enhancement.id;

        /// Проверяем, не взял ли этот энхансмент кто-то другой (в 10-ке они уникальны на армию)
        final bool isSelectedByOther = allSelected.entries.any(
            (entry) => entry.key != ids.$2 && entry.value.id == enhancement.id
        );

        /// 3. Определяем цвета
        final Color colorBg = isSelectedByMe
            ? Color.fromARGB(144, 67, 232, 219)
            : Color.fromARGB(192, 140, 136, 136);

        final Color colorButton = isSelectedByMe
            ? Colors.greenAccent
            : (isSelectedByOther ? Colors.yellowAccent : Colors.white38);

        return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: colorBg,
                borderRadius: BorderRadius.circular(8),
                border: isSelectedByOther
                    ? Border.all(color: Colors.yellowAccent.withOpacity(0.3), width: 1)
                    : null
            ),
            child: Row(
                children: [
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(
                                    enhancement.name.value,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14
                                    )
                                ),
                                const SizedBox(height: 2),
                                Text(
                                    enhancement.description.value,
                                    style: const TextStyle(color: Colors.white70, fontSize: 12)
                                ),
                                const SizedBox(height: 4),
                                Text(
                                    '${enhancement.points} pts',
                                    style: const TextStyle(color: Colors.orangeAccent, fontSize: 11)
                                )
                            ]
                        )
                    ),
                    const SizedBox(width: 12),
                    IconButton(
                        /// Если выбран другим, можно заблокировать кнопку или оставить для инфо
                        icon: Icon(
                            isSelectedByMe ? Icons.check_circle : Icons.add_circle_outline,
                            color: colorButton
                        ),
                        onPressed: ()
                        {
                            ref.read(unitEditorControllerProvider(ids).notifier).selectEnhancement(enhancement, !isSelectedByMe);
                            ///selectEnhancement
                            ///ref.read(armyBuilderControllerProvider(armyId).notifier)
                            /// .selectEnhancement(unitInstanceId, enhancement, !isSelectedByMe);
                        }
                    )
                ]
            )
        );
    }
}


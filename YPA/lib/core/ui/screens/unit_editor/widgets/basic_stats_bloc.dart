/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/models/unit/unit.dart';
import '../unit_editor_controller.dart';
import '../unit_editor_item_ui.dart';

class BasicStatsBloc extends ConsumerWidget
{
    final  (String, String, String) ids;

    const BasicStatsBloc({
        super.key,
        required this.ids
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final unit = ref.watch(unitEditorControllerProvider(ids).select((s) => s.unit));

        if (unit == null) return const SizedBox.shrink();

        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                ..._createModelsBloc(unit)
            ]
        );
    }

    List<Widget> _createModelsBloc(UnitEditorItemUi unit)
    {
        List<Widget> allStats = [];

        unit.modelStats.forEach((name, stats)
            {
                if (stats.isNeedShow!)
                {
                    allStats.add(_createStatsBloc(name, stats.characteristics));
                }
            });
        return allStats;
    }

    Widget _createStatsBloc(String name, CharacteristicsDom characteristics)
    {
        return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(26, 255, 255, 255),
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    /// Строка заголовков
                                    Text(
                                        name,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    DecoratedBox(
                                        decoration: const BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))
                                        ),
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: RepaintBoundary(
                                                child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                        const _StatBox('M', isHeader: true),
                                                        const _StatBox('T', isHeader: true),
                                                        const _StatBox('SV', isHeader: true),
                                                        if (characteristics.invulnerableSave > 0) const _StatBox('ISV', isHeader: true),
                                                        const _StatBox('W', isHeader: true),
                                                        const _StatBox('LD', isHeader: true),
                                                        const _StatBox('OC', isHeader: true)
                                                    ]
                                                )
                                            )
                                        )
                                    ),
                                    const SizedBox(height: 1),
                                    /// Строка значений
                                    DecoratedBox(
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(26, 255, 255, 255),
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4))
                                        ),
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: RepaintBoundary(
                                                child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                        _StatBox('${characteristics.movement}"'),
                                                        _StatBox('${characteristics.toughness}'),
                                                        _StatBox('${characteristics.save}+'),
                                                        if (characteristics.invulnerableSave > 0) _StatBox('${characteristics.invulnerableSave}+'),
                                                        _StatBox('${characteristics.wounds}'),
                                                        _StatBox('${characteristics.leadership}+'),
                                                        _StatBox('${characteristics.objectiveControl}')
                                                    ]
                                                )
                                            )
                                        )
                                    )
                                ]
                            )
                        )
                    )
                ]
            )
        );
    }
}

class _StatBox extends StatelessWidget
{
    final String value;
    final bool isHeader;

    const _StatBox(this.value, {this.isHeader = false});

    @override
    Widget build(BuildContext context) 
    {
        return SizedBox(
            width: 50,
            height: 50,
            child: Center(
                child: Text(
                    value,
                    style: TextStyle(
                        color: isHeader ? Colors.white38 : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: isHeader ? 18 : 20
                    )
                )
            )
        );
    }
}

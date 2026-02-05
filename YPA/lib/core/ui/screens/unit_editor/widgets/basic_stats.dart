/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';

import '../../../../../domain/models/unit/unit.dart';
import '../unit_editor_item_ui.dart';

class BasicStats extends StatelessWidget
{
    final UnitEditorItemUi unit;

    const BasicStats({super.key, required this.unit});

    @override
    Widget build(BuildContext context)
    {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                ..._createModelsBloc()
            ]
        );
    }

    List<Widget> _createModelsBloc()
    {
        List<Widget> allStats = [];
        unit.modelStats.forEach((name, stats)
            {
                if (stats.isNeedShow!)
                {
                    allStats.add(_createStatsBloc(name, stats));
                }
            });
        return allStats;
    }

    Widget _createStatsBloc(String name, ModelStatsDom stats)
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
                                            child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                    _getBoxParameterBox('M', isHeader: true),
                                                    _getBoxParameterBox('T', isHeader: true),
                                                    _getBoxParameterBox('SV', isHeader: true),
                                                    if (stats.invulnerableSave > 0) _getBoxParameterBox('ISV', isHeader: true),
                                                    _getBoxParameterBox('W', isHeader: true),
                                                    _getBoxParameterBox('LD', isHeader: true),
                                                    _getBoxParameterBox('OC', isHeader: true)
                                                ]
                                            )
                                        )
                                    ),
                                    const SizedBox(height: 1),
                                    /// Строка значений
                                    DecoratedBox(
                                        decoration: const BoxDecoration(
                                            color:  Color.fromARGB(26, 255, 255, 255),
                                            borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4))
                                        ),
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 4),
                                            child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                    _getBoxParameterBox('${stats.movement}"'),
                                                    _getBoxParameterBox('${stats.toughness}'),
                                                    _getBoxParameterBox('${stats.save}+'),
                                                    if (stats.invulnerableSave > 0) _getBoxParameterBox('${stats.invulnerableSave}+'),
                                                    _getBoxParameterBox('${stats.wounds}'),
                                                    _getBoxParameterBox('${stats.leadership}+'),
                                                    _getBoxParameterBox('${stats.objectiveControl}')
                                                ]
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

    Widget _getBoxParameterBox(String value, {bool isHeader = false})
    {
        return SizedBox(
            width: 35,
            height: 35,
            child: Center(
                child: Text(
                    value,
                    style: TextStyle(
                        color: isHeader ? Colors.white38 : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: isHeader ? 16 : 18
                    )
                )
            )
        );
    }
}

/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';

import '../../../../../../domain/models/unit/unit.dart';

class ModelFromUnit extends StatelessWidget
{
    final Map<String, ModelStatsDom> modelStats;

    const ModelFromUnit({
        super.key, required this.modelStats
    });

    @override
    Widget build(BuildContext context)
    {
        return Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                        children: [
                            // ИСПРАВЛЕНО: Добавлен Expanded и ellipsis для защиты от длинных имен
                            Expanded(
                                child: Text(
                                    modelStats.keys.first,
                                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis
                                )
                            )
                        ]
                    ),
                    const SizedBox(height: 2),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            if (_hasRanged()) ...[
                                const Text('Ranged:', style: TextStyle(color: Colors.white38, fontSize: 10)),
                                ..._getRangedWeaponsThisModel(),
                                const SizedBox(height: 4)
                            ],
                            if (_hasMelee()) ...[
                                const Text('Melee:', style: TextStyle(color: Colors.white38, fontSize: 10)),
                                ..._getMeleeWeaponsThisModel()
                            ]
                        ]
                    )
                ]
            )
        );
    }

    bool _hasRanged() =>
    modelStats.values.first.modelWeapons.selectedWeapons[WeaponType.ranged]?.isNotEmpty ?? false;

    bool _hasMelee() =>
    modelStats.values.first.modelWeapons.selectedWeapons[WeaponType.melee]?.isNotEmpty ?? false;

    List<Widget> _getRangedWeaponsThisModel()
    {
        final List<String> ranged = modelStats.values.first.modelWeapons.selectedWeapons[WeaponType.ranged] ?? [];

        return [
            Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: ranged.map((name) => Text(
                            name,
                            style: const TextStyle(color: Colors.white70, fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis // Защита для оружия
                        )).toList()
                )
            )
        ];
    }

    List<Widget> _getMeleeWeaponsThisModel()
    {
        final List<String> melee =
            modelStats.values.first.modelWeapons.selectedWeapons[WeaponType.melee] ?? [];

        return [
            Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: melee.map((name) => Text(
                            name,
                            style: const TextStyle(color: Colors.white70, fontSize: 12),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis // Защита для оружия
                        )).toList()
                )
            )
        ];
    }
}

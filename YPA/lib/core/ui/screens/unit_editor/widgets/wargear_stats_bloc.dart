/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart' show WeaponType;

import '../../../../../domain/models/unit/unit.dart';
import '../unit_editor_controller.dart';

class WargearStatsBloc extends ConsumerWidget
{
    final  (String, String, String) ids;

    const WargearStatsBloc({super.key, required this.ids});

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final modelStats = ref.watch(unitEditorControllerProvider(ids).select(
                (s) => s.unit?.modelStats
            ));

        if (modelStats == null) return const SizedBox.shrink();

        return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                    DecoratedBox(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(26, 255, 255, 255),
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                _buildHeaderRanged(),
                                _BuildBlocWeapons(modelStats, WeaponType.ranged),
                                _buildHeaderMelee(),
                                _BuildBlocWeapons(modelStats, WeaponType.melee),
                            ]
                        )
                    )
                ]
            )
        );
    }

    Widget _buildHeaderRanged()
    {
        return const DecoratedBox(
            decoration: BoxDecoration(
                color: Color.fromARGB(153, 51, 135, 41),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))
            ),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                    SizedBox(width: 150, child: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text('Ranged Weapons', style: _headerTitleStyle)
                        )),
                    SizedBox(width: 60, child: Center(child: Text('Range', style: _headerStatStyle))),
                    _StatBox('A', isHeader: true),
                    _StatBox('BS', isHeader: true),
                    _StatBox('S', isHeader: true),
                    _StatBox('AP', isHeader: true),
                    _StatBox('D', isHeader: true)
                ]
            )
        );
    }

    Widget _buildHeaderMelee()
    {
        return const DecoratedBox(
            decoration: BoxDecoration(
                color: Color.fromARGB(108, 193, 142, 31),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))
            ),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                    SizedBox(width: 150, child: Padding(
                            padding: EdgeInsets.only(left: 4.0),
                            child: Text('Melee Weapons', style: _headerTitleStyle)
                        )),
                    SizedBox(width: 60, child: Center(child: Text('Range', style: _headerStatStyle))),
                    _StatBox('A', isHeader: true),
                    _StatBox('WS', isHeader: true),
                    _StatBox('S', isHeader: true),
                    _StatBox('AP', isHeader: true),
                    _StatBox('D', isHeader: true)
                ]
            )
        );
    }

    Widget _BuildBlocWeapons(Map<String, ModelStatsDom> modelsStats, WeaponType type)
    {
        final unitModels = modelsStats.entries
            .where((e) => e.value.isNeedShow ?? false)
            .map((e) => e.key)
            .toList();

        List<Widget> allAcceptedWeapons = [];
        for (String name in unitModels)
        {
            final model = modelsStats[name]!;
            List<String> nameAcceptedWeapons = model.modelWeapons.selectedWeapons[type]!;

            for (final weapon in model.modelWeapons.weapons[type]!)
            {
                if (nameAcceptedWeapons.contains(weapon.name))
                {
                    allAcceptedWeapons.add(_buildRowWeapon(weapon));
                }
            }
        }

        return Column(children: allAcceptedWeapons);
    }

    Widget _buildRowWeapon(WeaponDom weapon, {bool isLight = false})
    {
        return DecoratedBox(
            decoration: BoxDecoration(
              color: isLight ? Colors.black12 : Colors.transparent,
            ),
            child: Row(
                children: [
                    _NameWeapon(weapon.name),
                    SizedBox(width: 60, child: Center(child: Text('${weapon.range}"'))),
                    _StatBox(weapon.attacks),
                    _StatBox('${weapon.skill}+'),
                    _StatBox('${weapon.strength}'),
                    _StatBox('-${weapon.ap}'),
                    _StatBox(weapon.damage)
                ]
            )
        );
    }

    // Стиль для названия категории (более яркий)
    static const _headerTitleStyle = TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14
    );

    // Стиль для подписей статов (чуть приглушенный, но без сильной прозрачности)
    static const _headerStatStyle = TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.bold,
        fontSize: 14
    );

}

/// ==========================================
///  elements
/// ==========================================

class _StatBox extends StatelessWidget
{
    final String value;
    final bool isHeader;

    const _StatBox(this.value, {this.isHeader = false});

    @override
    Widget build(BuildContext context)
    {
        return SizedBox(
            width: 35,
            height: 35,
            child: Center(
                child: Text(
                    value,
                    style: TextStyle(
                        color: isHeader ? Colors.white70 : Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: isHeader ? 14 : 16
                    )
                )
            )
        );
    }
}

class _NameWeapon extends StatelessWidget
{
    final String value;

    const _NameWeapon(this.value);

    @override
    Widget build(BuildContext context)
    {
        return SizedBox(
            width: 150,
            height: 35,
            child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        value,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                        ),
                        overflow: TextOverflow.ellipsis,
                    ),
                ),
            )
        );
    }
}

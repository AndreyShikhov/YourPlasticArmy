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
                                const SizedBox(height: 8),
                                _buildHeaderMelee(),
                                _BuildBlocWeapons(modelStats, WeaponType.melee)
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
            .toList();

        List<Widget> sections = [];
        for (final modelEntry in unitModels)
        {
            final modelName = modelEntry.key;
            final model = modelEntry.value;

            final selectedWeapons = model.modelWeapons.selectedWeapons[type] ?? [];
            final availableWeapons = model.modelWeapons.weapons[type] ?? [];

            if (availableWeapons.isEmpty) continue;

            sections.add(_buildModelWeaponSection(modelName, availableWeapons, selectedWeapons));
        }

        return Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: sections,
        );
    }

    Widget _buildModelWeaponSection(String modelName, List<WeaponDom> availableWeapons, List<String> selectedWeapons)
    {
        List<Widget> weaponRows = [];
        bool isLight = false;

        for (final weapon in availableWeapons)
        {
            if (selectedWeapons.contains(weapon.name))
            {
                isLight = !isLight;
                weaponRows.add(_buildUsedRowWeapon(weapon, isLight));
            } else
            {
                weaponRows.add(_buildUnUsedRowWeapon(weapon));
            }
        }

        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white12),
                    borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 4.0, left: 8.0, bottom: 2.0),
                            child: Text(
                                modelName,
                                style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                        ),
                        ...weaponRows,
                    ],
                ),
            ),
        );
    }

    Widget _buildUsedRowWeapon(WeaponDom weapon, bool isLight)
    {
        return DecoratedBox(
            decoration: BoxDecoration(
                color: isLight ? const Color.fromARGB(47, 255, 255, 255) : const Color.fromARGB(39, 0, 0, 0)
            ),
            child: Row(
                mainAxisSize: MainAxisSize.min,
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

    Widget _buildUnUsedRowWeapon(WeaponDom weapon)
    {
        return DecoratedBox(
            decoration: const BoxDecoration(
                color: Color.fromARGB(52, 255, 0, 0)
            ),
            child: Row(
                mainAxisSize: MainAxisSize.min,
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
                    ),
                    textAlign: TextAlign.center
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
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis
                    )
                )
            )
        );
    }
}

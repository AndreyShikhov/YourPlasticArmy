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
        final modelStats = ref.watch(unitEditorControllerProvider(ids).select((s) => s.unit?.modelStats));

        if (modelStats == null) return const SizedBox.shrink();

        return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            /// Align заставляет ребенка сжаться до его собственного размера и центрирует его
            child: Align(
                alignment: Alignment.center,
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(26, 255, 255, 255),
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            const _WeaponCategoryHeader(type: WeaponType.ranged),
                            _WeaponTypeGroup(modelsStats: modelStats, type: WeaponType.ranged),
                            const SizedBox(height: 8),
                            const _WeaponCategoryHeader(type: WeaponType.melee),
                            _WeaponTypeGroup(modelsStats: modelStats, type: WeaponType.melee)
                        ]
                    )
                ),
            )
        );
    }
}

class _WeaponTypeGroup extends StatelessWidget
{
    final Map<String, ModelStatsDom> modelsStats;
    final WeaponType type;

    const _WeaponTypeGroup({required this.modelsStats, required this.type});

    @override
    Widget build(BuildContext context) 
    {
        final unitModels = modelsStats.entries.where((e) => e.value.isNeedShow ?? false).toList();

        List<Widget> sections = [];
        for (final modelEntry in unitModels)
        {
            final modelName = modelEntry.key;
            final model = modelEntry.value;

            final selectedWeapons = model.modelWeapons.selectedWeapons[type] ?? [];
            final availableWeapons = model.modelWeapons.weapons[type] ?? [];

            if (availableWeapons.isEmpty) continue;

            sections.add(_ModelWeaponBlock(
                    modelName: modelName,
                    availableWeapons: availableWeapons,
                    selectedWeapons: selectedWeapons
                ));
        }

        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: sections
        );
    }
}

class _ModelWeaponBlock extends StatelessWidget
{
    final String modelName;
    final List<WeaponDom> availableWeapons;
    final List<String> selectedWeapons;

    const _ModelWeaponBlock({
        required this.modelName,
        required this.availableWeapons,
        required this.selectedWeapons
    });

    @override
    Widget build(BuildContext context) 
    {
        List<Widget> weaponRows = [];
        bool isLight = false;

        for (final weapon in availableWeapons)
        {
            final isUsed = selectedWeapons.contains(weapon.name);
            if (isUsed) isLight = !isLight;

            weaponRows.add(_WeaponRow(
                    weapon: weapon,
                    isUsed: isUsed,
                    isLight: isLight
                ));
        }

        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white12),
                    borderRadius: BorderRadius.circular(4)
                ),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 4.0, left: 8.0, bottom: 2.0),
                            child: Text(
                                modelName,
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)
                            )
                        ),
                        ...weaponRows
                    ]
                )
            )
        );
    }
}

class _WeaponRow extends StatelessWidget
{
    final WeaponDom weapon;
    final bool isUsed;
    final bool isLight;

    const _WeaponRow({
        required this.weapon,
        required this.isUsed,
        this.isLight = false
    });

    @override
    Widget build(BuildContext context) 
    {
        final Color bgColor = isUsed
            ? (isLight ? const Color.fromARGB(47, 255, 255, 255) : const Color.fromARGB(39, 0, 0, 0))
            : const Color.fromARGB(76, 255, 0, 0);

        return DecoratedBox(
            decoration: BoxDecoration(color: bgColor),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                    _NameWeapon(weapon.name),
                    SizedBox(width: 60, child: Center(child: Text('${weapon.range}"', style: const TextStyle(color: Colors.white)))),
                    _StatBox(weapon.attacks),
                    _StatBox('${weapon.skill}+'),
                    _StatBox('${weapon.strength}'),
                    _StatBox('-${weapon.ap}'),
                    _StatBox(weapon.damage)
                ]
            )
        );
    }
}

class _WeaponCategoryHeader extends StatelessWidget
{
    final WeaponType type;

    const _WeaponCategoryHeader({required this.type});

    @override
    Widget build(BuildContext context) 
    {
        final isRanged = type == WeaponType.ranged;
        final color = isRanged ? const Color.fromARGB(153, 51, 135, 41) : const Color.fromARGB(108, 193, 142, 31);
        final title = isRanged ? 'Ranged Weapons' : 'Melee Weapons';
        final skillLabel = isRanged ? 'BS' : 'WS';

        return DecoratedBox(
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))
            ),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                    SizedBox(width: 150, child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(title, style: _headerTitleStyle)
                        )),
                    const SizedBox(width: 60, child: Center(child: Text('Range', style: _headerStatStyle))),
                    const _StatBox('A', isHeader: true),
                    _StatBox(skillLabel, isHeader: true),
                    const _StatBox('S', isHeader: true),
                    const _StatBox('AP', isHeader: true),
                    const _StatBox('D', isHeader: true)
                ]
            )
        );
    }

    static const _headerTitleStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14);
    static const _headerStatStyle = TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 14);
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
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis
                    )
                )
            )
        );
    }
}

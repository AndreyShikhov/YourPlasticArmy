/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/ui/screens/unit_editor/widgets/base_ability_bloc.dart';
import 'package:ypa/domain/models/abilities/base_ability.dart';

import '../../../../../domain/models/abilities/weapon_ability/weapon_ability.dart';
import '../../../../../domain/models/unit/unit.dart';
import '../unit_editor_controller.dart';

class WargearStatsBloc extends ConsumerWidget
{
    final  (String, String, String) ids;

    const WargearStatsBloc({super.key, required this.ids});

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        /// 1. ОПТИМИЗАЦИЯ: Подписываемся ТОЛЬКО на те части, которые влияют на этот блок.
        /// Если в UnitEditorItemUi изменятся Keywords или Name, этот блок НЕ перерисуется.
        final (weaponInfo, modelStats, ) = ref.watch(unitEditorControllerProvider(ids).select((s) => (
                s.unit?.weaponInfo,
                s.unit?.modelStats,
                )));

        /// 2. Подписываемся на абилки (они загружаются один раз при старте)
        final weaponAbilities = ref.watch(unitEditorControllerProvider(ids).select((s) => s.weaponAbilities));

        if (weaponInfo == null || modelStats == null) return const SizedBox.shrink();

        final screenWidth = MediaQuery.sizeOf(context).width;
        final isWide = screenWidth > 900;

        if (isWide)
        {
            return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        _buildCategorySection(weaponInfo, modelStats, weaponAbilities, WeaponType.ranged),
                        const SizedBox(width: 32),
                        _buildCategorySection(weaponInfo, modelStats, weaponAbilities, WeaponType.melee)
                    ]
                )
            );
        }

        return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                    SizedBox(
                        height: 400,
                        child: PageView(
                            controller: PageController(viewportFraction: 1.0),
                            children: [
                                SingleChildScrollView(child: _buildCategorySection(weaponInfo, modelStats, weaponAbilities, WeaponType.ranged)),
                                SingleChildScrollView(child: _buildCategorySection(weaponInfo, modelStats, weaponAbilities, WeaponType.melee))
                            ]
                        )
                    )
                ]
            )
        );
    }

    Widget _buildCategorySection(
        List<dynamic> weaponInfo, 
        Map<String, ModelStatsDom> modelStats, 
        List<WeaponAbilityDOM> weaponAbilities, 
        WeaponType type
    ) 
    {
        return DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6)
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                    _WeaponCategoryHeader(type: type),
                    _WeaponTypeGroup(
                        weaponInfo: weaponInfo, 
                        modelStats: modelStats, 
                        weaponAbilities: weaponAbilities, 
                        type: type
                    )
                ]
            )
        );
    }
}

class _WeaponTypeGroup extends StatelessWidget
{
    final List<dynamic> weaponInfo;
    final Map<String, ModelStatsDom> modelStats;
    final List<WeaponAbilityDOM> weaponAbilities;
    final WeaponType type;

    const _WeaponTypeGroup({
        required this.weaponInfo, 
        required this.modelStats, 
        required this.weaponAbilities, 
        required this.type
    });

    @override
    Widget build(BuildContext context)
    {
        final weaponsByType = weaponInfo.where((w) => w.weaponType == type).toList();

        if (weaponsByType.isEmpty) return const SizedBox.shrink();

        final Map<String, List<dynamic>> groupedByModel = {};
        for (var info in weaponsByType)
        {
            groupedByModel.putIfAbsent(info.modelName, () => []).add(info);
        }

        // СОРТИРОВКА: Внутри каждой модели сначала ставим экипированное оружие, затем неиспользуемое
        for (var modelWeaponsList in groupedByModel.values) 
        {
            modelWeaponsList.sort((a, b) {
                if (a.isEquiped == b.isEquiped) return 0;
                return a.isEquiped ? -1 : 1;
            });
        }

        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: groupedByModel.entries.map((entry)
                {
                    return _ModelWeaponBlock(
                        modelName: entry.key,
                        modelWeapons: entry.value,
                        weaponAbilities: weaponAbilities,
                        originalModelStats: modelStats[entry.key]!
                    );
                }).toList()
        );
    }
}

class _ModelWeaponBlock extends StatelessWidget
{
    final String modelName;
    final List<dynamic> modelWeapons;
    final List<WeaponAbilityDOM> weaponAbilities;
    final ModelStatsDom originalModelStats;

    const _ModelWeaponBlock({
        required this.modelName,
        required this.modelWeapons,
        required this.weaponAbilities,
        required this.originalModelStats
    });

    @override
    Widget build(BuildContext context)
    {
        List<Widget> weaponRows = [];
        bool isLight = false;

        for (final info in modelWeapons)
        {
            final weaponType = info.weaponType as WeaponType;
            final weapon = originalModelStats.modelWeapons.weapons[weaponType]!
                .firstWhere((w) => w.name == info.weaponName);

            if (info.isEquiped) isLight = !isLight;

            weaponRows.add(_WeaponRow(
                    weapon: weapon,
                    isUsed: info.isEquiped,
                    isLight: isLight,
                    weaponAbilities: weaponAbilities,
                    amount: info.amount
                ));
        }

        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
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
                            padding: const EdgeInsets.only(top: 4.0, left: 4.0, bottom: 2.0),
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
    final List<WeaponAbilityDOM> weaponAbilities;
    final int amount;

    const _WeaponRow({
        required this.weapon,
        required this.isUsed,
        required this.weaponAbilities,
        required this.amount,
        this.isLight = false
    });

    @override
    Widget build(BuildContext context)
    {
        final Color bgColor = isUsed
            ? (isLight ? const Color.fromARGB(103, 255, 255, 255) : const Color.fromARGB(76, 179, 179, 179))
            : const Color.fromARGB(34, 69, 0, 0);

        return DecoratedBox(
            decoration: BoxDecoration(color: bgColor),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            _NameWeapon(weapon.name, isUsed, amount),
                            SizedBox(width: 60, child: Center(child: Text('${weapon.range}"', style: TextStyle(color: isUsed ? Colors.white : const Color.fromARGB(153, 143, 143, 143))))),
                            _StatBox(weapon.attacks, isUsed: isUsed),
                            _StatBox('${weapon.skill}+', isUsed: isUsed),
                            _StatBox('${weapon.strength}', isUsed: isUsed),
                            _StatBox('-${weapon.ap}', isUsed: isUsed),
                            _StatBox(weapon.damage, isUsed: isUsed)
                        ]
                    ),
                    if (weapon.weaponAbilities.isNotEmpty)
                    Padding(
                        padding: const EdgeInsets.only(left: 4.0, bottom: 2.0),
                        child: _WeaponAbilitiesBTN(abilities: weapon.weaponAbilities, weaponAbilities: weaponAbilities)
                    )
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
        final color = isRanged ? const Color.fromARGB(152, 28, 193, 246) : const Color.fromARGB(153, 248, 23, 23);
        final title = isRanged ? 'Ranged Weapons' : 'Melee Weapons';
        final skillLabel = isRanged ? 'BS' : 'WS';

        return DecoratedBox(
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))
            ),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                    SizedBox(width: 140, child: Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(title, style: _headerTitleStyle)
                        )),
                    const SizedBox(width: 60, child: Center(child: Text('Range', style: _headerTitleStyle))),
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
}

class _StatBox extends StatelessWidget
{
    final String value;
    final bool isHeader;
    final bool isUsed;

    const _StatBox(
        this.value,
        {this.isHeader = false,
            this.isUsed = true}
    );

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
                        color: isUsed ? Colors.white : const Color.fromARGB(153, 143, 143, 143),
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
    final bool isUsed;
    final int amount;

    const _NameWeapon(this.value, this.isUsed, this.amount);

    @override
    Widget build(BuildContext context)
    {
        final String amountWeapon = '$amount' 'x ';

        return SizedBox(
            width: 140,
            child: Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 4.0, bottom: 4.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                        children: [
                            if (amount > 0)
                            Text(
                                amountWeapon,
                                style: const TextStyle(
                                    color: Color.fromARGB(215, 255, 174, 0),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13
                                )
                            ),
                            Expanded(
                                child: Text(
                                    value,
                                    style: TextStyle(
                                        color: isUsed ? Colors.white : const Color.fromARGB(153, 143, 143, 143),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13
                                    ),
                                    softWrap: true,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis
                                ),
                            ),
                        ],
                    ),
                ),
            )
        );
    }
}

class _WeaponAbilitiesBTN extends StatelessWidget
{
    final List<WeaponAbilitiesCode> abilities;
    final List<WeaponAbilityDOM> weaponAbilities;

    const _WeaponAbilitiesBTN({required this.abilities, required this.weaponAbilities});

    @override
    Widget build(BuildContext context)
    {
        return Wrap(
            spacing: 4.0,
            runSpacing: 4.0,
            children: abilities.map((ability) => _buildAbilityTag(context, ability)).toList()
        );
    }

    Widget _buildAbilityTag(BuildContext context, WeaponAbilitiesCode abilityCode)
    {
        return InkWell(
            onTap: () => _showAbilityDialog(context, abilityCode),
            borderRadius: BorderRadius.circular(4),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(153, 0, 0, 0),
                    borderRadius: BorderRadius.all(Radius.circular(4))
                ),
                child: Text(
                    abilityCode.title.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 9
                    )
                )
            )
        );
    }

    void _showAbilityDialog(BuildContext context, WeaponAbilitiesCode abilityCode)
    {
        /// Ищем описание в списке загруженных абилок
        final abilityData = weaponAbilities.where((a) => a.code == abilityCode.code).firstOrNull;

        if (abilityData != null)
        {

            final WeaponAbilityDOM weaponAbility = WeaponAbilityDOM(
                id: '',
                code: abilityData.code,
                name: abilityData.name,
                shortDescription: abilityData.shortDescription,
                description: abilityData.description
            );

            showDialog(
                context: context,
                builder: (context)
                {
                    return AlertDialog(
                        backgroundColor: const Color.fromARGB(255, 45, 45, 45),
                        contentPadding: const EdgeInsets.all(8),
                        content: 
                        Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                                SizedBox(
                                    width: double.maxFinite,
                                    child: WeaponAbilityBloc(abilities: [weaponAbility as BaseAbilityDom])
                                )
                            ]
                        ),
                        actions: [
                            TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("CLOSE", style: TextStyle(color: Colors.blue))
                            )
                        ]
                    );
                }
            );
        }
    }

}

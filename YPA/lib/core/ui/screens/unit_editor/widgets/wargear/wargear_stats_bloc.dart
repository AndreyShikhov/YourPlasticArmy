/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
import 'package:ypa/core/ui/screens/unit_editor/widgets/base_ability_bloc.dart';
import 'package:ypa/core/ui/screens/unit_editor/widgets/wargear/wargear_bloc.dart';
import 'package:ypa/domain/models/abilities/base_ability.dart';

import '../../../../../../domain/models/abilities/weapon_ability/weapon_ability.dart';
import '../../../../../../domain/models/unit/unit.dart';
import '../../unit_editor_controller.dart';

/// --- КОНСТАНТЫ СТИЛЕЙ И ДЕКОРАЦИЙ ДЛЯ ОПТИМИЗАЦИИ ---
const _kAbilityTextStyle = TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 9);
const _kAbilityDecoration = BoxDecoration(color: Color.fromARGB(153, 0, 0, 0), borderRadius: BorderRadius.all(Radius.circular(4)));
const _kModelNameStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12);
const _kStatUsedHeaderStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14);
const _kStatUnusedHeaderStyle = TextStyle(color: Color.fromARGB(153, 143, 143, 143), fontWeight: FontWeight.bold, fontSize: 14);
const _kStatUsedStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);
const _kStatUnusedStyle = TextStyle(color: Color.fromARGB(153, 143, 143, 143), fontWeight: FontWeight.bold, fontSize: 16);
const _kNameUsedStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13);
const _kNameUnusedStyle = TextStyle(color: Color.fromARGB(153, 143, 143, 143), fontWeight: FontWeight.bold, fontSize: 13);
const _kAmountStyle = TextStyle(color: Color.fromARGB(215, 255, 174, 0), fontWeight: FontWeight.bold, fontSize: 13);

class WargearStatsBloc extends ConsumerStatefulWidget
{
    final  (String, String, String) ids;

    const WargearStatsBloc({super.key, required this.ids});

    @override
    ConsumerState<WargearStatsBloc> createState() => _WargearStatsBlocState();
}

class _WargearStatsBlocState extends ConsumerState<WargearStatsBloc>
{
    late final PageController _pageController;
    late final ValueNotifier<int> _currentPageNotifier;

    @override
    void initState()
    {
        super.initState();
        _pageController = PageController(viewportFraction: 1.0);
        _currentPageNotifier = ValueNotifier<int>(0);
    }

    @override
    void dispose()
    {
        _pageController.dispose();
        _currentPageNotifier.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context)
    {
        final (weaponInfo, modelStats) = ref.watch(unitEditorControllerProvider(widget.ids).select((s) => (
                s.unit?.weaponInfo,
                s.unit?.modelStats
                )));

        final weaponAbilities = ref.watch(unitEditorControllerProvider(widget.ids).select((s) => s.weaponAbilities));

        if (weaponInfo == null || modelStats == null) return const SizedBox.shrink();

        final screenWidth = MediaQuery.sizeOf(context).width;
        final isWide = screenWidth > 900;

        if (isWide)
        {
            return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                    children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Expanded(child: _buildCategorySection(weaponInfo, modelStats, weaponAbilities, WeaponType.ranged)),
                                const SizedBox(width: 32),
                                Expanded(child: _buildCategorySection(weaponInfo, modelStats, weaponAbilities, WeaponType.melee))
                            ]
                        ),
                        const SizedBox(height: 10),
                        Wargear(ids: widget.ids)
                    ]
                )
            );
        }

        return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    SizedBox(
                        height: 450,
                        child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(
                                dragDevices: {
                                    PointerDeviceKind.touch,
                                    PointerDeviceKind.mouse,
                                    PointerDeviceKind.trackpad,
                                },
                            ),
                            child: PageView(
                                controller: _pageController,
                                onPageChanged: (int page) => _currentPageNotifier.value = page,
                                children: [
                                    SingleChildScrollView(child: _buildCategorySection(weaponInfo, modelStats, weaponAbilities, WeaponType.ranged)),
                                    SingleChildScrollView(child: _buildCategorySection(weaponInfo, modelStats, weaponAbilities, WeaponType.melee))
                                ]
                            ),
                        )
                    ),
                    const SizedBox(height: 4),
                    ValueListenableBuilder<int>(
                        valueListenable: _currentPageNotifier,
                        builder: (context, currentPage, _) => _buildPageIndicator(2, currentPage),
                    ),
                    const SizedBox(height: 10),
                    Wargear(ids: widget.ids)
                ]
            )
        );
    }

    Widget _buildPageIndicator(int pageCount, int currentPage)
    {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(pageCount, (index)
                {
                    return GestureDetector(
                        onTap: () => _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
                        child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                height: 8,
                                width: currentPage == index ? 24 : 8,
                                decoration: BoxDecoration(
                                    color: currentPage == index ? Colors.blueAccent : Colors.white24,
                                    borderRadius: BorderRadius.circular(4)
                                )
                            ),
                        ),
                    );
                })
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
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

        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 4.0, left: 4.0, bottom: 2.0),
                            child: Text(modelName, style: _kModelNameStyle)
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: _getRowsWeaponProfiles(weapon)
            )
        );
    }

    List<Widget> _getRowsWeaponProfiles(WeaponDom weapon)
    {
        List<Widget> res = [];

        weapon.weapons.forEach((key, value)
            {
                final String fullName = key.isEmpty ? weapon.name : '${weapon.name} - $key';
                res.add(
                    Row(
                        children: [
                            _NameWeapon(fullName, isUsed, amount),
                            const Spacer(),
                            _StatBox('${value.range}"', isUsed: isUsed, width: 45),
                            _StatBox(value.attacks, isUsed: isUsed),
                            _StatBox('${value.skill}+', isUsed: isUsed),
                            _StatBox('${value.strength}', isUsed: isUsed),
                            _StatBox('${value.ap.abs() * -1}', isUsed: isUsed),
                            _StatBox(value.damage, isUsed: isUsed),
                        ]
                    )
                );

                if (value.weaponAbilities.isNotEmpty)
                {
                    res.add(Padding(
                            padding: const EdgeInsets.only(left: 4.0, bottom: 4.0, right: 4.0),
                            child: _WeaponAbilitiesBTN(abilities: value.weaponAbilities, weaponAbilities: weaponAbilities)
                        ));
                }
            });

        return res;
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
        final skillLabel = isRanged ? 'BS' : 'WS';

        return DecoratedBox(
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4))
            ),
            child: SizedBox(height: 35,
                child: Row(
                    children: [
                        const SizedBox(width: 4),
                        SizedBox(width: 140,
                            child: Text(isRanged ? 'Ranged' : 'Melee', style: _kStatUsedHeaderStyle, textAlign: TextAlign.center)
                        ),
                        const Spacer(),
                        const _StatBox('Range', isHeader: true, width: 45),
                        const _StatBox('A', isHeader: true),
                        _StatBox(skillLabel, isHeader: true),
                        const _StatBox('S', isHeader: true),
                        const _StatBox('AP', isHeader: true),
                        const _StatBox('D', isHeader: true),
                    ]
                )
            )
        );
    }
}

class _StatBox extends StatelessWidget
{
    final String value;
    final bool isHeader;
    final bool isUsed;
    final double width;

    const _StatBox(
        this.value,
        {this.isHeader = false,
            this.isUsed = true,
            this.width = 34}
    );

    @override
    Widget build(BuildContext context)
    {
        final style = isHeader ? (isUsed ? _kStatUsedHeaderStyle : _kStatUnusedHeaderStyle) : (isUsed ? _kStatUsedStyle : _kStatUnusedStyle);
        
        return SizedBox(
            width: width,
            height: 34,
            child: Center(
                child: value.length > 3
                    ? FittedBox(fit: BoxFit.scaleDown, child: Text(value, style: style))
                    : Text(value, style: style),
            ),
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
        return SizedBox(
            width: 140,
            child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                    children: [
                        if (amount > 0)
                        Text(
                            '$amount x ',
                            style: _kAmountStyle
                        ),
                        Expanded(
                            child: Text(
                                value,
                                style: isUsed ? _kNameUsedStyle : _kNameUnusedStyle,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis
                            )
                        )
                    ]
                )
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
            alignment: WrapAlignment.start,
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
            child: DecoratedBox(
                decoration: _kAbilityDecoration,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Text(
                        abilityCode.title.toUpperCase(),
                        style: _kAbilityTextStyle,
                    )
                )
            )
        );
    }

    void _showAbilityDialog(BuildContext context, WeaponAbilitiesCode abilityCode)
    {
        final abilityData = weaponAbilities.where((a) => a.code == abilityCode.code).firstOrNull;

        if (abilityData != null)
        {
            showDialog(
                context: context,
                builder: (context)
                {
                    return AlertDialog(
                        backgroundColor: const Color.fromARGB(255, 45, 45, 45),
                        content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                                SizedBox(
                                    width: double.maxFinite,
                                    child: WeaponAbilityBloc(abilities: [abilityData as BaseAbilityDom])
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

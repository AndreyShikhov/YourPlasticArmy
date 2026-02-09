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
        final modelStats = ref.watch(unitEditorControllerProvider(ids).select((s) => s.unit?.modelStats));
        /// Подписываемся на загруженные абилки оружия
        final weaponAbilities = ref.watch(unitEditorControllerProvider(ids).select((s) => s.weaponAbilities));

        if (modelStats == null) return const SizedBox.shrink();

        final screenWidth = MediaQuery.sizeOf(context).width;
        /// Порог для перехода на десктопный режим (850-900 пикселей обычно достаточно)
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
                        _buildCategorySection(modelStats, weaponAbilities, WeaponType.ranged),
                        const SizedBox(width: 32), /// Контролируемый зазор между таблицами
                        _buildCategorySection(modelStats, weaponAbilities, WeaponType.melee)
                    ]
                )
            );
        }

        /// Режим для смартфонов: Карусель (PageView)
        return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                    SizedBox(
                        height: 400, /// Фиксированная высота для карусели
                        child: PageView(
                            controller: PageController(viewportFraction: 1.0),
                            children: [
                                SingleChildScrollView(child: _buildCategorySection(modelStats, weaponAbilities, WeaponType.ranged)),
                                SingleChildScrollView(child: _buildCategorySection(modelStats, weaponAbilities, WeaponType.melee))
                            ]
                        )
                    )
                ]
            )
        );
    }

    /// Вспомогательный метод для создания блока категории (Дальнее или Ближнее)
    Widget _buildCategorySection(Map<String, ModelStatsDom> modelStats, List<WeaponAbilityDOM> weaponAbilities, WeaponType type)
    {
        return DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6)
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                    _WeaponCategoryHeader(type: type),
                    _WeaponTypeGroup(modelsStats: modelStats, weaponAbilities: weaponAbilities, type: type)
                ]
            )
        );
    }
}

class _WeaponTypeGroup extends StatelessWidget
{
    final Map<String, ModelStatsDom> modelsStats;
    final List<WeaponAbilityDOM> weaponAbilities;
    final WeaponType type;

    const _WeaponTypeGroup({required this.modelsStats, required this.weaponAbilities, required this.type});

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
                    selectedWeapons: selectedWeapons,
                    weaponAbilities: weaponAbilities
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
    final List<WeaponAbilityDOM> weaponAbilities;

    const _ModelWeaponBlock({
        required this.modelName,
        required this.availableWeapons,
        required this.selectedWeapons,
        required this.weaponAbilities
    });

    @override
    Widget build(BuildContext context)
    {
        List<Widget> weaponRows = [];
        List<Widget> unusedWeaponRows = [];
        bool isLight = false;

        for (final weapon in availableWeapons)
        {
            final isUsed = selectedWeapons.contains(weapon.name);
            if (isUsed) isLight = !isLight;

            isUsed ? weaponRows.add(_WeaponRow(
                weapon: weapon,
                isUsed: isUsed,
                isLight: isLight,
                weaponAbilities: weaponAbilities
            )) : unusedWeaponRows.add(_WeaponRow(
                weapon: weapon,
                isUsed: isUsed,
                isLight: isLight,
                weaponAbilities: weaponAbilities
            ));
        }

        /// не используемые должны быть всегда последними
        weaponRows.addAll(unusedWeaponRows);

        return Padding(
            /// Убрали горизонтальный отступ, чтобы ширина совпадала с заголовком
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white12),
                    borderRadius: BorderRadius.circular(4)
                ),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
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

    const _WeaponRow({
        required this.weapon,
        required this.isUsed,
        required this.weaponAbilities,
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
                    Row(          /// строка со статами оружия
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            _NameWeapon(weapon.name, isUsed),
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

    const _NameWeapon(this.value, this.isUsed);

    @override
    Widget build(BuildContext context)
    {
        return SizedBox(
            /// Синхронизировали ширину с заголовком (было 130)
            width: 140,
            child: Padding(
                padding: const EdgeInsets.only(left: 4.0, top: 4.0, bottom: 4.0),
                child: Align(
                    alignment: Alignment.centerLeft,
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
                    )
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

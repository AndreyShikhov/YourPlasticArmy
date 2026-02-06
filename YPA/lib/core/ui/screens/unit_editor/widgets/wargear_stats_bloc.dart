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

        final screenWidth = MediaQuery.sizeOf(context).width;
        /// Порог для перехода на десктопный режим (850-900 пикселей обычно достаточно)
        final isWide = screenWidth > 900;

        if (isWide)
        {
            return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, /// Центрируем группу таблиц
                    mainAxisSize: MainAxisSize.min,             /// Строка сжимается до размера контента
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        _buildCategorySection(modelStats, WeaponType.ranged),
                        const SizedBox(width: 32), /// Контролируемый зазор между таблицами
                        _buildCategorySection(modelStats, WeaponType.melee)
                    ]
                )
            );
        }

        /// Режим для смартфонов: Карусель (PageView)
        return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
                children: [

                    SizedBox(
                        height: 400, /// Фиксированная высота для карусели
                        child: PageView(
                            controller: PageController(viewportFraction: 1.0),
                            children: [
                                SingleChildScrollView(child: _buildCategorySection(modelStats, WeaponType.ranged)),
                                SingleChildScrollView(child: _buildCategorySection(modelStats, WeaponType.melee))
                            ]
                        )
                    )
                ]
            )
        );
    }

    /// Вспомогательный метод для создания блока категории (Дальнее или Ближнее)
    Widget _buildCategorySection(Map<String, ModelStatsDom> modelStats, WeaponType type)
    {
        return DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6)
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                    _WeaponCategoryHeader(type: type),
                    _WeaponTypeGroup(modelsStats: modelStats, type: type)
                ]
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
        List<Widget> unusedWeaponRows = [];
        bool isLight = false;

        for (final weapon in availableWeapons)
        {
            final isUsed = selectedWeapons.contains(weapon.name);
            if (isUsed) isLight = !isLight;

            isUsed ? weaponRows.add(_WeaponRow(
                        weapon: weapon,
                        isUsed: isUsed,
                        isLight: isLight
                    )) : unusedWeaponRows.add(_WeaponRow(
                        weapon: weapon,
                        isUsed: isUsed,
                        isLight: isLight
                    ));
        }

        /// не используемые должны быт ьвсегда последними
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

    const _WeaponRow({
        required this.weapon,
        required this.isUsed,
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
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                    _NameWeapon(weapon.name, isUsed),
                    SizedBox(width: 60, child: Center(child: Text('${weapon.range}"', style: TextStyle(color: isUsed ? Colors.white : const Color.fromARGB(153, 143, 143, 143))))),
                    _StatBox(weapon.attacks, isUsed: isUsed),
                    _StatBox('${weapon.skill}+', isUsed: isUsed),
                    _StatBox('${weapon.strength}', isUsed: isUsed),
                    _StatBox('-${weapon.ap}', isUsed: isUsed),
                    _StatBox(weapon.damage, isUsed: isUsed)
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
                mainAxisSize: MainAxisSize.min,
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

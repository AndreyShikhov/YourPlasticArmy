/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../domain/models/unit/unit.dart';
import '../../../../../database/tables/seed/seed_objects/_types.dart';
import '../../unit_editor_controller.dart';

class Wargear extends ConsumerStatefulWidget
{
    final  (String, String, String) ids;

    const Wargear({
        super.key,
        required this.ids
    });

    @override
    ConsumerState<Wargear> createState() => _WargearState();
}

class _WargearState extends ConsumerState<Wargear>
{
    late final PageController _pageController;
    int _currentPage = 0;

    @override
    void initState()
    {
        super.initState();
        _pageController = PageController(viewportFraction: 1.0);
    }

    @override
    void dispose()
    {
        _pageController.dispose();
        super.dispose();
    }

    @override
    Widget build(BuildContext context)
    {
        final (weaponInfo, modelStats, composition) = ref.watch(unitEditorControllerProvider(widget.ids).select((s) => (
                s.unit?.weaponInfo,
                s.unit?.modelStats,
                s.unit?.unitComposition
                )));

        if (modelStats == null) return const SizedBox.shrink();

        final allWargear = _getAllWargear(modelStats);
        if (allWargear.isEmpty) return const SizedBox.shrink();

        return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                    SizedBox(
                        height: 250,
                        child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(
                                dragDevices:
                                {
                                    PointerDeviceKind.touch,
                                    PointerDeviceKind.mouse,
                                    PointerDeviceKind.trackpad
                                }
                            ),
                            child: PageView(
                                controller: _pageController,
                                onPageChanged: (int page)
                                {
                                    setState(()
                                        {
                                            _currentPage = page;
                                        });
                                },
                                children: _buildWargearSections(allWargear, composition!, weaponInfo)
                            )
                        )
                    ),
                    if (allWargear.length > 1) ...[
                        const SizedBox(height: 12),
                        _buildPageIndicator(allWargear.length)
                    ]
                ]
            )
        );
    }

    /// Рисуем точки и стрелки навигации
    Widget _buildPageIndicator(int pageCount)
    {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                IconButton(
                    onPressed: _currentPage > 0 
                        ? () => _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut)
                        : null,
                    icon: const Icon(Icons.arrow_back_ios, size: 16, color: Colors.white70)
                ),
                ...List.generate(pageCount, (index)
                    {
                        return GestureDetector(
                            onTap: () => _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
                            child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                    height: 8,
                                    width: _currentPage == index ? 24 : 8,
                                    decoration: BoxDecoration(
                                        color: _currentPage == index ? Colors.blueAccent : Colors.white24,
                                        borderRadius: BorderRadius.circular(4)
                                    )
                                )
                            )
                        );
                    }),
                IconButton(
                    onPressed: _currentPage < pageCount - 1
                        ? () => _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut)
                        : null,
                    icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white70)
                )
            ]
        );
    }

    List<WargearOptionsDom> _getAllWargear(Map<String, ModelStatsDom> allStats)
    {
        List<WargearOptionsDom> res = [];
        allStats.forEach((key, value)
            {
                res.addAll(value.wargearOptions);
            });
        return res;
    }

    List<Widget> _buildWargearSections(
        List<WargearOptionsDom> allWargears,
        UnitCompositionDom composition,
        List< ({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})>? weaponInfo)
    {
        return allWargears.map((wargear) => SingleChildScrollView(
                child: _buildWargearSection(wargear, composition, weaponInfo)
            )).toList();
    }

    Widget _buildWargearSection(
        WargearOptionsDom wargear,
        UnitCompositionDom composition,
        List< ({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})>? weaponInfo)
    {
        List<Widget> widgetsToSelect = [];
        if (wargear.conditionCount.isNotEmpty)
        {
            final condition = wargear.conditionCount.keys.first;
            final count = wargear.conditionCount.values.first;
            int amountModifers = 0;

            switch (condition)
            {
                case WargearConditionCount.none:
                    break;
                case WargearConditionCount.only:
                    amountModifers = 1; /// условимся что это работает только дял одной модели юнита указанной в названии

                    /// 1. Находим, сколько пушек из этой опции уже экипировано у этой модели
                    final replacementWeapons = wargear.replaceWeapons.values.first;
                    final currentEquippedAmount = weaponInfo?.where((info) =>
                        info.modelName == wargear.modelName &&
                            replacementWeapons.contains(info.weaponName)
                    ).firstOrNull?.amount ?? 0;

                    for (int i = 0; i < amountModifers; i++)
                    {
                        /// Чекбокс "выбран", если его индекс меньше количества реально взятого оружия
                        final isThisSelected = i < currentEquippedAmount;

                        widgetsToSelect.add(
                            _WargearCheckbox(
                                isSelected: isThisSelected, /// Теперь он берет данные из стейта!
                                onChanged: (bool? newValue)
                                {
                                    final notifier = ref.read(unitEditorControllerProvider(widget.ids).notifier);
                                    final replaceKeys = wargear.replaceWeapons.keys.first;
                                    final replaceValues = wargear.replaceWeapons.values.first;

                                    if (newValue == true)
                                    {
                                        notifier.replaceWeapon(wargear.modelName, replaceKeys, replaceValues);
                                    } else
                                    {
                                        notifier.replaceWeapon(wargear.modelName, replaceValues, replaceKeys);
                                    }
                                },
                                titles: wargear.replaceWeapons.values.first
                            )
                        );
                    }
                    break;
                case WargearConditionCount.upTo:
                    amountModifers = wargear.conditionCount.values.first;

                    final replacementWeapons = wargear.replaceWeapons.values.first;
                    final currentEquippedAmount = weaponInfo?.where((info) =>
                    info.modelName == wargear.modelName &&
                        replacementWeapons.contains(info.weaponName)
                    ).firstOrNull?.amount ?? 0;

                    for (int i = 0; i < amountModifers; i++)
                    {
                      /// Чекбокс "выбран", если его индекс меньше количества реально взятого оружия
                      final isThisSelected = i < currentEquippedAmount;

                      widgetsToSelect.add(
                          _WargearCheckbox(
                              isSelected: isThisSelected, /// Теперь он берет данные из стейта!
                              onChanged: (bool? newValue)
                              {
                                final notifier = ref.read(unitEditorControllerProvider(widget.ids).notifier);
                                final replaceKeys = wargear.replaceWeapons.keys.first;
                                final replaceValues = wargear.replaceWeapons.values.first;

                                if (newValue == true)
                                {
                                  notifier.replaceWeapon(wargear.modelName, replaceKeys, replaceValues);
                                } else
                                {
                                  notifier.replaceWeapon(wargear.modelName, replaceValues, replaceKeys);
                                }
                              },
                              titles: wargear.replaceWeapons.values.first
                          )
                      );
                    }
                    break;
                case WargearConditionCount.all:
                    amountModifers = composition.totalUnitAmount;
                    /// 1. Находим, сколько пушек из этой опции уже экипировано у этой модели
                    final replacementWeapons = wargear.replaceWeapons.values.first;
                    final currentEquippedAmount = weaponInfo?.where((info) =>
                        info.modelName == wargear.modelName &&
                            replacementWeapons.contains(info.weaponName)
                    ).firstOrNull?.amount ?? 0;

                    for (int i = 0; i < amountModifers; i++)
                    {
                        /// Чекбокс "выбран", если его индекс меньше количества реально взятого оружия
                        final isThisSelected = i < currentEquippedAmount;

                        widgetsToSelect.add(
                            _WargearCheckbox(
                                isSelected: isThisSelected, /// Теперь он берет данные из стейта!
                                onChanged: (bool? newValue)
                                {
                                    final notifier = ref.read(unitEditorControllerProvider(widget.ids).notifier);
                                    final replaceKeys = wargear.replaceWeapons.keys.first;
                                    final replaceValues = wargear.replaceWeapons.values.first;

                                    if (newValue == true)
                                    {
                                        notifier.replaceWeapon(wargear.modelName, replaceKeys, replaceValues);
                                    } else
                                    {
                                        notifier.replaceWeapon(wargear.modelName, replaceValues, replaceKeys);
                                    }
                                },
                                titles: wargear.replaceWeapons.values.first
                            )
                        );
                    }

                    break;
                case WargearConditionCount.forEvery:
                    amountModifers = (composition.totalUnitAmount / count).truncate();
                    /// 1. Находим, сколько пушек из этой опции уже экипировано у этой модели
                    final replacementWeapons = wargear.replaceWeapons.values.first;
                    final currentEquippedAmount = weaponInfo?.where((info) =>
                        info.modelName == wargear.modelName &&
                            replacementWeapons.contains(info.weaponName)
                    ).firstOrNull?.amount ?? 0;

                    for (int i = 0; i < amountModifers; i++)
                    {
                        /// Чекбокс "выбран", если его индекс меньше количества реально взятого оружия
                        final isThisSelected = i < currentEquippedAmount;

                        widgetsToSelect.add(
                            _WargearCheckbox(
                                isSelected: isThisSelected, /// Теперь он берет данные из стейта!
                                onChanged: (bool? newValue)
                                {
                                    final notifier = ref.read(unitEditorControllerProvider(widget.ids).notifier);
                                    final replaceKeys = wargear.replaceWeapons.keys.first;
                                    final replaceValues = wargear.replaceWeapons.values.first;

                                    if (newValue == true)
                                    {
                                        notifier.replaceWeapon(wargear.modelName, replaceKeys, replaceValues);
                                    } else
                                    {
                                        notifier.replaceWeapon(wargear.modelName, replaceValues, replaceKeys);
                                    }
                                },
                                titles: wargear.replaceWeapons.values.first
                            )
                        );
                    }
                    break;
            }
        }

        /// 2. Возврат верстки
        return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(

                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    Center(
                        child: Text(
                            wargear.text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white, fontSize: 16, height: 1.4)
                        )
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                            SizedBox(height: 160,
                                child: Wrap(
                                    direction: Axis.vertical, /// Элементы идут сверху вниз, затем в новую колонку
                                    runSpacing: 20,   /// Расстояние между самими колонками
                                    spacing: 0, /// Расстояние между элементами внутри одной колонки
                                    children: widgetsToSelect
                                ) 

                            )
                        ]
                    )
                ]
            )
        );
    }
}

class _WargearCheckbox extends StatelessWidget
{

    final bool isSelected;
    final ValueChanged<bool?> onChanged;
    final List<String> titles;

    const _WargearCheckbox({
        required this.isSelected,
        required this.onChanged,
        required this.titles
    });

    @override
    Widget build(BuildContext context)
    {

        List<Widget> widgetsTitle = [];
        for (String title in titles)
        {
            widgetsTitle.add(Text(title, style: const TextStyle(color: Colors.white, fontSize: 12)));
            widgetsTitle.add(const SizedBox(width: 4));
        }

        return IntrinsicWidth(
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                    Checkbox(
                        visualDensity: VisualDensity.compact,
                        value: isSelected,
                        activeColor: Colors.orangeAccent,
                        onChanged: (bool? newValue)
                        {
                            onChanged(newValue);
                        }
                    ),
                    const SizedBox(width: 4),
                    Row(children: widgetsTitle)
                ]
            )
        );
    }
}

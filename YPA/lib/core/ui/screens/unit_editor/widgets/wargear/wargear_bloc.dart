/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'dart:ui';

import 'package:collection/collection.dart';
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

    Widget _buildWargearSection(WargearOptionsDom wargear,
        UnitCompositionDom composition,
        List< ({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})>? weaponInfo)
    {
        if (wargear.conditionCount.isEmpty) return const SizedBox.shrink();

        final condition = wargear.conditionCount.keys.first;
        final hasReplaceOptions = wargear.replaceWeapons.isNotEmpty;
        final isReplace = wargear.additionalWeapons.isEmpty && hasReplaceOptions;
        final isMultipleChoice = wargear.replaceWeapons.length > 1;

        final comparisonWeapons = hasReplaceOptions 
            ? wargear.replaceWeapons.values.firstOrNull ?? [] 
            : wargear.additionalWeapons;

        final currentEquippedCount = _getEquippedAmount(wargear.modelName, comparisonWeapons, weaponInfo);

        List<Widget> widgets = [];

        if (condition == WargearConditionCount.only && isMultipleChoice)
        {
            widgets = _buildRadioGroup(wargear, weaponInfo);
        } else
        {
            final limit = _calculateLimit(condition, wargear, composition);
            widgets = List.generate(limit, (index) =>
                _buildCheckboxItem(wargear, index < currentEquippedCount, isReplace)
            );
        }

        return _buildSectionLayout(wargear.text, widgets);
    }

    int _calculateLimit(WargearConditionCount condition, WargearOptionsDom wargear, UnitCompositionDom composition)
    {
        switch (condition)
        {
            case WargearConditionCount.upTo: return wargear.conditionCount.values.firstOrNull ?? 0;
            case WargearConditionCount.all: return composition.totalUnitAmount;
            case WargearConditionCount.forEvery:
                final count = wargear.conditionCount.values.firstOrNull ?? 1;
                return (composition.totalUnitAmount / (count > 0 ? count : 1)).truncate();
            case WargearConditionCount.only: return 1;
            default: return 0;
        }
    }

    int _getEquippedAmount(String modelName, List<String> weapons, List<dynamic>? weaponInfo)
    {
        return weaponInfo?.where((info) =>
            info.modelName == modelName && weapons.contains(info.weaponName)
        ).firstOrNull?.amount ?? 0;
    }

    List<Widget> _buildRadioGroup(WargearOptionsDom wargear, List<dynamic>? weaponInfo)
    {
        final notifier = ref.read(unitEditorControllerProvider(widget.ids).notifier);

        final selectedEntry = wargear.replaceWeapons.entries.firstWhereOrNull((entry) =>
            weaponInfo?.any((info) =>
                info.modelName == wargear.modelName &&
                    entry.value.contains(info.weaponName) &&
                    info.isEquiped && info.amount > 0
            ) ?? false
        );

        return [
            RadioGroup<List<String>>(
                groupValue: selectedEntry?.key,
                onChanged: (List<String>? baseOption)
                {
                    if (baseOption != null)
                    {
                        final replacementOption = wargear.replaceWeapons[baseOption];
                        if (replacementOption != null) 
                        {
                            notifier.replaceWeapon(wargear.modelName, baseOption, replacementOption);
                        }
                    }
                },
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: wargear.replaceWeapons.entries.map((entry)
                        {
                            return _WargearRadio(
                                value: entry.key,
                                titles: entry.value
                            );
                        }).toList()
                )
            )
        ];
    }

    Widget _buildCheckboxItem(WargearOptionsDom wargear, bool isSelected, bool isReplace)
    {
        final notifier = ref.read(unitEditorControllerProvider(widget.ids).notifier);
        final replaceKeys = isReplace ? (wargear.replaceWeapons.keys.firstOrNull ?? []) : <String>[];
        final replaceValues = isReplace ? (wargear.replaceWeapons.values.firstOrNull ?? []) : <String>[];

        return _WargearCheckbox(
            isSelected: isSelected,
            onChanged: (bool? newValue)
            {
                if (newValue == true)
                {
                    isReplace ? notifier.replaceWeapon(wargear.modelName, replaceKeys, replaceValues)
                        : notifier.addWeapon(wargear.modelName, wargear.additionalWeapons, true);
                } else
                {
                    isReplace ? notifier.replaceWeapon(wargear.modelName, replaceValues, replaceKeys)
                        : notifier.addWeapon(wargear.modelName, wargear.additionalWeapons, false);
                }
            },
            titles: isReplace ? replaceValues : wargear.additionalWeapons
        );
    }

    Widget _buildSectionLayout(String title, List<Widget> children)
    {
        return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                children: [
                    Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 16)),
                    const SizedBox(height: 16),
                    SizedBox(
                        height: 160,
                        child: Wrap(
                            direction: Axis.vertical,
                            runSpacing: 20,
                            children: children
                        )
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

class _WargearRadio extends StatelessWidget
{
    final List<String> value;
    final List<String> titles;

    const _WargearRadio({
        required this.value,
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
                    Radio<List<String>>(
                        value: value
                    ),
                    const SizedBox(width: 4),
                    Row(children: widgetsTitle)
                ]
            )
        );
    }
}

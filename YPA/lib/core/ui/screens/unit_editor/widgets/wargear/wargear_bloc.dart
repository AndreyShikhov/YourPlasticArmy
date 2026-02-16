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
    const Wargear({super.key, required this.ids});

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
        final (modelStats, composition, snapshot) = ref.watch(unitEditorControllerProvider(widget.ids).select((s) => (
                s.unit?.modelStats,
                s.unit?.unitComposition,
                s.unit?.selectedWargearIndices
                )));

        if (modelStats == null || snapshot == null) return const SizedBox.shrink();

        final allWargearWithModel = _getAllWargearWithModel(modelStats);
        if (allWargearWithModel.isEmpty) return const SizedBox.shrink();

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
                                dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse, PointerDeviceKind.trackpad}
                            ),
                            child: PageView(
                                controller: _pageController,
                                onPageChanged: (int page) => setState(() => _currentPage = page),
                                children: allWargearWithModel.map((item) => SingleChildScrollView(
                                        child: _buildWargearSection(item.modelName, item.option, item.index, composition!, snapshot)
                                    )).toList()
                            )
                        )
                    ),
                    if (allWargearWithModel.length > 1) ...[
                        const SizedBox(height: 12),
                        _buildPageIndicator(allWargearWithModel.length)
                    ]
                ]
            )
        );
    }

    List< ({String modelName, WargearOptionsDom option, int index})> _getAllWargearWithModel(Map<String, ModelStatsDom> allStats) 
    {
        List< ({String modelName, WargearOptionsDom option, int index})> res = [];
        allStats.forEach((modelName, stats)
            {
                for (int i = 0; i < stats.wargearOptions.length; i++)
                {
                    res.add((modelName: modelName, option: stats.wargearOptions[i], index: i));
                }
            });
        return res;
    }

    Widget _buildWargearSection(String modelName, WargearOptionsDom option, int optionIdx, UnitCompositionDom composition, Map<String, List<int>> snapshot) 
    {
        final optionId = "$modelName-$optionIdx";
        final condition = option.conditionCount.keys.firstOrNull ?? WargearConditionCount.none;
        final selectedIndices = snapshot[optionId] ?? [];

        List<Widget> widgets = [];
        final notifier = ref.read(unitEditorControllerProvider(widget.ids).notifier);

        if (condition == WargearConditionCount.only && option.replaceWeapons.length > 1) 
        {
            // Radio логика
            final int? selectedIdx = selectedIndices.firstOrNull;
            widgets = [
              RadioGroup<int>(
                  groupValue: selectedIdx,
                  onChanged: (int? index) => notifier.toggleWargearRadio(optionId, index),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: option.replaceWeapons.entries.mapIndexed((idx, entry)
                      {
                        return _WargearRadio(
                            value: idx,
                            groupValue: selectedIdx,
                            onChanged: (val) => notifier.toggleWargearRadio(optionId, val),
                            titles: entry.value
                        );
                      }).toList()
                  )
              )
            ];
        } else 
        {
            /// Checkbox логика
            final limit = _calculateLimit(condition, option, composition);
            widgets = List.generate(limit, (idx)
                {
                    final isSelected = selectedIndices.contains(idx);
                    final titles = option.replaceWeapons.isNotEmpty
                        ? option.replaceWeapons.values.firstOrNull ?? []
                        : option.additionalWeapons;

                    return _WargearCheckbox(
                        isSelected: isSelected,
                        onChanged: (val) => notifier.toggleWargearCheckbox(optionId, idx, val == true),
                        titles: titles
                    );
                });
        }

        return _buildSectionLayout(option.text, widgets);
    }

    int _calculateLimit(WargearConditionCount condition, WargearOptionsDom option, UnitCompositionDom composition) 
    {
        switch (condition)
        {
            case WargearConditionCount.upTo: return option.conditionCount.values.firstOrNull ?? 0;
            case WargearConditionCount.all: return composition.totalUnitAmount;
            case WargearConditionCount.forEvery:
                final count = option.conditionCount.values.firstOrNull ?? 1;
                return (composition.totalUnitAmount / (count > 0 ? count : 1)).truncate();
            case WargearConditionCount.only: return 1;
            default: return 0;
        }
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
                        child: Wrap(direction: Axis.vertical, runSpacing: 20, children: children)
                    )
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
                    onPressed: _currentPage > 0 ? () => _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut) : null,
                    icon: const Icon(Icons.arrow_back_ios, size: 16, color: Colors.white70)
                ),
                ...List.generate(pageCount, (index) => GestureDetector(
                        onTap: () => _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
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
                    )),
                IconButton(
                    onPressed: _currentPage < pageCount - 1 ? () => _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut) : null,
                    icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white70)
                )
            ]
        );
    }
}

class _WargearCheckbox extends StatelessWidget
{
    final bool isSelected;
    final ValueChanged<bool?> onChanged;
    final List<String> titles;

    const _WargearCheckbox({required this.isSelected, required this.onChanged, required this.titles});

    @override
    Widget build(BuildContext context) 
    {
        return IntrinsicWidth(
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                    Checkbox(
                        visualDensity: VisualDensity.compact,
                        value: isSelected,
                        activeColor: Colors.orangeAccent,
                        onChanged: onChanged
                    ),
                    const SizedBox(width: 4),
                    ...titles.map((t) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Text(t, style: const TextStyle(color: Colors.white, fontSize: 12))
                        ))
                ]
            )
        );
    }
}

class _WargearRadio extends StatelessWidget
{
    final int value;
    final int? groupValue;
    final ValueChanged<int?> onChanged;
    final List<String> titles;

    const _WargearRadio({
        required this.value, 
        required this.groupValue,
        required this.onChanged,
        required this.titles
    });

    @override
    Widget build(BuildContext context) 
    {
        return IntrinsicWidth(
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                    Radio<int>(
                        value: value, 
                        groupValue: groupValue,
                        toggleable: true,
                        onChanged: onChanged,
                    ),
                    const SizedBox(width: 4),
                    ...titles.map((t) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Text(t, style: const TextStyle(color: Colors.white, fontSize: 12))
                        ))
                ]
            )
        );
    }
}

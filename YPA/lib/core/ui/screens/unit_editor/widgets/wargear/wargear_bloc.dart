/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../domain/models/unit/unit.dart';
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
        final (weaponInfo, modelStats) = ref.watch(unitEditorControllerProvider(widget.ids).select((s) => (
                s.unit?.weaponInfo,
                s.unit?.modelStats
                )));

        if (modelStats == null) return const SizedBox.shrink();

        final allWargear = _getAllWargear(modelStats);
        if (allWargear.isEmpty) return const SizedBox.shrink();

        return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    SizedBox(
                        height: 600,
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
                                onPageChanged: (int page) {
                                    setState(() {
                                        _currentPage = page;
                                    });
                                },
                                children: _buildWargearSections(allWargear)
                            ),
                        )
                    ),
                    if (allWargear.length > 1) ...[
                        const SizedBox(height: 12),
                        _buildPageIndicator(allWargear.length),
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
                    icon: const Icon(Icons.arrow_back_ios, size: 16, color: Colors.white70),
                ),
                ...List.generate(pageCount, (index) {
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
                                    borderRadius: BorderRadius.circular(4),
                                ),
                            ),
                        ),
                    );
                }),
                IconButton(
                    onPressed: _currentPage < pageCount - 1
                        ? () => _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut)
                        : null,
                    icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white70),
                ),
            ],
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

    List<Widget> _buildWargearSections(List<WargearOptionsDom> allWargears)
    {
        return allWargears.map((wargear) => SingleChildScrollView(
                child: _buildWargearSection(wargear)
            )).toList();
    }

    Widget _buildWargearSection(WargearOptionsDom wargear)
    {
        return Column(
            children: [
                Text(
                    wargear.text,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)
                ),
                const Text(
                    "Wargear Options",
                    style: TextStyle(color: Colors.white70)
                )
            ]
        );
    }
}

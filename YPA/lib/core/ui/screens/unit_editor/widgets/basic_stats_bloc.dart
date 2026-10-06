/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/Stats/base_unit_stats_bloc.dart';
import '../unit_editor_controller.dart';

class BasicStatsBloc extends ConsumerWidget
{
    final (String, String, String) ids;

    const BasicStatsBloc({
        super.key,
        required this.ids
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final (modelStats, modifiedStats) = ref.watch(unitEditorControllerProvider(ids).select((s) => (s.unit?.modelStats,
                s.unit?.modifiedModelCharacteristics
            )));

        if (modelStats == null || modifiedStats == null) return const SizedBox.shrink();

        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...BaseUnitStatsBloc().createModelsBloc(modelStats, modifiedStats)
            ]
        );
    }
}
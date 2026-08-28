/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';

import '../../../../domain/models/codex/codex.dart';
import '../../../../domain/models/detachment/detachment.dart';
import '../army_builder/army_builder_item_ui.dart';

class ViewArmyState
{
    final bool isLoading;
    final bool needRefresh;
    final String armyName;
    final int totalPts;
    final DetachmentName? armyDetachmentName;
    final BattleSize? selectedBattleSize;
    final CodexName? codexName;
    final Map<UnitRoleCode,List<ArmyBuilderUnitItemUi>> units;
    final String? error;

    const ViewArmyState({
        this.isLoading = false,
        this.needRefresh = true,
        this.armyName = '',
        this.totalPts = 0,
        this.armyDetachmentName,
        this.selectedBattleSize,
        this.codexName,
        this.units = const{},
        this.error
    });

    ViewArmyState copyWith({
        bool? isLoading,
        bool? needRefresh,
        String? armyName,
        int? totalPts,
        DetachmentName? armyDetachmentName,
        BattleSize? selectedBattleSize,
        CodexName? codexName,
        Map<UnitRoleCode,List<ArmyBuilderUnitItemUi>>? units,
        String? error
    }) 
    {
        return ViewArmyState(
            isLoading: isLoading ?? this.isLoading,
            needRefresh: needRefresh ?? this.needRefresh,
            armyName: armyName ?? this.armyName,
            totalPts: totalPts ?? this.totalPts,
            armyDetachmentName: armyDetachmentName ?? this.armyDetachmentName,
            selectedBattleSize: selectedBattleSize ?? this.selectedBattleSize,
            codexName: codexName ?? this.codexName,
            units: units ?? this.units,
            error: error ?? this.error
        );
    }
}

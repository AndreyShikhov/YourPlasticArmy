/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';

import '../../../../domain/models/codex/codex.dart';
import '../../../../domain/models/detachment/detachment.dart';
import 'view_army_item.dart';

class ViewArmyState {
  final bool isLoading;
  final String armyName;
  final DetachmentName? armyDetachmentName;
  final BattleSize? selectedBattleSize;
  final CodexName? codexName;
  final List<ViewArmyUnitItemUi> units;
  final String? error;

  const ViewArmyState({
    this.isLoading = false,
    this.armyName = '',
    this.armyDetachmentName,
    this.selectedBattleSize,
    this.codexName,
    this.units = const [],
    this.error,
  });

  ViewArmyState copyWith({
    bool? isLoading,
    String? armyName,
    int? totalPts,
    DetachmentName? armyDetachmentName,
    BattleSize? selectedBattleSize,
    CodexName? codexName,
    List<ViewArmyUnitItemUi>? units,
    String? error,
  }) {
    return ViewArmyState(
      isLoading: isLoading ?? this.isLoading,
      armyName: armyName ?? this.armyName,
      armyDetachmentName: armyDetachmentName ?? this.armyDetachmentName,
      selectedBattleSize: selectedBattleSize ?? this.selectedBattleSize,
      codexName: codexName ?? this.codexName,
      units: units ?? this.units,
      error: error ?? this.error,
    );
  }
}

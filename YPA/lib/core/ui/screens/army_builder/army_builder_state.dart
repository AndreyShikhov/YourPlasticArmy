


import 'package:ypa/core/ui/screens/army_builder/army_builder_item_ui.dart';

import '../../../../domain/models/codex/codex.dart';
import '../../../../domain/models/detachment/detachment.dart';

class ArmyBuilderState {
  final bool isLoading;
  final String armyName;
  final int totalPts;
  final DetachmentName? armyDetachmentName;
  final CodexName? codexName;
  final List<ArmyBuilderUnitItemUi> units;
  final String? error;

  const ArmyBuilderState({
    this.isLoading = false,
    this.armyName = '',
    this.totalPts = 0,
    this.armyDetachmentName,
    this.codexName,
    this.units = const [],
    this.error,
  });

  ArmyBuilderState copyWith({
    bool? isLoading,
    String? armyName,
    int? totalPts,
    DetachmentName? armyDetachmentName,
    CodexName? codexName,
    List<ArmyBuilderUnitItemUi>? units,
    String? error,
  }) {
    return ArmyBuilderState(
      isLoading: isLoading ?? this.isLoading,
      armyName: armyName ?? this.armyName,
      totalPts: totalPts ?? this.totalPts,
      armyDetachmentName: armyDetachmentName ?? this.armyDetachmentName,
      codexName: codexName ?? this.codexName,
      units: units ?? this.units,
      error: error ?? this.error,
    );
  }


  List<ArmyBuilderUnitItemUi> getAllUnitsByRole(String role) {
    return units.where((u) => u.role == role).toList();
  }
}

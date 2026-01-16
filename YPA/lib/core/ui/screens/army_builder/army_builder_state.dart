


import 'package:ypa/core/ui/screens/army_builder/army_builder_item_ui.dart';

import '../../../../domain/models/codex/codex.dart';
import '../../../../domain/models/detachment/detachment.dart';

class ArmyBuilderState {
  final bool isLoading;
  final String armyName;
  final int totalPts;
  final DetachmentName? armyDetachmentName;
  final CodexDOM? codex;
  final DetachmentDOM? detachment;
  final List<DetachmentDOM> allDetachments;
  final List<ArmyBuilderUnitItemUi> units;
  final String? error;

  const ArmyBuilderState({
    this.isLoading = false,
    this.armyName = '',
    this.totalPts = 0,
    this.armyDetachmentName,
    this.codex,
    this.detachment,
    this.allDetachments = const [],
    this.units = const [],
    this.error,
  });

  ArmyBuilderState copyWith({
    bool? isLoading,
    String? armyName,
    int? totalPts,
    DetachmentName? armyDetachmentName,
    CodexDOM? codex,
    DetachmentDOM? detachment,
    List<DetachmentDOM>? allDetachments,
    List<ArmyBuilderUnitItemUi>? units,
    String? error,
  }) {
    return ArmyBuilderState(
      isLoading: isLoading ?? this.isLoading,
      armyName: armyName ?? this.armyName,
      totalPts: totalPts ?? this.totalPts,
      armyDetachmentName: armyDetachmentName ?? this.armyDetachmentName,
      codex: codex ?? this.codex,
      detachment: this.detachment,
      allDetachments: allDetachments ?? this.allDetachments,
      units: units ?? this.units,
      error: error ?? this.error,
    );
  }


  List<ArmyBuilderUnitItemUi> getAllUnitsByRole(String role) {
    return units.where((u) => u.role == role).toList();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_item_ui.dart';

import '../../../../domain/models/codex/codex.dart';
import '../../../../domain/models/detachment/detachment.dart';

class ArmyBuilderState {
  final bool isLoading;
  final String? armyId;
  final String armyName;
  final int totalPts;
  final int? currentPts;
  final CodexDOM? codex;
  final DetachmentDOM? detachment;
  final List<DetachmentDOM> allDetachments;
  final List<ArmyBuilderUnitItemUi>? userArmyUnits;
  final List<ArmyBuilderUnitItemUi> allUnits;
  final String? error;

  const ArmyBuilderState({
    this.isLoading = false,
    this.armyName = '',
    this.armyId,
    this.totalPts = 0,
    this.currentPts,
    this.codex,
    this.detachment,
    this.allDetachments = const [],
    this.userArmyUnits = const[],
    this.allUnits = const [],
    this.error,
  });

  ArmyBuilderState copyWith({
    bool? isLoading,
    String? armyName,
    String? armyId,
    int? totalPts,
    int? currentPts,
    CodexDOM? codex,
    DetachmentDOM? detachment,
    List<DetachmentDOM>? allDetachments,
    List<ArmyBuilderUnitItemUi>? userArmyUnits,
    List<ArmyBuilderUnitItemUi>? allUnits,
    String? error,
  }) {
    return ArmyBuilderState(
      isLoading: isLoading ?? this.isLoading,
      armyName: armyName ?? this.armyName,
      armyId: armyId ?? this.armyId,
      totalPts: totalPts ?? this.totalPts,
      currentPts: currentPts ?? this.currentPts,
      codex: codex ?? this.codex,
      detachment: detachment ?? this.detachment,
      allDetachments: allDetachments ?? this.allDetachments,
      userArmyUnits: userArmyUnits ?? this.userArmyUnits,
      allUnits: allUnits ?? this.allUnits,
      error: error ?? this.error,
    );
  }


  List<ArmyBuilderUnitItemUi> getAllUnitsByRoleFromUserArmy(String role) {
    // 1. Проверяем на null или пустоту
    if (userArmyUnits == null || userArmyUnits!.isEmpty) {
      // Вывод ошибки в консоль (поможет при отладке)
      debugPrint('Warning: userArmyUnits is null or empty');
      return [];
    }
    // 2. Фильтруем и возвращаем список
    return userArmyUnits!.where((unit) => unit.role == role).toList();
  }
}

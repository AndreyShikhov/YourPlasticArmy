import 'package:flutter/cupertino.dart';
import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';
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
  final Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>>? userArmyUnits;
  final List<ArmyBuilderUnitItemUi> allUnitsFromDb;
  final Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>>? temDataUnitsByRole;
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
    this.userArmyUnits = const{},
    this.allUnitsFromDb = const [],
    this.temDataUnitsByRole = const {},
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
    Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>>? userArmyUnits,
    List<ArmyBuilderUnitItemUi>? allUnitsFromDb,
    Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>>? temDataUnitsByRole,
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
      allUnitsFromDb: allUnitsFromDb ?? this.allUnitsFromDb,
      temDataUnitsByRole: temDataUnitsByRole ?? this.temDataUnitsByRole,
      error: error ?? this.error,
    );
  }


  List<ArmyBuilderUnitItemUi> getAllUnitsByRoleFromUserArmy(String role) {

    // 1. Проверяем на null или пустоту всей карты
    if (userArmyUnits == null || userArmyUnits!.isEmpty) {
      debugPrint('Warning: userArmyUnits is null or empty');
      return [];
    }

    // 2. Преобразуем строковый заголовок (например, "Troops") в Enum UnitRoleCode
    final roleCode = UnitRoleCodeX.fromTitle(role);

    // Если роль не распознана, возвращаем пустой список
    if (roleCode == null) return [];

    final test = userArmyUnits![roleCode] ?? [];
    // 3. Возвращаем список юнитов для этой роли из карты (или пустой список, если такой роли в карте нет)
    return test;

  }

  List<ArmyBuilderUnitItemUi> getAllUnitsByRoleFromDB(String role) {
    // 1. Проверяем на null или пустоту
    if (allUnitsFromDb.isEmpty) {
      // Вывод ошибки в консоль (поможет при отладке)
      debugPrint('Warning: allUnits is null or empty');
      return [];
    }
    // 2. Фильтруем и возвращаем список
    return allUnitsFromDb.where((unit) => unit.role == role).toList();
  }

  ArmyBuilderUnitItemUi getUnitByIdFromDb(String unitId) {
    return allUnitsFromDb.firstWhere(
            (unit) => unit.name == unitId,
            orElse: () => ArmyBuilderUnitItemUi.empty()
    );
  }

  List<ArmyBuilderUnitItemUi> getallUnitByNameFromUserArmy(String unitName) {
    // 1. Проверяем на null
    if (userArmyUnits == null) {
      debugPrint('Warning: userArmyUnits is null or empty');
      return [];
    }

    return userArmyUnits!.values
        .expand((units) => units) // Превращаем Map<Key, List> в один общий Iterable
        .where((unit) => unit.name == unitName) // Фильтруем
        .toList();
  }

  int getCurrentCountUnitFromUserArmy(String unitName) {
    return getallUnitByNameFromUserArmy(unitName).length;
  }

}

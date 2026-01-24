import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/codex/get_codex_by_id.dart';
import 'package:ypa/core/providers/di/di_providers.dart';
import 'package:ypa/domain/models/army/army.dart';
import 'package:ypa/domain/models/codex/codex.dart';

import '../../../../application/detachment/detachments_use_cases.dart';
import '../../../../application/unit/unt_use_case.dart';
import '../../../../application/user_army/user_army_use_cases.dart';
import '../../../../domain/models/detachment/detachment.dart';
import '../../../../domain/models/unit/unit.dart';
import '../../../database/tables/seed/seed_objects/_types.dart';
import 'army_builder_item_ui.dart';
import 'army_builder_state.dart';


// Провайдер контроллера с параметром armyId
final armyBuilderControllerProvider = StateNotifierProvider.family<ArmyBuilderController, ArmyBuilderState, String>((ref, armyId) {
  final getUserArmyById = ref.watch(getUserArmyByIdUseCaseProvider);
  final getCodexById = ref.watch(getCodexByIdUseCaseProvider); 
  final updateName = ref.watch(updateUserArmyNameUseCaseProvider);
  final updateDetachment = ref.watch(updateUserArmyDetachmentUseCaseProvider);
  final updateTotalPts = ref.watch(updateUserArmyTotalPtsUseCaseProvider);
  final getAllDetachmentsByCodexId = ref.watch(getAlldetachmentsByCodexIdUseCaseProvider);
  final getAllUnitsByCodexId = ref.watch(getAllUnitsByCodexIdUseCaseProvider);
  final getAllUnitsByArmyId = ref.watch(getUnitsByArmyUseCaseProvider);
  final addUnitToUserRoster = ref.watch(addUnitToUserRosterUseCaseProvider);
  final getUnitByIdFromDb = ref.watch(findUnitByIdFromDbUseCaseProvider);
  final removeLastUnitFromUserRoster = ref.watch(removeLastUnitFromUserRosterUseCaseProvider);




  return ArmyBuilderController(
      getUserArmyById,
      getCodexById,
      updateName,
      updateDetachment,
      updateTotalPts,
      getAllDetachmentsByCodexId,
      getAllUnitsByCodexId,
      getAllUnitsByArmyId,
      addUnitToUserRoster,
      getUnitByIdFromDb,
      removeLastUnitFromUserRoster,
      armyId );
});

class ArmyBuilderController extends StateNotifier<ArmyBuilderState> {
  final GetUserArmyById _getUserArmyById;
  final GetCodexById _getCodexById;
  final UpdateUserArmyName _updateName;
  final UpdateUserArmyDetachment _updateDetachment;
  final UpdateUserArmyTotalPts _updatetotalPts;
  final GetAllDetachmentsByCodexId _getAllDetachmentsByCodexId;
  final GetAllUnitsByCodexId _getAllUnitsByCodexid;
  final GetUnitsByArmy _getAllUnitsByArmyId;
  final AddUnitToUserRoster _addUnitToUserRoster;
  final RemoveLastUnitFromUserRoster _removeLastUnitFromUserRoster;
  final GetUnitByIdFromDb _getUnitByIdFromDb;
  final String _armyId;

  ArmyBuilderController(this._getUserArmyById,
      this._getCodexById,
      this._updateName,
      this._updateDetachment,
      this._updatetotalPts,
      this._getAllDetachmentsByCodexId,
      this._getAllUnitsByCodexid,
      this._getAllUnitsByArmyId,
      this._addUnitToUserRoster,
      this._getUnitByIdFromDb,
      this._removeLastUnitFromUserRoster,
      this._armyId,) : super(const ArmyBuilderState()) {
    loadArmy();
  }


  // ==========================================
  // Updates
  // ==========================================

  // Обновление имени в базе и стейте
  Future<void> updateNameArmyRoster(String newName) async {
    state = state.copyWith(armyName: newName);
    try {
      await _updateName(id: _armyId, newName: newName);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> updateDetachmentArmyRoster(String nameDetachment) async {
    if (nameDetachment == '') return;
    final selectedDetachment = state.allDetachments.firstWhere((d) =>
    d.name.value == nameDetachment,
      orElse: () => state.allDetachments.first,
    );

    state = state.copyWith(detachment: selectedDetachment);

    try {
      await _updateDetachment(id: _armyId, newDetachment: selectedDetachment);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> updateTotalPointsArmyRoster(int newTotalPts) async {
    state = state.copyWith(totalPts: newTotalPts);
    try {
      await _updatetotalPts(id: _armyId, newTotalPts: newTotalPts);
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> addUnitToUserArmy(String unitId) async {
    try {
      await _addUnitToUserRoster(armyId: _armyId, unitId: unitId);
      loadArmy();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> removeLastUnitFromUserArmy(String unitId, UnitRoleCode role) async {
    try {
      await _removeLastUnitFromUserRoster(armyId: _armyId, role: role, unitId: unitId);
      loadArmy();
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  // ==========================================
  // Getters
  // ==========================================

  List<ArmyBuilderUnitItemUi> getUnitsByRoleFromUserArmy(String roleTitle) {
    if (state.userArmyUnits!.isEmpty) {
      if (!state.isLoading) {
        print(
            'Error: userArmyUnits is empty. No units found for role: $roleTitle');
      }
      return [];
    }
    return state.userArmyUnits!.values
        .expand((units) => units)
        .where((unit) => unit.role == roleTitle)
        .toList();
  }

  Future<List<ArmyBuilderUnitItemUi>> getAllUnitsByCodexId(
      CodexId codexId) async {
    List<UnitDOM> unitDomain = await _getAllUnitsByCodexid(codexId);
    return unitDomain
        .map((unit) => _convertDomainUnitToUnitItemUi(unit))
        .toList();
  }

  Future<List<ArmyBuilderUnitItemUi>> getAllUnitsByArmyId(ArmyId armyId) async {
    List<UnitDOM> unitDomain = await _getAllUnitsByArmyId(armyId);
    return unitDomain.map((unit) => _convertDomainUnitToUnitItemUi(unit)).toList();
  }

  // ==========================================
  //  Load Army
  // ==========================================

  Future<void> loadArmy() async {
    state = state.copyWith(isLoading: true, error: null, armyId: _armyId);
    try {
      final userArmy = await _getUserArmyById(_armyId);

      if (userArmy == null) {
        state = state.copyWith(isLoading: false, error: 'Army not found');
        return;
      }

      // get codex from
      final codex = await _getCodexById(userArmy.codexId);
      List<DetachmentDOM> allDetachments = [];
      if (codex != null) {
        allDetachments = await _getAllDetachmentsByCodexId(userArmy.codexId);
      }

      // get detachment
      final savedDetachment = userArmy.detachmentId != null ? allDetachments
          .where((d) => d.id.value == userArmy.detachmentId)
          .firstOrNull : null;

      // Восстановление юнитов из JSON (с ожиданием результата)
      final Map<UnitRoleCode,
          List<
              ArmyBuilderUnitItemUi>> userArmyUnits = await _getAllUserArmyUnitsFromJson(
          userArmy.jsonData);

      // получение всех возможных юнитов для армии из базы данных
      final List<ArmyBuilderUnitItemUi> allUnitsFromDb = await getAllUnitsByArmyId(userArmy.armyId); // юниты по армии
      allUnitsFromDb.addAll(await getAllUnitsByCodexId(userArmy.codexId)); // юниты по кодексу

      state = state.copyWith(
        isLoading: false,
        armyName: userArmy.name,
        codex: codex,
        detachment: savedDetachment,
        allDetachments: allDetachments,
        totalPts: userArmy.totalPoints,
        userArmyUnits: userArmyUnits,
        allUnitsFromDb: allUnitsFromDb,
      );

      fillTemDataUnitsByRole();
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void fillTemDataUnitsByRole() {
    Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>> temDataUnitsByRole = {};

    for (UnitRoleCode role in UnitRoleCode.values) {
      List<ArmyBuilderUnitItemUi> units = state.getAllUnitsByRoleFromDB(
          role.title);
      if (units.isNotEmpty) {
        temDataUnitsByRole.addEntries([MapEntry(role, units)]);
      }
    }
    state = state.copyWith(temDataUnitsByRole: temDataUnitsByRole);
  }


  // ==========================================
  // tools
  // ==========================================
  ArmyBuilderUnitItemUi _convertDomainUnitToUnitItemUi(UnitDOM unit) {
    return ArmyBuilderUnitItemUi(
      dbId: unit.id.value,
      name: unit.name.value,
      role: unit.role.value.name,
      m: unit.stats.movement.toString(),
      t: unit.stats.toughness.toString(),
      sv: unit.stats.save.toString(),
      isv: unit.stats.invulnerableSave.toString(),
      w: unit.stats.wounds.toString(),
      ld: unit.stats.leadership.toString(),
      oc: unit.stats.objectiveControl.toString(),
      repeat: unit.stats.repeat.toString(),
      selectedComposition: unit.stats.unitComposition.effectiveComposition,
      keywords: unit.stats.keywords,
      factionKeywords: unit.stats.factionKeywords,
      weapons: unit.stats.weapons,
    );
  }

  Future<Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>>> _getAllUserArmyUnitsFromJson(String jsonData) async {
    if (jsonData.isEmpty) return {};

    try {
      final decoded = jsonDecode(jsonData) as Map<String, dynamic>;
      // Извлекаем категории (структура: {"categories": {"Character": [...], "Battleline": [...]}})
      final categoriesJson = decoded['categories'] as Map<String, dynamic>? ?? {};
      final Map<UnitRoleCode, List<ArmyBuilderUnitItemUi>> result = {};

      for (final entry in categoriesJson.entries) {
        final roleCode = UnitRoleCodeX.fromName(entry.key);

        if (roleCode != null && entry.value is List) {
          final List<dynamic> unitsJson = entry.value;

          // Подгружаем актуальные характеристики юнитов из БД по их ID
          final loadedUnits = await Future.wait(
            unitsJson.map((u) async {
              final map = u as Map<String, dynamic>;

              if (map['unitId'] == null) return null;

              // Запрос к UseCase для получения данных из БД
              final unitDom = await _getUnitByIdFromDb(UnitId.fromString(map['unitId']));
              if (unitDom == null) return null;

              // Конвертируем доменную модель в UI-модель
              return _convertDomainUnitToUnitItemUi(unitDom);
            }),
          );

          // Добавляем в результат только те юниты, которые были найдены в БД
          result[roleCode] = loadedUnits.whereType<ArmyBuilderUnitItemUi>().toList();
        }
      }

      return result;
    } catch (e) {
      debugPrint('Error decoding units from JSON: $e');
      return {};
    }
  }
}
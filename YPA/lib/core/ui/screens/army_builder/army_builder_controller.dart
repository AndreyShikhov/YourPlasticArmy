import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/codex/get_codex_by_id.dart';
import 'package:ypa/application/user_army/get_user_army_by_id.dart';
import 'package:ypa/application/user_army/update_user_army_name.dart';
import 'package:ypa/core/providers/di/codex_providers.dart';
import 'package:ypa/core/providers/di/user_army_providers.dart';

import 'army_builder_item_ui.dart';
import 'army_builder_state.dart';


// Провайдер контроллера с параметром armyId
final armyBuilderControllerProvider = StateNotifierProvider.family<ArmyBuilderController, ArmyBuilderState, String>((ref, armyId) {
  final getUserArmyById = ref.watch(getUserArmyByIdUseCaseProvider);
  final getCodexById = ref.watch(getCodexByIdUseCaseProvider); 
  final updateName = ref.watch(updateUserArmyNameUseCaseProvider);
  return ArmyBuilderController(getUserArmyById, getCodexById, updateName, armyId);
});

class ArmyBuilderController extends StateNotifier<ArmyBuilderState> {
  final GetUserArmyById _getUserArmyById;
  final GetCodexById _getCodexById; 
  final UpdateUserArmyName _updateName;
  final String _armyId;

  ArmyBuilderController(
      this._getUserArmyById,
      this._getCodexById,
      this._updateName,
      this._armyId,
      ) : super(const ArmyBuilderState()) {
    loadArmy();
  }

  // Обновление имени в базе и стейте
  Future<void> updateName(String newName) async {
    // 1. Обновляем локальный стейт сразу (для плавности UI)
    state = state.copyWith(armyName: newName);
    
    // 2. Сохраняем в базу данных через UseCase
    try {
      await _updateName(id: _armyId, newName: newName);
    } catch (e) {
      // Если сохранение упало, можно вернуть старое имя или показать ошибку
      state = state.copyWith(error: e.toString());
    }
  }

  List<ArmyBuilderUnitItemUi> getUnitsByRole(String roleTitle) {
    return state.units.where((unit) => unit.role == roleTitle).toList();
  }

  Future<void> loadArmy() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final userArmy = await _getUserArmyById(_armyId);

      if (userArmy == null) {
        state = state.copyWith(isLoading: false, error: 'Army not found');
        return;
      }

      final codex = await _getCodexById(userArmy.codexId);

      // В будущем здесь будет логика восстановления юнитов из JSON
      final List<ArmyBuilderUnitItemUi> units = [];

      state = state.copyWith(
        isLoading: false,
        armyName: userArmy.name,
        codexName: codex?.name,
        totalPts: userArmy.totalPoints,
        units: units,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

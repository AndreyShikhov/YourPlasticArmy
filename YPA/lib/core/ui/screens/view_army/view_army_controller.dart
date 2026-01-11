import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/codex/get_codex_by_id.dart';
import 'package:ypa/application/user_army/get_user_army_by_id.dart';
import 'package:ypa/core/providers/di/codex_providers.dart';
import 'package:ypa/core/providers/di/user_army_providers.dart';
import 'package:ypa/core/ui/screens/view_army/view_army_item.dart';
import 'package:ypa/core/ui/screens/view_army/view_army_state.dart';
import 'package:ypa/domain/models/codex/codex.dart';

// Провайдер контроллера с параметром armyId
final viewArmyControllerProvider = StateNotifierProvider.family<ViewArmyController, ViewArmyState, String>((ref, armyId) {
  final getUserArmyById = ref.watch(getUserArmyByIdUseCaseProvider);
  final getCodexById = ref.watch(getCodexByIdUseCaseProvider); // Добавили UseCase
  return ViewArmyController(getUserArmyById, getCodexById, armyId);
});

class ViewArmyController extends StateNotifier<ViewArmyState> {
  final GetUserArmyById _getUserArmyById;
  final GetCodexById _getCodexById; // Добавили поле
  final String _armyId;

  ViewArmyController(
    this._getUserArmyById, 
    this._getCodexById, 
    this._armyId,
  ) : super(const ViewArmyState()) {
    loadArmy();
  }

  Future<void> loadArmy() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final userArmy = await _getUserArmyById(_armyId);
      
      if (userArmy == null) {
        state = state.copyWith(isLoading: false, error: 'Army not found');
        return;
      }

      // ПОЛУЧАЕМ ИМЯ КОДЕКСА ИЗ БАЗЫ
      final codex = await _getCodexById(userArmy.codexId);

      // В будущем здесь будет логика восстановления юнитов из JSON
      final List<ViewArmyUnitItemUi> units = [];

      state = state.copyWith(
        isLoading: false,
        armyName: userArmy.name,
        codexName: codex?.name, // Теперь здесь реальный объект CodexName с нормальным именем
        totalPts: userArmy.totalPoints,
        units: units,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/codex/get_codex_by_id.dart';
import 'package:ypa/application/user_army/create_user_army.dart';
import 'package:ypa/application/user_army/delet_user_army_by_id.dart';
import 'package:ypa/application/user_army/get_user_armies.dart';
import 'package:ypa/core/providers/di/codex_providers.dart';
import 'package:ypa/core/providers/di/user_army_providers.dart';
import 'package:ypa/core/ui/screens/army_lyst/army_list_item_ui.dart';
import 'package:ypa/core/ui/screens/army_lyst/army_lyst_state.dart';
import 'package:ypa/domain/models/codex/codex_id.dart';

final armyLystControllerProvider = StateNotifierProvider<ArmyLystController, ArmyLystState>((ref) {
  final getUserArmies = ref.watch(getUserArmiesUseCaseProvider);
  final createUserArmy = ref.watch(createUserArmyUseCaseProvider);
  final getCodexById = ref.watch(getCodexByIdUseCaseProvider);
  final deleArmyById = ref.watch(deletUserArmyByIdUseCaseProvider);
  return ArmyLystController(getUserArmies, createUserArmy, getCodexById, deleArmyById);
});

class ArmyLystController extends StateNotifier<ArmyLystState> {
  final GetUserArmies _getUserArmies;
  final CreateUserArmy _createUserArmy;
  final GetCodexById _getCodexById;
  final DeletUserArmyById _deletUserArmyById;

  ArmyLystController(
    this._getUserArmies, 
    this._createUserArmy, 
    this._getCodexById,
    this._deletUserArmyById,
  ) : super(const ArmyLystState()) {
    loadArmies();
  }

  Future<void> loadArmies() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final armies = await _getUserArmies();
      
      final List<ArmyListItemUi> items = [];
      
      for (final a in armies) {
        // Получаем информацию о кодексе. 
        // Важно: a.codexId должен существовать в таблице Codexes
        final codex = await _getCodexById(a.codexId);
        
        items.add(ArmyListItemUi(
          id: a.id,
          title: a.name,
          codexName: codex?.name.value ?? 'Unknown Codex', // Используем .value если name это ValueObject
          pts: a.totalPoints,
        ));
      }

      state = state.copyWith(isLoading: false, items: items);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> createArmy({required String name, required String codexIdRaw}) async {
    state = state.copyWith(isLoading: true);
    try {
      final codexId = CodexId.fromString(codexIdRaw);
      await _createUserArmy(name: name, codexId: codexId);
      await loadArmies(); 
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> deleteArmy(String armyId) async {
    await _deletUserArmyById(userArmyId: armyId);
  }
}

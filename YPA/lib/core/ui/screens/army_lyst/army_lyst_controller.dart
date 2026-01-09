import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/user_army/get_user_armies.dart';
import 'package:ypa/core/providers/di/user_army_providers.dart';
import 'package:ypa/core/ui/screens/army_lyst/army_list_item_ui.dart';
import 'package:ypa/core/ui/screens/army_lyst/army_lyst_state.dart';

final armyLystControllerProvider = StateNotifierProvider<ArmyLystController, ArmyLystState>((ref) {
  final getUserArmies = ref.watch(getUserArmiesUseCaseProvider);
  return ArmyLystController(getUserArmies);
});

class ArmyLystController extends StateNotifier<ArmyLystState> {
  final GetUserArmies _allUserArmies;

  ArmyLystController(this._allUserArmies) : super(const ArmyLystState()) {
    loadArmies();
  }

  Future<void> loadArmies() async {
    state = state.copyWith(isLoading: true);
    try {
      final armies = await _allUserArmies();
      
      // Маппим доменные модели в UI модели
      final items = armies.map((army) => ArmyListItemUi(
        id: army.armyId.value, // Теперь id строковый UUID
        title: '${army.name} (${army.totalPoints} pts)',
      )).toList();

      state = state.copyWith(isLoading: false, items: items);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

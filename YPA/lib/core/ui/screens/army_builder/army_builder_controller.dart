import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/codex/get_codex_by_id.dart';
import 'package:ypa/core/providers/di/di_providers.dart';



import '../../../../application/detachment/detachments_use_cases.dart';
import '../../../../application/user_army/user_army_use_cases.dart';
import '../../../../domain/models/detachment/detachment.dart';
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

  return ArmyBuilderController(getUserArmyById, getCodexById, updateName, updateDetachment, updateTotalPts, getAllDetachmentsByCodexId, armyId );
});

class ArmyBuilderController extends StateNotifier<ArmyBuilderState> {
  final GetUserArmyById _getUserArmyById;
  final GetCodexById _getCodexById; 
  final UpdateUserArmyName _updateName;
  final UpdateUserArmyDetachment _updateDetachment;
  final UpdateUserArmyTotalPts _updatetotalPts;
  final GetAllDetachmentsByCodexId _getAllDetachmentsByCodexId;
  final String _armyId;

  ArmyBuilderController(
      this._getUserArmyById,
      this._getCodexById,
      this._updateName,
      this._updateDetachment,
      this._updatetotalPts,
      this._getAllDetachmentsByCodexId,
      this._armyId,
      ) : super(const ArmyBuilderState()) {
    loadArmy();
  }

  // Обновление имени в базе и стейте
  Future<void> updateName(String newName) async {
    // 1. Обновляем локальный стейт сразу (для плавности UI)
    state = state.copyWith(armyName: newName );
    
    // 2. Сохраняем в базу данных через UseCase
    try {
      await _updateName(id: _armyId, newName: newName);
    } catch (e) {
      // Если сохранение упало, можно вернуть старое имя или показать ошибку
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> updateDetachment(String NameDetachment) async {

    if (NameDetachment == null) return;
    // 1. Обновляем локальный стейт сразу (для плавности UI)
    final selectedDetachment = state.allDetachments.firstWhere((d) => d.name.value == NameDetachment,
      orElse: () => state.allDetachments.first, // Или обработка ошибки
    );


    state = state.copyWith(detachment: selectedDetachment);

    // 2. Сохраняем в базу данных через UseCase
    try {
      await _updateDetachment(id: _armyId, newDetachment: selectedDetachment);
    } catch (e) {
      // Если сохранение упало, можно вернуть старое имя или показать ошибку
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> updateTotalPoints(int newTotalPts) async{

    state = state.copyWith( totalPts: newTotalPts);

    // 2. Сохраняем в базу данных через UseCase
    try {
      await _updatetotalPts(id: _armyId, newTotalPts: newTotalPts);
    } catch (e) {
      // Если сохранение упало, можно вернуть старое имя или показать ошибку
      state = state.copyWith(error: e.toString());
    }
  }

  List<ArmyBuilderUnitItemUi> getUnitsByRole(String roleTitle) {
    return state.units.where((unit) => unit.role == roleTitle).toList();
  }

  Future<void> loadArmy() async {
    state = state.copyWith(isLoading: true, error: null, armyId: _armyId);
    try {
      final userArmy = await _getUserArmyById(_armyId);

      if (userArmy == null) {
        state = state.copyWith(isLoading: false, error: 'Army not found');
        return;
      }

      final codex = await _getCodexById(userArmy.codexId);
      List<DetachmentDOM> allDetachments = [];
      if (codex != null) {
        allDetachments = await _getAllDetachmentsByCodexId(userArmy.codexId);
      }

      final savedDetachment = userArmy.detachmentId != null
          ? allDetachments.where((d) => d.id.value == userArmy.detachmentId).firstOrNull
          : null;

      // В будущем здесь будет логика восстановления юнитов из JSON
      final List<ArmyBuilderUnitItemUi> units = [];

      state = state.copyWith(
        isLoading: false,
        armyName: userArmy.name,
        codex: codex,
        detachment: savedDetachment,
        allDetachments: allDetachments,
        totalPts: userArmy.totalPoints,
        units: [],
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/user_army/create_user_army.dart';
import 'package:ypa/application/user_army/delet_user_army_by_id.dart';
import 'package:ypa/application/user_army/get_user_armies.dart';
import 'package:ypa/core/providers/di/user_army_providers.dart';
import 'package:ypa/core/ui/screens/army_lyst/army_list_item_ui.dart';
import 'package:ypa/core/ui/screens/army_lyst/army_lyst_state.dart';
import 'package:ypa/domain/models/army/army.dart';
import 'package:ypa/domain/models/codex/codex_id.dart';
import 'package:ypa/domain/models/faction/faction.dart';

final armyLystControllerProvider = StateNotifierProvider<ArmyLystController, ArmyLystState>((ref)
    {
        final getUserArmies = ref.watch(getUserArmiesUseCaseProvider);
        final createUserArmy = ref.watch(createUserArmyUseCaseProvider);
        final deleteUserArmyById = ref.watch(deleteUserArmyByIdUseCaseProvider);

        return ArmyLystController(getUserArmies, createUserArmy,  deleteUserArmyById);
    });

class ArmyLystController extends StateNotifier<ArmyLystState>
{
    final GetUserArmies _getUserArmies;
    final CreateUserArmy _createUserArmy;
    final DeletUserArmyById _deleteUserArmyById;

    ArmyLystController(
        this._getUserArmies, 
        this._createUserArmy,
        this._deleteUserArmyById
    ) : super(const ArmyLystState())
    {
        loadArmies();
    }

    Future<void> loadArmies() async {
      state = state.copyWith(isLoading: true, error: null);
      try {
        final dataList = await _getUserArmies.repository.getAllUserArmyWithCodexNames();

        final items = dataList.map((entry) {
          final army = entry.keys.first;
          final (codexName, detachmentName) = entry.values.first;


          return ArmyListItemUi(
            id: army.id,
            title: army.userArmyName,
            codexName: codexName,
            detachment: detachmentName ?? '',
            currentPts: army.totalPoints,
            maxPts: army.battleSize?.total ?? 0,
          );
        }).toList();

        state = state.copyWith(isLoading: false, items: items);

      } catch (e) {
        state = state.copyWith(isLoading: false, error: e.toString());
      }
    }

    Future<void> createArmy({required String userArmyName, required String factionId, required String armyId, required String codexIdRaw}) async
    {
      state = state.copyWith(isLoading: true);
      try
      {
        await _createUserArmy(
            userArmyName: userArmyName,
            factionId: FactionId.fromString(factionId),
            armyId: ArmyId.fromString(armyId),
            codexId: CodexId.fromString(codexIdRaw)
        );
        await loadArmies();
      } catch (e)
      {
        state = state.copyWith(isLoading: false, error: e.toString());
      }
    }

    Future<void> deleteArmy(String armyId) async
    {
      await _deleteUserArmyById(userArmyId: armyId);
    }





}

/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/application/codex/get_codex_by_id.dart';
import 'package:ypa/application/user_army/get_user_army_by_id.dart';
import 'package:ypa/core/providers/di/codex_providers.dart';
import 'package:ypa/core/providers/di/user_army_providers.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_controller.dart';
import 'package:ypa/core/ui/screens/army_builder/army_builder_state.dart';
import 'package:ypa/core/ui/screens/view_army/view_army_item.dart';
import 'package:ypa/core/ui/screens/view_army/view_army_state.dart';

/// Провайдер контроллера с параметром armyId
final viewArmyControllerProvider = StateNotifierProvider.family<ViewArmyController, ViewArmyState, String>((
        ref,
        armyId
    )
    {
        final getUserArmyById = ref.watch(getUserArmyByIdUseCaseProvider);
        final getCodexById = ref.watch(getCodexByIdUseCaseProvider);

        final controller = ViewArmyController(getUserArmyById, getCodexById, armyId);

        /// Слушаем изменения в редакторе армии через провайдер билдера.
        /// Используем локальную переменную 'controller', чтобы избежать циклической зависимости типов.
        ref.listen<ArmyBuilderState>(armyBuilderControllerProvider(armyId), (previous, next) 
        {
            if (previous != null && !next.isLoading && previous != next) 
            {
                controller.markNeedsRefresh();
            }
        });

        return controller;
    });

class ViewArmyController extends StateNotifier<ViewArmyState>
{
    final GetUserArmyById _getUserArmyById;
    final GetCodexById _getCodexById; 
    final String _armyId;

    ViewArmyController(this._getUserArmyById, this._getCodexById, this._armyId) : super(const ViewArmyState())
    {
        loadArmy();
    }

    /// Помечает, что данные изменились и их нужно перегрузить при следующем входе
    void markNeedsRefresh()
    {
        if (state.needRefresh) return;
        state = state.copyWith(needRefresh: true);
    }

    Future<void> loadArmy() async
    {
        // Если обновление не требуется и данные уже есть, ничего не делаем
        if (!state.needRefresh && !state.isLoading && state.armyName.isNotEmpty) return;

        state = state.copyWith(isLoading: true, error: null);
        try
        {
            final userArmy = await _getUserArmyById(_armyId);

            if (userArmy == null) 
            {
                state = state.copyWith(isLoading: false, error: 'Army not found');
                return;
            }

            final codex = await _getCodexById(userArmy.codexId);

            /// TODO: В будущем здесь будет логика восстановления юнитов из JSON
            final List<ViewArmyUnitItemUi> units = [];

            state = state.copyWith(
                isLoading: false,
                needRefresh: false,
                armyName: userArmy.userArmyName,
                codexName: codex?.name,
                selectedBattleSize: userArmy.battleSize,
                units: units
            );
        } catch (e)
        {
            state = state.copyWith(isLoading: false, error: e.toString());
        }
    }
}

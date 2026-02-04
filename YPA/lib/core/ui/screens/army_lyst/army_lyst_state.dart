/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/core/ui/screens/army_lyst/army_list_item_ui.dart';

class ArmyLystState
{
    final bool isLoading;
    final bool isDeleting;
    final List<ArmyListItemUi> items;
    final String? error;

    const ArmyLystState({this.isLoading = false, this.isDeleting = false, this.items = const[], this.error});

    ArmyLystState copyWith({bool? isLoading, bool? isDeleting, List<ArmyListItemUi>? items, String? error}) 
    {
        return ArmyLystState(
            isLoading: isLoading ?? this.isLoading,
            isDeleting: isDeleting ?? this.isDeleting,
            items: items ?? this.items,
            error: error ?? this.error
        );
    }
}

/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/core/ui/screens/unit_editor/unit_editor_item_ui.dart';

/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

class UnitEditorState
{

    final bool isLoading;
    final String unitInstanceId;
    final UnitEditorItemUi? unit;
    final String? error;

    UnitEditorState({
        this.isLoading = false,
        required this.unitInstanceId,
        this.unit,
        this.error
    });

    UnitEditorState copyWith({
        bool? isLoading,
        String? unitInstanceId,
        UnitEditorItemUi? unit,
        String? error
    })
    {
        return UnitEditorState(
            isLoading: isLoading ?? this.isLoading,
            unitInstanceId: unitInstanceId ?? this.unitInstanceId,
            unit: unit ?? this.unit,
            error: error ?? this.error
        );
    }
}

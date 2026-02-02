/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

class ArmyListItemUi
{
    final String id; // UUID
    final String codexName;
    final String title;
    final String? detachment;
    final int currentPts;
    final int? maxPTS;

    ArmyListItemUi({
        required this.id, 
        required this.codexName, 
        required this.title, 
        this.detachment,
        required this.currentPts,
        this.maxPTS
    });
}

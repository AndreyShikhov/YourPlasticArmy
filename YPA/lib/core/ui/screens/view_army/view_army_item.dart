/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import '../../../../domain/models/unit/unit_stats.dart';
import '../../../database/tables/seed/seed_objects/_types.dart';

class ViewArmyUnitItemUi
{
    final String name;
    final String role;
    final Map<String, ModelStatsDom> modelStats;
    final Map<String, CharacteristicsDom> modifiedModelCharacteristics;
    final List<Map<String, dynamic>> weaponSnapshot;
    final List<String> unitAbility;
    final List<CoreUnitAbilityCode> coreAbilities;
    final List<FactionUnitAbilityCode> factionAbilities;
    final List<String> keywords;
    final List<String> factionKeywords;

    ViewArmyUnitItemUi({
        required this.name,
        required this.role,
        required this.modelStats,
        required this.modifiedModelCharacteristics,
        required this.weaponSnapshot,
        required this.unitAbility,
        required this.coreAbilities,
        required this.factionAbilities,
        required this.keywords,
        required this.factionKeywords
    });
}

/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/core/database/tables/seed/seed_objects/_types.dart';

import '../../../../domain/models/unit/unit.dart';

class UnitEditorItemUi
{

    final String instanceId;
    final String name;
    final String role;
    final int repeat;
    final List<String> keywords;
    final List<String> factionKeywords;
    final UnitComposition unitComposition;
    final List<String> unitAbility;
    final List<CoreUnitAbilityCode> coreAbilities;
    final List<FactionUnitAbilityCode> factionAbilities;
    final List<LeaderFilter> leader;
    final List<LeaderFilter> ledBy;
    final Map<String, ModelStatsDom> modelStats;
    final Map<int, int> selectedComposition;

    UnitEditorItemUi({
        required this.instanceId,
        required this.name,
        required this.role,
        required this.repeat,
        required this.keywords,
        required this.factionKeywords,
        required this.unitComposition,
        required this.unitAbility,
        required this.coreAbilities,
        required this.factionAbilities,
        required this.leader,
        required this.ledBy,
        required this.modelStats,
        required this.selectedComposition

    });

}

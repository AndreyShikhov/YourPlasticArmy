/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

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
    final UnitCompositionDom unitComposition;
    final List<String> unitAbility;
    final List<CoreUnitAbilityCode> coreAbilities;
    final List<FactionUnitAbilityCode> factionAbilities;
    final List<LeaderFilterDom> leader;
    final List<LeaderFilterDom> ledBy;
    final Map<String, ModelStatsDom> modelStats;
    final Map<String, List<int>> selectedWargearIndices;

    /// Изменили на List, так как оружия много
    final List<({
        String modelName,
        WeaponType weaponType,
        String weaponName, 
        bool isEquiped, 
        int amount
    })>? weaponInfo;

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
        required this.selectedWargearIndices,
        this.weaponInfo,
    });

    UnitEditorItemUi copyWith({
        String? instanceId,
        String? name,
        String? role,
        int? repeat,
        List<String>? keywords,
        List<String>? factionKeywords,
        UnitCompositionDom? unitComposition,
        List<String>? unitAbility,
        List<CoreUnitAbilityCode>? coreAbilities,
        List<FactionUnitAbilityCode>? factionAbilities,
        List<LeaderFilterDom>? leader,
        List<LeaderFilterDom>? ledBy,
        Map<String, ModelStatsDom>? modelStats,
        Map<String, List<int>>? selectedWargearIndices,
        List<({String modelName, WeaponType weaponType, String weaponName, bool isEquiped, int amount})>? weaponInfo,
    })
    {
        return UnitEditorItemUi(
            instanceId: instanceId ?? this.instanceId,
            name: name ?? this.name,
            role: role ?? this.role,
            repeat: repeat ?? this.repeat,
            keywords: keywords ?? this.keywords,
            factionKeywords: factionKeywords ?? this.factionKeywords,
            unitComposition: unitComposition ?? this.unitComposition,
            unitAbility: unitAbility ?? this.unitAbility,
            coreAbilities: coreAbilities ?? this.coreAbilities,
            factionAbilities: factionAbilities ?? this.factionAbilities,
            leader: leader ?? this.leader,
            ledBy: ledBy ?? this.ledBy,
            modelStats: modelStats ?? this.modelStats,
            selectedWargearIndices: selectedWargearIndices ?? this.selectedWargearIndices,
            weaponInfo: weaponInfo ?? this.weaponInfo,
        );
    }
}

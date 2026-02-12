/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:uuid/uuid.dart';
import 'package:ypa/domain/models/unit/model_stats.dart';

import '../../../core/database/tables/seed/seed_objects/_types.dart';
import '../army/army_id.dart';
import '../codex/codex_id.dart';
import 'unit_id.dart';
import 'unit_name.dart';
import 'unit_role_code.dart';

class UnitDOM
{
    final UnitIdDom id;
    final UnitNameDom name;
    final ArmyId armyId;
    final CodexId? codexId;
    final UnitRoleCodeDom role;
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

    const UnitDOM._({
        required this.id,
        required this.name,
        required this.armyId,
        required this.codexId,
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
        required this.selectedWargearIndices
    });

    factory UnitDOM.restore({
        required UnitIdDom id,
        required UnitNameDom name,
        required ArmyId armyId,
        required CodexId? codexId,
        required UnitRoleCode role,
        required int repeat,
        required List<String> keywords,
        required List<String> factionKeywords,
        required UnitCompositionDom unitComposition,
        required List<String> unitAbility,
        required List<CoreUnitAbilityCode> coreAbilities,
        required List<FactionUnitAbilityCode> factionAbilities,
        required List<LeaderFilterDom> leader,
        required List<LeaderFilterDom> ledBy,
        required Map<String, ModelStatsDom> modelStats,
        Map<String, List<int>>? selectedWargearIndices

    })
    {
        return UnitDOM._(
            id: id,
            name: name,
            armyId: armyId,
            codexId: codexId,
            role: UnitRoleCodeDom(role),
            repeat: repeat,
            keywords: keywords,
            factionKeywords: factionKeywords,
            unitComposition: unitComposition,
            unitAbility: unitAbility,
            coreAbilities: coreAbilities,
            factionAbilities: factionAbilities,
            leader: leader,
            ledBy: ledBy,
            modelStats: modelStats,
            selectedWargearIndices: selectedWargearIndices ?? {}
        );
    }

    factory UnitDOM.create({
        required UnitNameDom name,
        required ArmyId armyId,
        required CodexId? codexId,
        required UnitRoleCodeDom role,
        required int repeat,
        required List<String> keywords,
        required List<String> factionKeywords,
        required UnitCompositionDom unitComposition,
        required List<String> unitAbility,
        required List<CoreUnitAbilityCode> coreAbilities,
        required List<FactionUnitAbilityCode> factionAbilities,
        required List<LeaderFilterDom> leader,
        required List<LeaderFilterDom> ledBy,
        required Map<String, ModelStatsDom> modelStats

    })
    {
        return UnitDOM._(
            id: UnitIdDom.fromString(const Uuid().v4()),
            name: name,
            armyId: armyId,
            codexId: codexId,
            role: role,
            repeat: repeat,
            keywords: keywords,
            factionKeywords: factionKeywords,
            unitComposition: unitComposition,
            unitAbility: unitAbility,
            coreAbilities: coreAbilities,
            factionAbilities: factionAbilities,
            leader: leader,
            ledBy: ledBy,
            modelStats: modelStats,
            selectedWargearIndices: {}
        );
    }

    UnitDOM copyWith({
        UnitIdDom? id,
        UnitNameDom? name,
        ArmyId? armyId,
        Object? codexId = const _Sentinel(),
        UnitRoleCodeDom? role,
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
        Map<String, List<int>>? selectedWargearIndices
    })
    {
        return UnitDOM._(
            id: this.id,
            name: name ?? this.name,
            armyId: armyId ?? this.armyId,
            codexId: codexId == const _Sentinel()
                ? this.codexId : (codexId as CodexId?),
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
            selectedWargearIndices: selectedWargearIndices ?? this.selectedWargearIndices
        );
    }
}

class _Sentinel
{
    const _Sentinel();
}

/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:uuid/uuid.dart';
import 'package:ypa/domain/models/unit/unit_stats.dart';

import '../../../core/database/tables/seed/seed_objects/_types.dart';
import '../army/army.dart';
import '../codex/codex.dart';
import 'unit_id.dart';
import 'unit_name.dart';
import 'unit_roleCode.dart';

class UnitDOM
{
    final UnitId id;
    final UnitName name;
    final ArmyId armyId;
    final CodexId? codexId;
    final UnitRoleCodeDom role;
    final int repeat;
    final List<String> keywords;
    final List<String> factionKeywords;
    final UnitComposition unitComposition;
    final List<UnitAbilitiesCode> unitAbility;
    final List<CoreUnitAbilityCode> coreAbilities;
    final List<FactionUnitAbilityCode> factionAbilities;
    final List<String> leader;
    final List<String> ledBy;
    final Map<String, ModelStats> modelStats;

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
        required this.modelStats
    });

    factory UnitDOM.restore({
        required UnitId id,
        required UnitName name,
        required ArmyId armyId,
        required CodexId? codexId,
        required UnitRoleCode role,
        required Map<String, ModelStats> stats,
        required int repeat,
        required List<String> keywords,
        required List<String> factionKeywords,
        required UnitComposition unitComposition,
        required List<UnitAbilitiesCode> unitAbility,
        required List<CoreUnitAbilityCode> coreAbilities,
        required List<FactionUnitAbilityCode> factionAbilities,
        required List<String> leader,
        required List<String> ledBy

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
            modelStats: stats

        );
    }

    factory UnitDOM.create({
        required UnitName name,
        required ArmyId armyId,
        required CodexId? codexId,
        required UnitRoleCodeDom role,
        required Map<String, ModelStats> modelStats,
        required int repeat,
        required List<String> keywords,
        required List<String> factionKeywords,
        required UnitComposition unitComposition,
        required List<UnitAbilitiesCode> unitAbility,
        required List<CoreUnitAbilityCode> coreAbilities,
        required List<FactionUnitAbilityCode> factionAbilities,
        required List<String> leader,
        required List<String> ledBy

    })
    {
        return UnitDOM._(
            id: UnitId.fromString(const Uuid().v4()),
            name: name,
            armyId: armyId,
            codexId: codexId,
            role: role,
            modelStats: modelStats,
            repeat: repeat,
            keywords: keywords,
            factionKeywords: factionKeywords,
            unitComposition: unitComposition,
            unitAbility: unitAbility,
            coreAbilities: coreAbilities,
            factionAbilities: factionAbilities,
            leader: leader,
            ledBy: ledBy

        );
    }

    UnitDOM copyWith({
        UnitName? name,
        ArmyId? armyId,
        Object? codexId = const _Sentinel(),
        UnitRoleCodeDom? role,
        Map<String, ModelStats>? modelStats,
        int? repeat,
        List<String>? keywords,
        List<String>? factionKeywords,
        UnitComposition? unitComposition,
        List<UnitAbilitiesCode>? unitAbility,
        List<CoreUnitAbilityCode>? coreAbilities,
        List<FactionUnitAbilityCode>? factionAbilities,
        List<String>? leader,
        List<String>? ledBy
    }) 
    {
        return UnitDOM._(
            id: this.id,
            name: name ?? this.name,
            armyId: armyId ?? this.armyId,
            codexId: codexId == const _Sentinel()
                ? this.codexId
                : (codexId as CodexId?),
            role: role ?? this.role,
            modelStats: modelStats ?? this.modelStats,
            repeat: repeat ?? this.repeat,
            keywords: keywords ?? this.keywords,
            factionKeywords: factionKeywords ?? this.factionKeywords,
            unitComposition: unitComposition ?? this.unitComposition,
            unitAbility: unitAbility ?? this.unitAbility,
            coreAbilities: coreAbilities ?? this.coreAbilities,
            factionAbilities: factionAbilities ?? this.factionAbilities,
            leader: leader ?? this.leader,
            ledBy: ledBy ?? this.ledBy

        );
    }
}

class _Sentinel
{
    const _Sentinel();
}

/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:uuid/uuid.dart';
import 'package:ypa/domain/models/unit/unit_stats.dart';

import '../../../core/database/tables/seed/seed_objects/_types.dart';
import '../army/army_code.dart';
import '../codex/codex.dart';
import 'unit_id.dart';
import 'unit_name.dart';
import 'unit_roleCode.dart';

class UnitDOM
{
    final UnitId id;
    final UnitName name;
    final ArmyCodeDom armyCode;
    final CodexCodeDom? codexCode;
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
        required this.armyCode,
        required this.codexCode,
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
        required ArmyCodeDom armyCode,
        required CodexCodeDom? codexCode,
        required UnitRoleCodeDom role,
        required int repeat,
        required List<String> keywords,
        required List<String> factionKeywords,
        required UnitComposition unitComposition,
        required List<UnitAbilitiesCode> unitAbility,
        required List<CoreUnitAbilityCode> coreAbilities,
        required List<FactionUnitAbilityCode> factionAbilities,
        required List<String> leader,
        required List<String> ledBy,
        required Map<String, ModelStats> modelStats

    })
    {
        return UnitDOM._(
            id: id,
            name: name,
            armyCode: armyCode,
            codexCode: codexCode,
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
            modelStats: modelStats
        );
    }

    factory UnitDOM.create({
        required UnitName name,
        required ArmyCodeDom armyCode,
        required CodexCodeDom? codexCode,
        required UnitRoleCodeDom role,
        required int repeat,
        required List<String> keywords,
        required List<String> factionKeywords,
        required UnitComposition unitComposition,
        required List<UnitAbilitiesCode> unitAbility,
        required List<CoreUnitAbilityCode> coreAbilities,
        required List<FactionUnitAbilityCode> factionAbilities,
        required List<String> leader,
        required List<String> ledBy,
        required Map<String, ModelStats> modelStats

    })
    {
        return UnitDOM._(
            id: UnitId.fromString(const Uuid().v4()),
            name: name,
            armyCode: armyCode,
            codexCode: codexCode,
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
            modelStats: modelStats

        );
    }

    UnitDOM copyWith({
        UnitName? name,
        ArmyCodeDom? armyCode,
        Object? codexId = const _Sentinel(),
        UnitRoleCodeDom? role,
        int? repeat,
        List<String>? keywords,
        List<String>? factionKeywords,
        UnitComposition? unitComposition,
        List<UnitAbilitiesCode>? unitAbility,
        List<CoreUnitAbilityCode>? coreAbilities,
        List<FactionUnitAbilityCode>? factionAbilities,
        List<String>? leader,
        List<String>? ledBy,
        Map<String, ModelStats>? modelStats
    })
    {
        return UnitDOM._(
            id: this.id,
            name: name ?? this.name,
            armyCode: armyCode ?? this.armyCode,
            codexCode: codexCode == const _Sentinel()
                ? this.codexCode : codexCode,
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
            modelStats: modelStats ?? this.modelStats
        );
    }
}

class _Sentinel
{
    const _Sentinel();
}

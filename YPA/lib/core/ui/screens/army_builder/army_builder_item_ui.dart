/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:ypa/domain/models/unit/model_stats.dart';
import 'package:ypa/domain/models/user_army/user_army_dom.dart';

import '../../../database/tables/seed/seed_objects/_types.dart';

class ArmyBuilderUnitItemUi
{
    final String instanceId;
    final String dbId;
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
    final List<Map<String, dynamic>> weaponSnapshot;
    final Map<String, CharacteristicsDom> characteristics;

    ArmyBuilderUnitItemUi({
        required this.instanceId,
        required this.dbId,
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
        required this.weaponSnapshot,
        required this.characteristics
    });

    ArmyBuilderUnitItemUi copyWith({
        String? instanceId,
        String? dbId,
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
        List<Map<String, dynamic>>? weaponSnapshot,
        Map<String, CharacteristicsDom>? characteristics
    })
    {
        return ArmyBuilderUnitItemUi(
            instanceId: instanceId ?? this.instanceId,
            dbId: dbId ?? this.dbId,
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
            weaponSnapshot: weaponSnapshot ?? this.weaponSnapshot,
            characteristics: characteristics ?? this.characteristics
        );
    }

    Map<String, dynamic> toJson()
    {
        return
        {
            'instanceId': instanceId,
            'dbId': dbId,
            'name': name,
            'role': role,
            'repeat': repeat,
            'keywords': keywords,
            'factionKeywords': factionKeywords,
            'unitComposition': unitComposition.toJson(),
            'unitAbility': unitAbility,
            'coreAbilities': coreAbilities.map((e) => e.name).toList(),
            'factionAbilities': factionAbilities.map((e) => e.name).toList(),
            'leader': leader,
            'ledBy': ledBy,
            'modelStats': modelStats.map((k, v) => MapEntry(k, v.toJson())),
            SaveCategoryCode.wargearOptions.code: selectedWargearIndices,
            SaveCategoryCode.weaponInfo.code: weaponSnapshot,
            SaveCategoryCode.characteristics.code: characteristics.map((k, v) => MapEntry(k, v.toJson())) /// ИСПРАВЛЕНО
        };
    }

    factory ArmyBuilderUnitItemUi.fromJson(Map<String, dynamic> json)
    {
        final modelStatsRaw = json['modelStats'] as Map<String, dynamic>? ?? {};

        return ArmyBuilderUnitItemUi(
            instanceId: json['instanceId'] ?? '',
            dbId: json['dbId'] ?? '',
            name: json['name'] ?? '',
            role: json['role'] ?? '',
            repeat: json['repeat'] ?? '1',
            keywords: List<String>.from(json['keywords'] ?? []),
            factionKeywords: List<String>.from(json['factionKeywords'] ?? []),
            unitComposition: UnitCompositionDom.fromJson(json['unitComposition'] ?? {}),
            unitAbility: List<String>.from(json['unitAbility'] ?? []),
            coreAbilities: (json['coreAbilities'] as List? ?? [])
                .map((e) => CoreUnitAbilityCode.values.byName(e))
                .toList(),
            factionAbilities: (json['factionAbilities'] as List? ?? [])
                .map((e) => FactionUnitAbilityCode.values.byName(e))
                .toList(),
            leader: (json['leader'] as List ).map((l) => LeaderFilterDom.fromJson(l as Map<String, dynamic>)).toList(),
            ledBy: (json['ledBy'] as List ).map((l) => LeaderFilterDom.fromJson(l as Map<String, dynamic>)).toList(),
            modelStats: modelStatsRaw.map((k, v) => MapEntry(k, ModelStatsDom.fromJson(v))),
            selectedWargearIndices: (json[SaveCategoryCode.wargearOptions.code] as Map<String, dynamic>? ?? {}).map(
                (k, v) => MapEntry(k, List<int>.from(v as List))
            ),
            weaponSnapshot: (json[SaveCategoryCode.weaponInfo.code] as List? ?? [])
                .map((e) => e as Map<String, dynamic>)
                .toList(),
            characteristics: (json[SaveCategoryCode.characteristics.code] as Map<String, dynamic>? ?? {}).map(
                (k, v) => MapEntry(k, CharacteristicsDom.fromJson(v as Map<String, dynamic>))
            )
        );
    }

    factory ArmyBuilderUnitItemUi.empty()
    {
        return ArmyBuilderUnitItemUi(
            instanceId: '',
            dbId: '',
            name: '',
            role: '',
            repeat: 1,
            keywords: [],
            factionKeywords: [],
            unitComposition: UnitCompositionDom.emptyComposition,
            unitAbility: [],
            coreAbilities: [],
            factionAbilities: [],
            leader: [],
            ledBy: [],
            modelStats: {},
            selectedWargearIndices: {},
            weaponSnapshot: [],
            characteristics: {}
        );
    }
}

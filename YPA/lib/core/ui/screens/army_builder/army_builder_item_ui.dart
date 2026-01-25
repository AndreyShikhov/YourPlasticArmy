/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/domain/models/unit/unit_stats.dart';

import '../../../database/tables/seed/seed_objects/_types.dart';

class ArmyBuilderUnitItemUi
{
    final String dbId;
    final String name;
    final String role;
    final String repeat;
    final List<String> keywords;
    final List<String> factionKeywords;
    final UnitComposition unitComposition;
    final List<UnitAbilitiesCode> unitAbility;
    final List<CoreUnitAbilityCode> coreAbilities;
    final List<FactionUnitAbilityCode> factionAbilities;
    final List<String> leader;
    final List<String> ledBy;
    final Map<String, ModelStats> modelStats;
    final Map<int, int> selectedComposition;

    ArmyBuilderUnitItemUi({
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
        required this.selectedComposition
    });

    Map<String, dynamic> toJson() 
    {
        return 
        {
            'dbId': dbId,
            'name': name,
            'role': role,
            'repeat': repeat,
            'keywords': keywords,
            'factionKeywords': factionKeywords,
            'unitComposition': unitComposition.toJson(),
            'unitAbility': unitAbility.map((e) => e.name).toList(),
            'coreAbilities': coreAbilities.map((e) => e.name).toList(),
            'factionAbilities': factionAbilities.map((e) => e.name).toList(),
            'leader': leader,
            'ledBy': ledBy,
            'modelStats': modelStats.map((k, v) => MapEntry(k, v.toJson())),
            'selectedComposition': selectedComposition.map((k, v) => MapEntry(k.toString(), v))
        };
    }

    factory ArmyBuilderUnitItemUi.fromJson(Map<String, dynamic> json)
    {
        final modelStatsRaw = json['modelStats'] as Map<String, dynamic>? ?? {};
        final selectedCompRaw = json['selectedComposition'] as Map<String, dynamic>? ?? {};

        return ArmyBuilderUnitItemUi(
            dbId: json['dbId'] ?? '',
            name: json['name'] ?? '',
            role: json['role'] ?? '',
            repeat: json['repeat']?.toString() ?? '1',
            keywords: List<String>.from(json['keywords'] ?? []),
            factionKeywords: List<String>.from(json['factionKeywords'] ?? []),
            unitComposition: UnitComposition.fromJson(json['unitComposition'] ?? {}),
            unitAbility: (json['unitAbility'] as List? ?? [])
                .map((e) => UnitAbilitiesCode.values.byName(e))
                .toList(),
            coreAbilities: (json['coreAbilities'] as List? ?? [])
                .map((e) => CoreUnitAbilityCode.values.byName(e))
                .toList(),
            factionAbilities: (json['factionAbilities'] as List? ?? [])
                .map((e) => FactionUnitAbilityCode.values.byName(e))
                .toList(),
            leader: List<String>.from(json['leader'] ?? []),
            ledBy: List<String>.from(json['ledBy'] ?? []),
            modelStats: modelStatsRaw.map((k, v) => MapEntry(k, ModelStats.fromJson(v))),
            selectedComposition: selectedCompRaw.map((k, v) => MapEntry(int.parse(k), v as int))
        );
    }

    factory ArmyBuilderUnitItemUi.empty()
    {
        return ArmyBuilderUnitItemUi(
            dbId: '',
            name: '',
            role: '',
            repeat: '1',
            keywords: [],
            factionKeywords: [],
            unitComposition: UnitComposition.emptyComposition,
            unitAbility: [],
            coreAbilities: [],
            factionAbilities: [],
            leader: [],
            ledBy: [],
            modelStats: {},
            selectedComposition: {}
        );
    }
}

/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../../core/database/tables/seed/seed_objects/_types.dart';
import 'model_weapons.dart';

// ==========================================
// UNIT COMPOSITION
// ==========================================

class UnitComposition
{
    final List<String> compositions;
    final List<Map<int, int>> unitCost;   // key - amount models / value - pts
    final Map<int, int>? selectedComposition; // key - amount models / value - pts

    const UnitComposition({
        required this.compositions,
        required this.unitCost,
        this.selectedComposition
    });

    // ==========================================
    // Getters
    // ==========================================

    Map<int, int> get effectiveComposition =>
    (selectedComposition?.isNotEmpty ?? false) ? selectedComposition! : unitCost.first;

    // ==========================================
    // JSON
    // ==========================================
    Map<String, dynamic> toJson() =>
    {
        'composition': compositions,
        'unitCost': unitCost.map((m) => m.map((key, value) => MapEntry(key.toString(), value))).toList(),
        'selectedComposition': selectedComposition?.map((key, value) => MapEntry(key.toString(), value))
    };

    factory UnitComposition.fromJson(Map<String, dynamic> json)
    {
        final rawList = json['unitCost'] as List<dynamic>? ?? [];
        final parsedCost = rawList.map((item)
            {
                final m = item as Map<String, dynamic>;
                return m.map((key, value) => MapEntry(int.parse(key), value as int));
            }).toList();

        final rawSelected = json['selectedComposition'] as Map<String, dynamic>?;
        final Map<int, int>? parsedSelected = rawSelected?.map((key, value) => MapEntry(int.parse(key), value as int));

        return UnitComposition(
            compositions: List<String>.from(json['composition'] ?? []),
            unitCost: parsedCost,
            selectedComposition: parsedSelected
        );
    }

    static const UnitComposition emptyComposition = UnitComposition(compositions: [], unitCost: [], selectedComposition: {});
}

// ==========================================
// WARGEAR OPTIONS
// ==========================================

class WargearOptions
{
    final List<Map<String, List<String>>> wargearOptions;

    const WargearOptions({
        required this.wargearOptions
    });

    Map<String, dynamic> toJson() =>
    {
        'wargear_options': wargearOptions
    };

    factory WargearOptions.fromJson(Map<String, dynamic> json)
    {
        final rawOptions = (json['wargear_options'] as List<dynamic>?) ?? [];
        final List<Map<String, List<String>>> parsedOptions = rawOptions.map((item)
            {
                final map = item as Map<String, dynamic>;
                return map.map((key, value)
                    {
                        return MapEntry(key, (value as List).cast<String>().toList());
                    });
            }).toList();

        return WargearOptions(wargearOptions: parsedOptions);
    }

    static const WargearOptions emptyOptions = WargearOptions(wargearOptions: []);
}

// ==========================================
// Leader
// ==========================================

class LeaderFilter
{
    final FactionTypeCode faction;
    final ArmyTypeCode army;
    final CodexTypeCode? codex;
    final String? detachmentCode;
    final List<String> names;

    const LeaderFilter({
        required this.faction,
        required this.army,
       this.codex,
       this.detachmentCode,
        required this.names
    });

    // ==========================================
    // Json
    // ==========================================

    Map<String, dynamic> toJson() =>
    {
        'faction': faction.name,
        'army': army.name, // ИСПРАВЛЕНО: сохраняем как строку (имя Enum)
        'codex': codex?.name, // ИСПРАВЛЕНО: сохраняем как строку
        'detachment': detachmentCode,
        'names': names
    };

    factory LeaderFilter.fromJson(Map<String, dynamic> json)
    {
        return LeaderFilter(
            faction: FactionTypeCode.values.byName(json['faction'] as String? ?? FactionTypeCode.none.name) ,
            army: ArmyTypeCode.values.byName(json['army'] as String? ?? ArmyTypeCode.none.name),
            codex: CodexTypeCode.values.byName(json['codex'] as String? ?? CodexTypeCode.none.name),
            detachmentCode: json['detachment'] as String? ?? '',
            names: List<String>.from(json['names'] ?? [])
        );
    }

}

// ==========================================
// Model STATS
// ==========================================

class ModelStatsDom
{
    final bool? isNeedShow;
    final int movement;
    final int toughness;
    final int save;
    final int invulnerableSave;
    final int wounds;
    final int leadership;
    final int objectiveControl;
    final ModelWeaponsDom modelWeapons;
    final WargearOptions wargearOptions;

    const ModelStatsDom({
        this.isNeedShow = true,
        required this.movement,
        required this.toughness,
        required this.save,
        required this.invulnerableSave,
        required this.wounds,
        required this.leadership,
        required this.objectiveControl,
        required this.modelWeapons,
        required this.wargearOptions
    });

    Map<String, dynamic> toJson() =>
    {
        'isNeedShow': isNeedShow,
        'movement': movement,
        'toughness': toughness,
        'save': save,
        'invulnerableSave': invulnerableSave,
        'wounds': wounds,
        'leadership': leadership,
        'objectiveControl': objectiveControl,
        'modelWeapons': modelWeapons.toJson(),
        'wargearOptions': wargearOptions.toJson()
    };

    factory ModelStatsDom.fromJson(Map<String, dynamic> json)
    {

        return ModelStatsDom(
            isNeedShow: json['isNeedShow'] as bool? ?? false,
            movement: json['movement'] as int? ?? 0,
            toughness: json['toughness'] as int? ?? 0,
            save: json['save'] as int? ?? 0,
            invulnerableSave: json['invulnerableSave'] as int? ?? 0,
            wounds: json['wounds'] as int? ?? 1,
            leadership: json['leadership'] as int? ?? 6,
            objectiveControl: json['objectiveControl'] as int? ?? 0,
            modelWeapons: ModelWeaponsDom.fromJson(json['modelWeapons'] as Map<String, dynamic>? ?? {}),
            wargearOptions: WargearOptions.fromJson(json['wargearOptions'] as Map<String, dynamic>? ?? {})
        );
    }

    factory ModelStatsDom.empty()
    {
        return const ModelStatsDom(
            isNeedShow: false,
            movement: 0,
            toughness: 0,
            save: 0,
            invulnerableSave: 0,
            wounds: 0,
            leadership: 0,
            objectiveControl: 0,
            modelWeapons: ModelWeaponsDom.emptyOptions,
            wargearOptions: WargearOptions.emptyOptions
        );
    }
}

class UnitStatsDom
{
    final int repeat;
    final List<String> keywords;
    final List<String> factionKeywords;
    final UnitComposition unitComposition;
    final List<String> unitAbility;
    final List<CoreUnitAbilityCode> coreAbilities;
    final List<FactionUnitAbilityCode> factionAbilities;
    final List<LeaderFilter> leader;
    final List<LeaderFilter> ledBy;
    final Map<String, ModelStatsDom> modelStats; // Характеристики моделей юнита

    const UnitStatsDom({
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

    Map<String, dynamic> toJson() =>
    {
        'repeat': repeat,
        'keywords': keywords,
        'factionKeywords': factionKeywords,
        'unitComposition': unitComposition.toJson(),
        'unitAbilities': unitAbility,
        'coreAbilities': coreAbilities.map((a) => a.name).toList(),
        'factionAbilities': factionAbilities.map((a) => a.name).toList(),
        'leader': leader.map((l) => l.toJson()).toList(),
        'ledBy': ledBy.map((l) => l.toJson()).toList(),
        'modelStats': modelStats.map((key, value) => MapEntry(key, value.toJson()))
    };

    factory UnitStatsDom.fromJson(Map<String, dynamic> json)
    {
        final Map<String, dynamic> modelsRaw = json['modelStats'] as Map<String, dynamic>? ?? {};

        return UnitStatsDom(
            repeat: json['repeat'] as int? ?? 1,
            keywords: List<String>.from(json['keywords'] ?? []),
            factionKeywords: List<String>.from(json['factionKeywords'] ?? []),
            unitComposition: UnitComposition.fromJson(json['unitComposition'] ?? {}),
            unitAbility: List<String>.from(json['unitAbilities'] ?? []),
            coreAbilities: (json['coreAbilities'] as List? ?? []).map((e) => CoreUnitAbilityCode.values.byName(e)).toList(),
            factionAbilities: (json['factionAbilities'] as List? ?? []).map((e) => FactionUnitAbilityCode.values.byName(e)).toList(),
            leader: (json['leader'] as List? ?? []).map((l) => LeaderFilter.fromJson(l as Map<String, dynamic>)).toList(),
            ledBy: (json['ledBy'] as List? ?? []).map((l) => LeaderFilter.fromJson(l as Map<String, dynamic>)).toList(),
            modelStats: modelsRaw.map((key, value) => MapEntry(key, ModelStatsDom.fromJson(value)))
        );
    }

    static UnitStatsDom empty() => UnitStatsDom(
        repeat: 1,
        keywords: [],
        factionKeywords: [],
        unitComposition: UnitComposition.emptyComposition,
        unitAbility: [],
        coreAbilities: [],
        factionAbilities: [],
        leader: [],
        ledBy: [],
        modelStats: {}
    );
}

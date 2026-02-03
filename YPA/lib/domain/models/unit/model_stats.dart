/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import '../../../core/database/tables/seed/seed_objects/_types.dart';
import 'model_weapons.dart';

// ==========================================
// UNIT COMPOSITION
// ==========================================

class UnitCompositionDom
{
    final List<UnitCompositionModelDom> compositions;
    final UnitCompositionModelDom? selectedComposition;
    final List<UnitCompositionModelDom> additionalModels; // Сделал не nullable для удобства (по умолчанию [])

    const UnitCompositionDom({
        required this.compositions,
        this.selectedComposition,
        this.additionalModels = const[]
    });

    UnitCompositionDom copyWith({
        List<UnitCompositionModelDom>? compositions,
        UnitCompositionModelDom? selectedComposition,
        List<UnitCompositionModelDom>? additionalModels
    }) 
    {
        return UnitCompositionDom(
          compositions: compositions?? this.compositions,
          selectedComposition: selectedComposition?? this.selectedComposition,
          additionalModels: additionalModels?? this.additionalModels
        );
    }

    // ==========================================
    // Getters
    // ==========================================

    // ИСПРАВЛЕНО: Теперь возвращает Map<int, int> через двоеточие {:}, а не запятую
    Map<int, int> get effectiveComposition 
    {
        final active = selectedComposition ?? compositions.firstOrNull;
        if (active == null) return {0: 0};
        return {active.amount: active.cost};
    }

    // ==========================================
    // JSON
    // ==========================================
    Map<String, dynamic> toJson() =>
    {
        'compositions': compositions.map((c) => c.toJson()).toList(),
        'selectedComposition': selectedComposition?.toJson(),
        'additionalModels': additionalModels.map((c) => c.toJson()).toList()
    };

    Map<String, dynamic> toSaveUserArmyJson() =>
    {
        'selectedComposition': selectedComposition?.toJson(),
        'additionalModels': additionalModels
            .where((c) => c.isSelected)
            .map((c) => c.toJson())
            .toList()
    };

    factory UnitCompositionDom.fromJson(Map<String, dynamic> json)
    {
        return UnitCompositionDom(
            compositions: (json['compositions'] as List? ?? [])
                .map((e) => UnitCompositionModelDom.fromJson(e as Map<String, dynamic>))
                .toList(),
            selectedComposition: json['selectedComposition'] != null
                ? UnitCompositionModelDom.fromJson(json['selectedComposition'] as Map<String, dynamic>)
                : null,
            additionalModels: (json['additionalModels'] as List? ?? [])
                .map((e) => UnitCompositionModelDom.fromJson(e as Map<String, dynamic>))
                .toList()
        );
    }

    static const UnitCompositionDom emptyComposition = UnitCompositionDom(
        compositions: [],
        selectedComposition: null,
        additionalModels: []
    );
}

class UnitCompositionModelDom
{
    final String name;
    final int amount;
    final int cost;
    final bool isSelected;

    const UnitCompositionModelDom({
        required this.name,
        required this.amount,
        required this.cost,
        this.isSelected = false
    });

    Map<String, dynamic> toJson() => 
    {
        'name': name,
        'amount': amount,
        'cost': cost,
        'isSelected': isSelected
    };

    factory UnitCompositionModelDom.fromJson(Map<String, dynamic> json) => UnitCompositionModelDom(
        name: json['name'] as String,
        amount: json['amount'] as int,
        cost: json['cost'] as int,
        isSelected: json['isSelected'] as bool? ?? false
    );
}
// ==========================================
// WARGEAR OPTIONS
// ==========================================

class WargearOptionsDom
{
    final List<Map<String, List<String>>> wargearOptions;

    const WargearOptionsDom({
        required this.wargearOptions
    });

    Map<String, dynamic> toJson() =>
    {
        'wargear_options': wargearOptions
    };

    factory WargearOptionsDom.fromJson(Map<String, dynamic> json)
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

        return WargearOptionsDom(wargearOptions: parsedOptions);
    }

    static const WargearOptionsDom emptyOptions = WargearOptionsDom(wargearOptions: []);
}

// ==========================================
// Leader
// ==========================================

class LeaderFilterDom
{
    final FactionTypeCode faction;
    final ArmyTypeCode army;
    final CodexTypeCode? codex;
    final String? detachmentCode;
    final List<String> names;

    const LeaderFilterDom({
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

    factory LeaderFilterDom.fromJson(Map<String, dynamic> json)
    {
        return LeaderFilterDom(
            faction: FactionTypeCode.values.byName(json['faction'] as String? ?? FactionTypeCode.none.name),
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
    final WargearOptionsDom wargearOptions;

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
            wargearOptions: WargearOptionsDom.fromJson(json['wargearOptions'] as Map<String, dynamic>? ?? {})
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
            wargearOptions: WargearOptionsDom.emptyOptions
        );
    }
}

class UnitStatsDom
{
    final int repeat;
    final List<String> keywords;
    final List<String> factionKeywords;
    final UnitCompositionDom unitComposition;
    final List<String> unitAbility;
    final List<CoreUnitAbilityCode> coreAbilities;
    final List<FactionUnitAbilityCode> factionAbilities;
    final List<LeaderFilterDom> leader;
    final List<LeaderFilterDom> ledBy;
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
            unitComposition: UnitCompositionDom.fromJson(json['unitComposition'] ?? {}),
            unitAbility: List<String>.from(json['unitAbilities'] ?? []),
            coreAbilities: (json['coreAbilities'] as List? ?? []).map((e) => CoreUnitAbilityCode.values.byName(e)).toList(),
            factionAbilities: (json['factionAbilities'] as List? ?? []).map((e) => FactionUnitAbilityCode.values.byName(e)).toList(),
            leader: (json['leader'] as List? ?? []).map((l) => LeaderFilterDom.fromJson(l as Map<String, dynamic>)).toList(),
            ledBy: (json['ledBy'] as List? ?? []).map((l) => LeaderFilterDom.fromJson(l as Map<String, dynamic>)).toList(),
            modelStats: modelsRaw.map((key, value) => MapEntry(key, ModelStatsDom.fromJson(value)))
        );
    }

    static UnitStatsDom empty() => UnitStatsDom(
        repeat: 1,
        keywords: [],
        factionKeywords: [],
        unitComposition: UnitCompositionDom.emptyComposition,
        unitAbility: [],
        coreAbilities: [],
        factionAbilities: [],
        leader: [],
        ledBy: [],
        modelStats: {}
    );
}

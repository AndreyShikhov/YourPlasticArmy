/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'dart:convert';

import 'package:uuid/uuid.dart';
import 'package:ypa/domain/models/army/army.dart';
import 'package:ypa/domain/models/codex/codex_id.dart';
import 'package:ypa/domain/models/detachment/detachment.dart';

import '../../../core/database/tables/seed/seed_objects/_types.dart';
import '../faction/faction.dart';
import '../unit/unit.dart';

enum SaveCategoryCode
{

    instanceId('instanceId', 'Instance Id'),
    unitId('unitId', 'Unit Id'),
    composition('composition', 'Composition'),
    points('points', 'Points'),
    wargearOptions('wargearOptions', 'Wargear Options'),
    weaponInfo('weaponInfo', 'Weapon Info'),
    characteristics('characteristics', 'Characteristics'),
    enhancement('enhancement','Enhancement');

    final String code;
    final String title;
    const SaveCategoryCode(this.code, this.title);

    static SaveCategoryCode? fromTitle(String title) =>
    values.where((e) => e.title == title).firstOrNull;

    static SaveCategoryCode? fromName(String name) =>
    values.where((e) => e.name == name).firstOrNull;
}

class UserArmyDOM
{
    final String id;
    final String userArmyName;
    final FactionId factionId;
    final ArmyId armyId;
    final CodexId codexId;
    final String? detachmentId;
    final DetachmentDOM? detachment;
    final BattleSize? battleSize;
    final String? warlordInstanceId;
    final String jsonData;
    final DateTime createdAt;

    const UserArmyDOM({
        required this.id,
        required this.userArmyName,
        required this.factionId,
        required this.armyId,
        required this.codexId,
        this.detachmentId,
        this.detachment,
        this.battleSize,
        this.warlordInstanceId,
        required this.jsonData,
        required this.createdAt
    });

    UserArmyDOM copyWith({
        String? id,
        String? userArmyName,
        int? totalPoints,
        FactionId? factionId,
        ArmyId? armyId,
        CodexId? codexId,
        String? detachmentId,
        DetachmentDOM? detachment,
        BattleSize? battleSize,
        String? warlordInstanceId,
        String? jsonData,
        DateTime? createdAt
    })
    {
        return UserArmyDOM(
            id: this.id,
            userArmyName: userArmyName ?? this.userArmyName,
            factionId: factionId ?? this.factionId,
            armyId: this.armyId,
            codexId: this.codexId,
            detachmentId: detachmentId ?? this.detachmentId,
            detachment: detachment ?? this.detachment,
            battleSize: battleSize ?? this.battleSize,
            warlordInstanceId: warlordInstanceId ?? this.warlordInstanceId,
            jsonData: jsonData ?? this.jsonData,
            createdAt: this.createdAt
        );
    }

    /// Метод для обновления формата битвы (Battle Size)
    UserArmyDOM updateBattleSize(BattleSizeCode newSize)
    {
        return copyWith(
            battleSize: BattleSize.selected(newSize)
        );
    }

    UserArmyDOM updateSelectedWarlord(String newIdWarlord)
    {
        return copyWith(
            warlordInstanceId: newIdWarlord,
        );
    }

    UserArmyDOM updateSelectedDetachment(DetachmentDOM newDetachment, String newDetachmentId)
    {
      return copyWith(
        detachment: newDetachment,
        detachmentId: newDetachmentId
      );
    }

    UserArmyDOM updateUserArmyName(String newArmyName)
    {
      return copyWith(
        userArmyName: newArmyName,
      );
    }

    /// Добавляет юнит в jsonData, соблюдая структуру категорий.
    /// [role] — это строковый код роли (например, 'Characters', 'Battleline'), который станет ключом в JSON.
    Future<UserArmyDOM> addUnitToUserArmy(
        String unitId,
        String instanceId,
        String role,
        UnitCompositionDom composition,
        Map<String, List<int>> selectedWargear,
        List<Map<String, dynamic>> weaponSnapshot,
        Map<String, dynamic> characteristics
    ) async
    {
        /// 1. Декодируем текущий JSON или создаем структуру по умолчанию
        Map<String, dynamic> root;
        if (jsonData.isEmpty)
        {
            root =
            {
                "version": 1,
                "categories": {}
            };
        } else
        {
            try
            {
                root = jsonDecode(jsonData);
            } catch (e)
            {
                root = {"version": 1, "categories": {}};
            }
        }

        /// 2. Получаем или создаем мапу категорий
        Map<String, dynamic> categories = root["categories"] ?? {};

        /// 3. Получаем список юнитов для конкретной роли
        List<dynamic> unitList = categories[role] ?? [];

        final finalComposition = (composition.selectedComposition == null && composition.compositions.isNotEmpty)
            ? UnitCompositionDom(
                compositions: composition.compositions,
                selectedComposition: composition.compositions.first,
                additionalModels: composition.additionalModels
            ) : composition;

        /// 4. Формируем новый объект юнита
        final newUnitInstance =
            {

                SaveCategoryCode.instanceId.code: instanceId,                               /// Уникальный ID отряда в ростере
                SaveCategoryCode.unitId.code: unitId,                                       /// Ссылка на ID базового юнита из таблицы Units
                SaveCategoryCode.composition.code: finalComposition.toSaveUserArmyJson(),   /// Сохзраняем не весь Compositionа только выбранные элементы
                SaveCategoryCode.points.code: finalComposition.totalUnitCost,               /// Cтоимость юнита"
                SaveCategoryCode.wargearOptions.code: selectedWargear,                      /// Warger выбранные варгиры
                SaveCategoryCode.weaponInfo.code: weaponSnapshot,                           /// Информация таблиц с оружием
                SaveCategoryCode.characteristics.code: characteristics                      /// Обновлённые характеристики Юнита
            };

        /// 5. Добавляем юнит в список и обновляем структуру
        unitList.add(newUnitInstance);
        categories[role] = unitList;
        root["categories"] = categories;

        /// 6. Возвращаем новый экземпляр UserArmyDOM с обновленной JSON-строкой
        return copyWith(jsonData: jsonEncode(root));
    }

    Future<UserArmyDOM> duplicateUnitInstance(String instanceId, String role) async
    {
        if (jsonData.isEmpty) return this;
        final root = jsonDecode(jsonData);
        final categories = root["categories"] ?? {};
        final List<dynamic> unitList = categories[role] ?? [];

        /// Находим инстанс, который хотим скопировать
        final originalIndex = unitList.indexWhere((u) => u['instanceId'] == instanceId);
        if (originalIndex == -1) return this;

        /// Создаем глубокую копию объекта
        final original = unitList[originalIndex];
        final duplicate =
            {
                ...original,
                SaveCategoryCode.instanceId.code: const Uuid().v4() /// ОБЯЗАТЕЛЬНО новый уникальный ID
            };

        /// Вставляем копию сразу после оригинала
        unitList.insert(originalIndex + 1, duplicate);

        return copyWith(jsonData: jsonEncode(root));
    }

    /// Удаляет ПОСЛЕДНИЙ добавленный экземпляр юнита с указанным [unitId] из конкретной [role].
    Future<UserArmyDOM> removeLastUnitFromUserArmy(String unitId, String role) async
    {
        if (jsonData.isEmpty) return this;

        try
        {
            final Map<String, dynamic> root = jsonDecode(jsonData);
            final Map<String, dynamic> categories = root["categories"] ?? {};

            /// Ищем список именно в той категории, которую передали
            List<dynamic> unitList = categories[role] ?? [];

            if (unitList.isEmpty) return this;

            /// Ищем индекс последнего юнита с таким unitId в этой категории
            int lastIndex = -1;
            for (int i = unitList.length - 1; i >= 0; i--)
            {
                if (unitList[i][SaveCategoryCode.unitId.code] == unitId)
                {
                    lastIndex = i;
                    break;
                }
            }

            /// Если нашли — удаляем и обновляем JSON
            if (lastIndex != -1)
            {
                unitList.removeAt(lastIndex);
                categories[role] = unitList;
                root["categories"] = categories;
                return copyWith(jsonData: jsonEncode(root));
            }

            return this; /// Если не нашли в этой категории
        } catch (e)
        {
            /// Использование print или debugPrint для доменных моделей допустимо для отладки
            return this;
        }
    }

    /// Обновляет парметры [updateData] экземпляр юнита с указанным [unitId] из конкретной [role].
    Future<UserArmyDOM> updateUnitInstance(String instanceId, String role, SaveCategoryCode category, dynamic updateData) async
    {
        if (jsonData.isEmpty) return this;
        final root = jsonDecode(jsonData);
        final categories = root["categories"] ?? {};
        final List<dynamic> unitList = categories[role] ?? [];

        final index = unitList.indexWhere((u) => u[SaveCategoryCode.instanceId.code] == instanceId);
        if (index == -1) return this;

        // Обновляем данные инстанса, подмешивая новые поля (updateData)
        unitList[index][category.code] = updateData;

        return copyWith(jsonData: jsonEncode(root));
    }

    /// ==========================================
    /// Getters
    /// ==========================================
    int get totalPoints
    {
        if (jsonData.isEmpty) return 0;

        try
        {
            final Map<String, dynamic> root = jsonDecode(jsonData);
            final Map<String, dynamic> categories = root["categories"] ?? {};
            int total = 0;

            for (var unitList in categories.values)
            {
                if (unitList is List)
                {
                    for (var unitInstance in unitList)
                    {
                        /// Предполагаем, что при сохранении юнита в JSON
                        /// мы записываем его текущую стоимость (points)
                        total += (unitInstance['points'] as int? ?? 0);
                    }
                }
            }
            return total;
        } catch (e)
        {
            return 0;
        }
    }

}

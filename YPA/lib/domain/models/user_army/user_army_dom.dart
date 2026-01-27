/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'dart:convert';

import 'package:uuid/uuid.dart';
import 'package:ypa/domain/models/army/army.dart';
import 'package:ypa/domain/models/codex/codex_id.dart';
import 'package:ypa/domain/models/detachment/detachment.dart';

import '../../../core/database/tables/seed/seed_objects/_types.dart';

class UserArmyDOM
{
    final String id;
    final String name;
    final ArmyId armyId;
    final CodexId codexId;
    final String? detachmentId;
    final DetachmentDOM? detachment;
    final BattleSize? selectedBattleSize;
    final String jsonData;
    final DateTime createdAt;

    const UserArmyDOM({
        required this.id,
        required this.name,
        required this.armyId,
        required this.codexId,
        this.detachmentId,
        this.detachment,
        this.selectedBattleSize,
        required this.jsonData,
        required this.createdAt
    });

    UserArmyDOM copyWith({
        String? name,
        int? totalPoints,
        ArmyId? armyId,
        String? detachmentId,
        DetachmentDOM? detachment,
        BattleSize? selectedBattleSize,
        String? jsonData
    }) 
    {
        return UserArmyDOM(
            id: this.id,
            name: name ?? this.name,
            armyId: this.armyId,
            codexId: this.codexId,
            detachmentId: detachmentId ?? this.detachmentId,
            detachment: detachment ?? this.detachment,
            selectedBattleSize: selectedBattleSize ?? this.selectedBattleSize,
            jsonData: jsonData ?? this.jsonData,
            createdAt: this.createdAt
        );
    }

    /// Метод для обновления формата битвы (Battle Size)
    UserArmyDOM updateBattleSize(BattleSizeCode newSize) 
    {
        return copyWith(
            selectedBattleSize: BattleSize.selected(newSize)
        );
    }

    /// Добавляет юнит в jsonData, соблюдая структуру категорий.
    /// [role] — это строковый код роли (например, 'Characters', 'Battleline'), который станет ключом в JSON.
    Future<UserArmyDOM> addUnitToUserArmy(String unitId, String role) async
    {
        // 1. Декодируем текущий JSON или создаем структуру по умолчанию
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

        // 2. Получаем или создаем мапу категорий
        Map<String, dynamic> categories = root["categories"] ?? {};

        // 3. Получаем список юнитов для конкретной роли
        List<dynamic> unitList = categories[role] ?? [];

        // 4. Формируем новый объект юнита
        final newUnitInstance = 
        {
            "instanceId": const Uuid().v4(), // Уникальный ID отряда в ростере
            "unitId": unitId,               // Ссылка на ID базового юнита из таблицы Units
            "wargearOptions": {}           // Пока пустой объект опций
        };

        // 5. Добавляем юнит в список и обновляем структуру
        unitList.add(newUnitInstance);
        categories[role] = unitList;
        root["categories"] = categories;

        // 6. Возвращаем новый экземпляр UserArmyDOM с обновленной JSON-строкой
        return copyWith(jsonData: jsonEncode(root));
    }

    Future<UserArmyDOM> duplicateUnitInstance(String instanceId, String role) async {
      if (jsonData.isEmpty) return this;
      final root = jsonDecode(jsonData);
      final categories = root["categories"] ?? {};
      final List<dynamic> unitList = categories[role] ?? [];

      // Находим инстанс, который хотим скопировать
      final originalIndex = unitList.indexWhere((u) => u['instanceId'] == instanceId);
      if (originalIndex == -1) return this;

      // Создаем глубокую копию объекта
      final original = unitList[originalIndex];
      final duplicate = {
        ...original,
        "instanceId": const Uuid().v4(), // ОБЯЗАТЕЛЬНО новый уникальный ID
      };

      // Вставляем копию сразу после оригинала
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

            // Ищем список именно в той категории, которую передали
            List<dynamic> unitList = categories[role] ?? [];

            if (unitList.isEmpty) return this;

            // Ищем индекс последнего юнита с таким unitId в этой категории
            int lastIndex = -1;
            for (int i = unitList.length - 1; i >= 0; i--)
            {
                if (unitList[i]['unitId'] == unitId) 
                {
                    lastIndex = i;
                    break;
                }
            }

            // Если нашли — удаляем и обновляем JSON
            if (lastIndex != -1) 
            {
                unitList.removeAt(lastIndex);
                categories[role] = unitList;
                root["categories"] = categories;
                return copyWith(jsonData: jsonEncode(root));
            }

            return this; // Если не нашли в этой категории
        } catch (e)
        {
            // Использование print или debugPrint для доменных моделей допустимо для отладки
            return this;
        }
    }
}

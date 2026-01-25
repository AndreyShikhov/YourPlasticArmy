/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:ypa/domain/models/unit/unit_stats.dart';

class UnitStatsConverter extends TypeConverter<Map<String, UnitStats>, String> {
  const UnitStatsConverter();

  @override
  Map<String, UnitStats> fromSql(String fromDb) {
    try {
      final Map<String, dynamic> decoded = json.decode(fromDb);
      // Превращаем Map<String, dynamic> обратно в Map<String, UnitStats>
      return decoded.map((key, value) => MapEntry(
        key,
        UnitStats.fromJson(value as Map<String, dynamic>),
      ));
    } catch (e) {
      return {}; // Возвращаем пустую карту в случае ошибки
    }
  }

  @override
  String toSql(Map<String, UnitStats> value) {
    // Сериализуем карту в JSON-строку
    return json.encode(value.map((key, stats) => MapEntry(
      key,
      stats.toJson(),
    )));
  }
}

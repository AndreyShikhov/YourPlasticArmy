/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:ypa/domain/models/unit/unit_stats.dart';

class UnitStatsConverter extends TypeConverter<UnitStats, String> {
  const UnitStatsConverter();

  @override
  UnitStats fromSql(String fromDb) {
    try {
      if (fromDb.isEmpty) return UnitStats.empty();
      return UnitStats.fromJson(json.decode(fromDb) as Map<String, dynamic>);
    } catch (e) {
      return UnitStats.empty();
    }
  }

  @override
  String toSql(UnitStats value) {
    return json.encode(value.toJson());
  }
}

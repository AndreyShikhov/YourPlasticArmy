/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:ypa/domain/models/unit/model_stats.dart';

class UnitStatsConverter extends TypeConverter<UnitStatsDom, String>
{
    const UnitStatsConverter();

    @override
    UnitStatsDom fromSql(String fromDb)
    {
        try
        {
            if (fromDb.isEmpty) return UnitStatsDom.empty();
            return UnitStatsDom.fromJson(json.decode(fromDb) as Map<String, dynamic>);
        } catch (e)
        {
            return UnitStatsDom.empty();
        }
    }

    @override
    String toSql(UnitStatsDom value)
    {
        return json.encode(value.toJson());
    }
}

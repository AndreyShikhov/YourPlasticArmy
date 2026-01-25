/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:ypa/domain/models/unit/unit_stats.dart';

class ViewArmyUnitItemUi
{
    final String name;
    final String role;
    final String m; // Movement
    final String t; // Toughness
    final String sv; // Save
    final String isv; // Invulnerable Save
    final String w; // Wounds
    final String ld; // Leadership
    final String oc; // Objective Control
    final List<String> keywords;
    final List<String> factionKeywords;
    final List<Weapon> weapons;

    ViewArmyUnitItemUi({
        required this.name,
        required this.role,
        required this.m,
        required this.t,
        required this.sv,
        required this.isv,
        required this.w,
        required this.ld,
        required this.oc,
        required this.keywords,
        required this.factionKeywords,
        required this.weapons
    });
}

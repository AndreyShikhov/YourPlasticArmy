/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';

import '../view_army/view_army_item.dart';

class ViewUnitScreen extends StatelessWidget
{
    final String instanceId;
    final ViewArmyUnitItemUi unit;

    const ViewUnitScreen({
        super.key,
        required this.instanceId,
        required this.unit
    });

    @override
    Widget build(BuildContext context)
    {
        return Text(unit.name);
    }
}

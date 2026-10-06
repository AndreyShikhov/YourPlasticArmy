/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewUnitScreen extends ConsumerWidget
{
    final String instanceId;
    final String role;
    final String armyId;

    const ViewUnitScreen({
        super.key,
        required this.instanceId,
        required this.role,
        required this.armyId
    });

    @override
    Widget build(BuildContext context, WidgetRef ref) 
    {
        return Text('ViewUnitScreen');
    }
}

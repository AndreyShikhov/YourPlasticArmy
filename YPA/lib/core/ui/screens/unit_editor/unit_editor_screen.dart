
/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ypa/core/ui/screens/unit_editor/unit_editor_controller.dart';

class UnitEditorScreen extends ConsumerWidget
{
    final String armyId;
    final String instanceId;
    final String roleCode;

    UnitEditorScreen({
        super.key,
        required this.armyId,
        required this.instanceId,
        required this.roleCode
    }); 

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        final state = ref.watch(unitEditorControllerProvider((armyId, instanceId,roleCode)));

        // TODO: implement build
        return Scaffold(

        );
    }

}

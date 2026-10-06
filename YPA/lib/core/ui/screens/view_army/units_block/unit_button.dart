/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/style_data.dart';

class ViewUnitButton extends ConsumerWidget
{
    final String name;
    final String armyId;
    final String unitInstanceId;
    final String role;
    final StylePosition position;
    final Color bgColor;

    const ViewUnitButton({
        super.key, 
        required this.name,
        required this.armyId,
        required this.unitInstanceId,
        required this.role,
        required this.position,
        required this.bgColor
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
        return Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(
                    topLeft: position == StylePosition.first || position == StylePosition.single ? const Radius.circular(ypaBorderRadiusValue) : Radius.zero,
                    topRight: position == StylePosition.first || position == StylePosition.single ? const Radius.circular(ypaBorderRadiusValue) : Radius.zero,
                    bottomLeft: position == StylePosition.last || position == StylePosition.single ? const Radius.circular(ypaBorderRadiusValue) : Radius.zero,
                    bottomRight: position == StylePosition.last || position == StylePosition.single ? const Radius.circular(ypaBorderRadiusValue) : Radius.zero
                )
            ),
            child: InkWell(
                onTap: ()
                {
                    final String unitInsID = unitInstanceId;
                    final String roleCode = role;
                    context.push('/game_screen/army_lyst/view_army/$armyId/view_unit/$roleCode/$unitInsID');
                },
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Row( /// название юнита и стоимость
                                children: [
                                    Expanded(
                                        child: Text(name,
                                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis)
                                    ) 
                                ]
                            )
                        ]
                    )
                )
            )
        );
    }
}

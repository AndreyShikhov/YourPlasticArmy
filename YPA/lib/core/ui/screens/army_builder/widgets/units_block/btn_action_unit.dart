/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/style_data.dart';


enum BTNunitActionType{
    dublicate,
    remove,
}

extension BTNunitActionTypeX on BTNunitActionType {
  String get code => name;

  String get title
  {
    switch (this)
    {
      case BTNunitActionType.dublicate:
        return 'Duplicate';
      case BTNunitActionType.remove:
        return 'Remove';
    }
  }
}

class BTNActionUnit extends ConsumerWidget
{
    final Color bgColor;
    final String? actionText;
    final BTNunitActionType actionType;
    final VoidCallback onAction;


    const BTNActionUnit({
        super.key,
        required this.bgColor,
        this.actionText,
        required this.actionType,
        required this.onAction
    });

    @override
    Widget build(BuildContext context, WidgetRef ref)
    {
      bool isDublicate = actionType == BTNunitActionType.dublicate;
      final Icon icnBTN =  Icon( isDublicate ?  Icons.copy : Icons.delete ,
          size: 36,
          color: isDublicate ? Colors.blueAccent : Colors.redAccent);

        return Container(

            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: ypaBorderRadius,
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                    IconButton(
                        icon: icnBTN,
                        onPressed: onAction,
                        tooltip: BTNunitActionTypeX(actionType).title
                    ),
                ]
            )
        );
    }
}

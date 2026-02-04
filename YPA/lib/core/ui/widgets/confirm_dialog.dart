/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget
{
    final String title;
    final String message;
    final String confirmLabel;
    final String cancelLabel;
    final Color? confirmColor;

    const ConfirmDialog({
        super.key,
        required this.title,
        required this.message,
        this.confirmLabel = 'DELETE',
        this.cancelLabel = 'CANCEL',
        this.confirmColor = Colors.red
    });

    @override
    Widget build(BuildContext context) 
    {
        return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
                TextButton(onPressed: () => Navigator.pop(context, false), child: Text(cancelLabel)),
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text(confirmLabel, style: TextStyle(color: confirmColor))
                )
            ]
        );
    }
}

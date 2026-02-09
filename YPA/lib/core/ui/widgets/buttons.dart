/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';


class AppIconButton extends StatelessWidget
{
    final IconData icon;
    final VoidCallback? onTap;
    final bool enabled;
    final String? tooltip;
    final Color? color;
    final Color? disabledColor;

    const AppIconButton({
        super.key,
        required this.icon,
        required this.onTap,
        this.enabled = true,
        this.tooltip,
        this.color = Colors.white,
        this.disabledColor = Colors.white24
    });

    @override
    Widget build(BuildContext context) 
    {
        return IconButton(
            tooltip: tooltip,
            onPressed: enabled ? onTap : null,
            icon: Icon(icon),
            color: color,
            disabledColor: disabledColor,
            visualDensity: VisualDensity.compact
        );
    }
}

/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';

import '../screens/data/style_data.dart';

class MainButton extends StatelessWidget
{
    final String? textBTN;
    final bool isActive;
    final VoidCallback? onPressed;
    final Widget? child;
    final ButtonStyle? style;

    const MainButton({
        super.key,
        required this.onPressed,
        this.child,
        this.textBTN,
        this.isActive = true,
        this.style
    });

    /// Кэшируем стиль, чтобы не пересоздавать его при каждом build
    static final ButtonStyle _defaultStyle = FilledButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 78, 73, 73),
        foregroundColor: texColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        fixedSize: const Size(160, 80),
        side: const BorderSide(color: Colors.black, width: 2, strokeAlign: BorderSide.strokeAlignOutside),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
    );

    @override
    Widget build(BuildContext context) 
    {
        return FilledButton(
            onPressed: isActive ? onPressed : null,
            style: style ?? _defaultStyle,
            /// Используем вспомогательный класс для текста
            child: child ?? _ButtonText(text: textBTN),
        );
    }
}

/// Вынос текста в отдельный виджет позволяет Flutter оптимизировать его пересборку
class _ButtonText extends StatelessWidget {
    final String? text;
    const _ButtonText({this.text});

    @override
    Widget build(BuildContext context) {
        if (text == null) return const SizedBox.shrink();
        return Text(text!);
    }
}

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

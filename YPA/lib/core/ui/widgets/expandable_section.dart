/*******************************************************************************
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 ******************************************************************************/

import 'package:flutter/material.dart';

class ExpandableSection extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;
  final Widget? trailing;

  // Теперь это обязательные параметры для управления состоянием извне
  final bool isExpanded;
  final ValueChanged<bool> onExpansionChanged;

  const ExpandableSection({
    super.key,
    required this.title,
    required this.child,
    required this.isExpanded,
    required this.onExpansionChanged,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          // При нажатии просто сообщаем родителю, что хотим инвертировать состояние
          onTap: () => onExpansionChanged(!isExpanded),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 45, 45, 45),
              border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.1))),
            ),
            child: Row(
              children: [
                Icon(isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right, color: Colors.white70),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                if (subtitle != null) ...[
                  const Spacer(),
                  Text(subtitle!, style: const TextStyle(color: Colors.white38, fontSize: 14)),
                ],
                if (trailing == null && subtitle == null) const Spacer(),
                if (trailing != null) ...[const SizedBox(width: 10), trailing!],
              ],
            ),
          ),
        ),
        // Показываем содержимое только если родитель передал isExpanded = true
        if (isExpanded)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            color: const Color.fromARGB(255, 35, 35, 35),
            child: child,
          ),
      ],
    );
  }
}

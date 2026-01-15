import 'package:flutter/material.dart';

class ExpandableSection extends StatefulWidget {
  final String title;
  final String? subtitle;
  final Widget child;
  final bool initialExpanded;
  // Добавляем универсальный виджет для правой части
  final Widget? trailing;

  const ExpandableSection({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.initialExpanded = false,
    this.trailing, // Передаем его в конструктор
  });

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initialExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 45, 45, 45),
              border: Border(
                bottom: BorderSide(color: Colors.white.withValues(alpha:0.1)),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  _isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                  color: Colors.white70,
                ),
                const SizedBox(width: 10),
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (widget.subtitle != null) ...[
                  const Spacer(),
                  Text(
                    widget.subtitle!,
                    style: const TextStyle(color: Colors.white38, fontSize: 14),
                  ),
                ],

                // Если trailing не передан, ставим Spacer, если передан — показываем его
                if (widget.trailing == null && widget.subtitle == null) const Spacer(),

                if (widget.trailing != null) ...[
                  const SizedBox(width: 10),
                  widget.trailing!,
                ],
              ],
            ),
          ),
        ),
        if (_isExpanded)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            color: const Color.fromARGB(255, 35, 35, 35),
            child: widget.child,
          ),
      ],
    );
  }
}

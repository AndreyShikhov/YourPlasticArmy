import 'package:flutter/material.dart';
import '../screens/data/style_data.dart';


class MainButton extends FilledButton {
  final String ? textBTN;
  final bool isActive;

  MainButton({
    super.key,
    required VoidCallback? onPressed,
    Widget ? child,
    this.textBTN,
    required this.isActive,
    ButtonStyle? style,

  }) : super (
    onPressed: isActive ? onPressed : null,
    child: child ?? Text(textBTN ?? ' button'),
    style: style?? mainButtonStyle(null),

  );


  static ButtonStyle mainButtonStyle(BuildContext? context) {
    return FilledButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 78, 73, 73), // Цвет фона
      foregroundColor: texColor, // Цвет текста
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      fixedSize: const Size(160, 80),
      side: const BorderSide(color: Colors.black,width: 2,strokeAlign: BorderSide.strokeAlignOutside),
      shape:const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ),
    );
  }
}

class AppIconButton extends StatelessWidget {
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
    this.disabledColor = Colors.white24,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      // Если enabled = false, передаем null в onPressed, что дизейблит кнопку
      onPressed: enabled ? onTap : null,
      icon: Icon(icon),
      color: color,
      disabledColor: disabledColor,
      // Делает кнопку компактнее, убирая лишние отступы
      visualDensity: VisualDensity.compact,
    );
  }
}
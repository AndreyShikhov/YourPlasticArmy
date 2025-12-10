import 'package:flutter/material.dart';
import 'package:ypa/core/data/style_data.dart';

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
      backgroundColor: Color.fromARGB(255, 78, 73, 73), // Цвет фона
      foregroundColor: texColor, // Цвет текста
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      fixedSize: Size(160, 80),
      side: BorderSide(color: Colors.black,width: 2,strokeAlign: BorderSide.strokeAlignOutside),
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ),
    );
  }
}



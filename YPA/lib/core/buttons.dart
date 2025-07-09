import 'package:flutter/material.dart';

class MainButton extends FilledButton {
 final  String ?  textBTN;
 final bool  isActive;

  MainButton({
    super.key,
    required  VoidCallback? onPressed,
    Widget ? child,
    this.textBTN,
    required this.isActive,
  }): super (
    onPressed:  isActive?   onPressed : null,
    child: child ?? Text( textBTN ?? ' button'),

  );



 static ButtonStyle customStyle(BuildContext context) {
   return FilledButton.styleFrom(
     backgroundColor: Colors.blue, // Цвет фона
     foregroundColor: Colors.white, // Цвет текста
     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
   );
 }
}
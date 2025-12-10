import 'package:flutter/material.dart';


class BaseWindow extends StatelessWidget {

  final Color bgColor;
  final Widget child; // content widget
  const BaseWindow({
    super.key,
    this.bgColor = Colors.black,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: child,
    );
  }
}






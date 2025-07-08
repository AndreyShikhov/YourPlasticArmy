import 'package:flutter/material.dart';
import 'package:ypa/core/buttons.dart'  show  MainButton;


class BaseWindow extends StatelessWidget {

  final Color bgColor;
  const BaseWindow( {super.key, this.bgColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgColor,
      )
    );
  }
}
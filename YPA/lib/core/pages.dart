import 'package:flutter/material.dart';
import 'package:ypa/core/buttons.dart'  show  MainButton;


class BaseWindow extends StatelessWidget {

  final Color bgColor;
  final Widget child; // content widget
  const BaseWindow( {super.key,
    this.bgColor = Colors.black,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: child,
    );
  }
}


class MainScreen extends StatelessWidget
{
  final Color contentColor;

  const MainScreen({super.key, this.contentColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: contentColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainButton(
                onPressed: (){},
                textBTN: 'Firtst button',
                isActive: true),
            const SizedBox(height: 20),


           MainButton(
               onPressed: (){},
               textBTN: 'Second',
               isActive: true),
            const SizedBox(height: 20),

           MainButton(
               onPressed: (){},
               textBTN: 'Third button',
               isActive: true),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

}
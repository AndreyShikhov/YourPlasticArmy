import 'package:flutter/material.dart';
import 'package:ypa/core/buttons.dart'  show  MainButton;


class BaseWindow extends StatelessWidget {

  final Color bgColor;
  final Widget child; // content widget
  const BaseWindow({super.key,
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


class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Color contentColor = Colors.black26;
  bool _isBTNActiveWH  = true;
  bool _isBTNActiveVS  = true;
  bool _isBTNActiveAnal  = true;

  void enableAllButtons({bool isEnable = true})
  {
    _isBTNActiveWH = isEnable;
    _isBTNActiveVS = isEnable;
    _isBTNActiveAnal = isEnable;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: contentColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainButton(
                textBTN: 'Firtst button',
                isActive: _isBTNActiveWH,
                onPressed: ()
                {
                 print('fuck');
                 setState(()=> enableAllButtons(isEnable: false));
                },
              style: MainButton.mainButtonStyle(context),

            ),

            const SizedBox(height: 20),


            MainButton(
                textBTN: 'Second',
                isActive: _isBTNActiveVS,
                onPressed: ()
                {
                  setState(()=> enableAllButtons(isEnable: false));
                },
            ),

            const SizedBox(height: 20),

            MainButton(
                textBTN: 'Third button',
                isActive: _isBTNActiveAnal,
                onPressed: ()
                {
                  setState(()=> enableAllButtons(isEnable: false));
                },),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


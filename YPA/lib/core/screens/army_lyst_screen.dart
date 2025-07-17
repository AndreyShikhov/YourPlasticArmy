import 'package:flutter/material.dart';

import '../widgets/buttons.dart';


class ArmyLystScreen extends StatefulWidget {

  @override
  _ArmyLystScreen createState() => _ArmyLystScreen();
}

class _ArmyLystScreen extends State<ArmyLystScreen> {
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
              textBTN: 'Army',
              isActive: _isBTNActiveWH,
              onPressed: ()
              {
                print('fuck');
                setState(()=> enableAllButtons(isEnable: false));
              },
              style: MainButton.mainButtonStyle(context),

            ),

            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
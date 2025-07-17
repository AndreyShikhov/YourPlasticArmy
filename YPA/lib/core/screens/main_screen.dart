import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ypa/core/widgets/buttons.dart';


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
              textBTN: 'WH 40K',
              isActive: _isBTNActiveWH,
              onPressed: ()
              {

                setState(()=> enableAllButtons(isEnable: false));
                context.go('/army_lyst');
                print('fuck');
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



import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ypa/core/router/router.dart';
import 'package:ypa/core/widgets/buttons.dart';


enum ButtonType {
  warhammer40k,
  vs,
  analytics
}

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Color contentColor = Colors.black26;



  void enableAllButtons({bool isEnable = true}) {
    setState(() {
      _statesAllButtons = {
        ButtonType.warhammer40k: isEnable,
        ButtonType.vs: isEnable,
        ButtonType.analytics: isEnable,
      };
    });
  }

  final List<String> _buttonTitles = [
    'Warhammer 40K',
    'VS',
    'Analytiks'
  ];



  Map<ButtonType, bool> _statesAllButtons = {
    ButtonType.warhammer40k: true,
    ButtonType.vs: true,
    ButtonType.analytics: true
  };


  List get _buttonHandlers => [
    () =>  context.go('/army_lyst'),
  ];

List<Widget> _buildButtons(){
    return _buttonTitles.asMap().entries.map((elem){
      final int index  = elem.key;
      final title = elem.value;
      final buttonType = ButtonType.values[index];
      return MainButton(
          onPressed: (){
            setState(()=> enableAllButtons(isEnable: false));
            // переход на другой экран
            _buttonHandlers[0]();
          },
          isActive:  _statesAllButtons[buttonType] ?? true ,
          textBTN:  title,
          style: MainButton.mainButtonStyle(context),
      );
    }).toList();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: contentColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildButtons(),
        ),
      ),
    );
  }
}


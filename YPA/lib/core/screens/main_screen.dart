
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ypa/core/widgets/buttons.dart';


enum ButtonType {
  warhammer40k,
  warhammerAoS,
}

class MainScreen extends StatefulWidget {

  @override
  _MainScreenState createState() => _MainScreenState();
}


class _MainScreenState extends State<MainScreen> {
  final Color contentColor = Colors.black26;

  List get _buttonHandlers => [
        () =>  context.go('/game_screen'),
  ];

  Map<ButtonType, bool> _statesAllButtons = {
    ButtonType.warhammer40k: true,
    ButtonType.warhammerAoS: true,
  };

  void enableAllButtons({bool isEnable = true}) {
    setState(() {
      _statesAllButtons = {
        ButtonType.warhammer40k: isEnable,
        ButtonType.warhammerAoS: isEnable,
      };
    });
  }

  final List<String> _buttonTitles = [
    'Warhammer 40K',
    'Warhammer AoS',
  ];

List<Widget> _buildButtons(){
    return _buttonTitles.asMap().entries.map((elem){
      final int index  = elem.key;
      final title = elem.value;
      final buttonType = ButtonType.values[index];

      return MainButton(
          onPressed: () async {
            // deactivate all buttons
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


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ypa/core/widgets/buttons.dart';



enum ButtonType {
  armyBuilder,
  versus,
  analytics,
}

class GameScreen extends StatefulWidget{

  @override
  _GameScreen createState()=>_GameScreen();
}


class _GameScreen extends State<GameScreen>{
  final Color contentColor = Colors.black26;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Проверяем, активен ли сейчас этот экран
    if (ModalRoute.of(context)?.isCurrent == true) {
      // Активируем кнопки при возврате
      setState(() => enableAllButtons(isEnable: true));
    }
  }

  List get _buttonHandlers => [
        () =>  context.go('/game_screen/army_lyst'),
  ];

  Map<ButtonType, bool> _statesAllButtons = {
    ButtonType.armyBuilder: true,
    ButtonType.versus: true,
    ButtonType.analytics: true,
  };

  void enableAllButtons({bool isEnable = true})
  {
    setState(() {
      _statesAllButtons = {
        ButtonType.armyBuilder: isEnable,
        ButtonType.versus: isEnable,
        ButtonType.analytics:isEnable,
      };
    });
  }

  final List<String> _buttonTitles = [
    'armyBuilder',
    'versus',
    'analytics',
  ];

  List<Widget> _buildButtons(){
    return _buttonTitles.asMap().entries.map((elem){
      final int index  = elem.key;
      final title = elem.value;
      final buttonType = ButtonType.values[index];

      return MainButton (
        onPressed: () async {
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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: (){
            Navigator.pop(context,'reset_buttons');
          },
        ),
      ),
        body:Container(
          color: contentColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildButtons(),
              //const SizedBox(height: 20),
            ),
          ),
        )
    );

  }
}
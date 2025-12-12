
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ypa/core/widgets/buttons.dart';
import 'package:ypa/core/data/style_data.dart';
import 'package:flutter/services.dart';

import '../providers/user_provider.dart';


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

  Widget _buildDrawer(BuildContext context, UserProvider user) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 50, 50, 50),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Шапка меню
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 78, 73, 73),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'YPA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  user.getUserName(),
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Пункты меню
          _buildDrawerItem(
            icon: Icons.settings,
            title: 'Настройки',
            onTap: () {
              Navigator.pop(context); // Закрываем меню
              // TODO: Переход на экран настроек
              print('Настройки');
            },
          ),

          _buildDrawerItem(
            icon: Icons.help,
            title: 'Помощь',
            onTap: () {
              Navigator.pop(context);
              print('Помощь');
            },
          ),

          _buildDrawerItem(
            icon: Icons.info,
            title: 'О приложении',
            onTap: () {
              Navigator.pop(context);
              print('О приложении');
            },
          ),

          // Разделитель
          Divider(color: Colors.grey[700]),

          _buildDrawerItem(
            icon: Icons.exit_to_app,
            title: 'Выйти',
            onTap: () {
              print('Выход');
              Navigator.pop(context); // Закрыть диалог
              // Для веба/десктопа — закрыть вкладку
              // Для мобильных — SystemNavigator.pop()
              if (Platform.isAndroid || Platform.isIOS) {
                SystemNavigator.pop();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Получаем доступ к UserProvider
    final userProvider = context.watch<UserProvider>();
    userProvider.setName("Duda");

    return Scaffold(
      appBar: AppBar (
        backgroundColor:  Color(0x7160605E),
        shadowColor: Color(0x3C373771),
        elevation: 0,
        leading: Builder(
          builder: (context)=> IconButton(
              onPressed: ()=> Scaffold.of(context).openDrawer(),
              icon: const Icon (Icons.menu, color: Colors.white,)
          ),
      ),
      ),
        drawer: _buildDrawer(context, userProvider),
        body: Container(
          color: mainScreenColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildButtons(),
            ),
          ),
        ),
    );
  }
}


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../providers/user_notifier.dart';
import '../widgets/buttons.dart';
import 'data/style_data.dart';


enum ButtonTypemMianScreen {
  warhammer40k,
  warhammerAoS,
}

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  Map<ButtonTypemMianScreen, bool> _statesAllButtons = {
    ButtonTypemMianScreen.warhammer40k: true,
    ButtonTypemMianScreen.warhammerAoS: true,
  };

  final List<String> _buttonTitles = [
    'Warhammer 40K',
    'Warhammer AoS',
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (ModalRoute.of(context)?.isCurrent == true) {
      setState(() => _enableAllButtons(true));
    }
  }

  void _enableAllButtons(bool isEnable) {
    _statesAllButtons = {
      ButtonTypemMianScreen.warhammer40k: isEnable,
      ButtonTypemMianScreen.warhammerAoS: isEnable,
    };
  }

  void _goToGame() {
    context.go('/game_screen');
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userStateProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x7160605E),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu),
          ),
        ),
      ),
      drawer: _buildDrawer(context, userState),
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

  List<Widget> _buildButtons() {
    return _buttonTitles.asMap().entries.map((entry) {
      final index = entry.key;
      final title = entry.value;
      final type = ButtonTypemMianScreen.values[index];

      return MainButton(
        textBTN: title,
        isActive: _statesAllButtons[type] ?? true,
        style: MainButton.mainButtonStyle(context),
        onPressed: () {
          setState(() => _enableAllButtons(false));
          _goToGame();
        },
      );
    }).toList();
  }

  Widget _buildDrawer(BuildContext context, UserState user) {
    return Drawer(
      backgroundColor: const Color(0xFF323232),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color(0xFF4E4949),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'YPA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        user.userName ?? 'Guest',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                _drawerItem(Icons.settings, 'Настройки', context),
                _drawerItem(Icons.help, 'Помощь', context),
                _drawerItem(Icons.info, 'О приложении', context),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Выйти'),
                  onTap: () {
                    Navigator.pop(context);
                    if (Platform.isAndroid || Platform.isIOS) {
                      SystemNavigator.pop();
                    }
                  },
                ),
              ],
            ),
          ),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Version ${snapshot.data!.version}',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => Navigator.pop(context),
    );
  }
}

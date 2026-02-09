/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../database/database_actions_provider.dart';
import '../../providers/user_notifier.dart';
import 'data/style_data.dart';

class MainScreen extends ConsumerStatefulWidget
{
    const MainScreen({super.key});

    @override
    ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen>
{
    bool _isNavigationInProgress = false;

    @override
    void didChangeDependencies() 
    {
        super.didChangeDependencies();

        if (ModalRoute.of(context)?.isCurrent == true) 
        {
            setState(() => _isNavigationInProgress = false);
        }
    }

    void _handleButtonClick() 
    {
        if (_isNavigationInProgress) return;
        setState(() => _isNavigationInProgress = true);
        context.go('/game_screen');
    }

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: const Color(0x7160605E),
                elevation: 0,
                leading: Builder(
                    builder: (context) =>
                    IconButton(onPressed: () => Scaffold.of(context).openDrawer(), icon: const Icon(Icons.menu))
                )
            ),
            /// Используем Consumer только для Drawer, чтобы не перерисовывать весь экран при изменении UserState
            drawer: Consumer(
                builder: (context, ref, _) => _buildDrawer(context, ref.watch(userStateProvider)),
            ),
            body: Container(
                color: mainScreenColor,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, 
                        children: [
                            _MainButton(
                                text: 'Build Army',
                                isActive: !_isNavigationInProgress,
                                onPressed: _handleButtonClick,
                            ),
                            const SizedBox(height: 24),
                            _MainButton(
                                text: 'View Army',
                                isActive: !_isNavigationInProgress,
                                onPressed: _handleButtonClick,
                            ),
                        ]
                    )
                )
            )
        );
    }

    Widget _buildDrawer(BuildContext context, UserState user) 
    {
        return Drawer(
            backgroundColor: const Color(0xFF323232),
            child: Column(
                children: [
                    Expanded(
                        child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                                DrawerHeader(
                                    decoration: const BoxDecoration(color: Color(0xFF4E4949)),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            const Text(
                                                'YPA',
                                                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)
                                            ),
                                            const SizedBox(height: 8),
                                            Text(user.userName ?? 'Guest', style: const TextStyle(color: Colors.grey, fontSize: 14))
                                        ]
                                    )
                                ),
                                _drawerItem(Icons.settings, 'Настройки', context),
                                ListTile(
                                    leading: const Icon(Icons.refresh, color: Colors.orangeAccent),
                                    title: const Text('Пересобрать БД', style: TextStyle(color: Colors.orangeAccent)),
                                    onTap: () => _showResetDbDialog(context),
                                ),
                                _drawerItem(Icons.help, 'Помощь', context),
                                _drawerItem(Icons.info, 'О приложении', context),
                                const Divider(),
                                ListTile(
                                    leading: const Icon(Icons.exit_to_app),
                                    title: const Text('Выйти'),
                                    onTap: ()
                                    {
                                        Navigator.pop(context);
                                        if (Platform.isAndroid || Platform.isIOS) 
                                        {
                                            SystemNavigator.pop();
                                        }
                                    }
                                )
                            ]
                        )
                    ),
                    FutureBuilder<PackageInfo>(
                        future: PackageInfo.fromPlatform(),
                        builder: (context, snapshot)
                        {
                            if (!snapshot.hasData) return const SizedBox.shrink();
                            return Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                    'Version ${snapshot.data!.version}',
                                    style: const TextStyle(color: Colors.grey, fontSize: 12)
                                )
                            );
                        }
                    )
                ]
            )
        );
    }

    Widget _drawerItem(IconData icon, String title, BuildContext context) 
    {
        return ListTile(leading: Icon(icon), title: Text(title), onTap: () => Navigator.pop(context));
    }

    void _showResetDbDialog(BuildContext context) 
    {
        showDialog(
            context: context,
            builder: (dialogContext) => AlertDialog(
                backgroundColor: const Color(0xFF323232),
                title: const Text('Сброс базы данных', style: TextStyle(color: Colors.white)),
                content: const Text(
                    'Это удалит все ваши армии и заново создаст стандартных юнитов. Вы уверены?',
                    style: TextStyle(color: Colors.white70),
                ),
                actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(dialogContext),
                        child: const Text('Отмена'),
                    ),
                    TextButton(
                        onPressed: () async 
                        {
                            final messenger = ScaffoldMessenger.of(context);
                            Navigator.pop(dialogContext);

                            messenger.showSnackBar(
                                const SnackBar(content: Text('Пересборка базы данных...'), duration: Duration(seconds: 2)),
                            );

                            await ref.read(databaseActionsProvider).resetDatabase();

                            if (!mounted) return;

                            messenger.showSnackBar(
                                const SnackBar(content: Text('База данных успешно обновлена!')),
                            );
                        },
                        child: const Text('Да, сбросить', style: TextStyle(color: Colors.redAccent)),
                    ),
                ],
            ),
        );
    }
}

/// ЛОКАЛЬНЫЙ ОПТИМИЗИРОВАННЫЙ ВИДЖЕТ КНОПКИ
class _MainButton extends StatelessWidget {
    final String text;
    final bool isActive;
    final VoidCallback onPressed;

    const _MainButton({
        required this.text,
        required this.isActive,
        required this.onPressed,
    });

    /// Стиль теперь константа, создается 1 раз
    static final ButtonStyle _style = FilledButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 78, 73, 73),
        foregroundColor: texColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        fixedSize: const Size(160, 80),
        side: const BorderSide(color: Colors.black, width: 2, strokeAlign: BorderSide.strokeAlignOutside),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
    );

    @override
    Widget build(BuildContext context) {
        return FilledButton(
            onPressed: isActive ? onPressed : null,
            style: _style,
            child: _ButtonText(text: text),
        );
    }
}

/// Изолированный виджет текста для предотвращения лишних перерисовок
class _ButtonText extends StatelessWidget {
    final String text;
    const _ButtonText({required this.text});

    @override
    Widget build(BuildContext context) {
        return Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
        );
    }
}

/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/buttons.dart';

class GameScreen extends StatefulWidget
{
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreen();
}

class _GameScreen extends State<GameScreen>
{
    final Color contentColor = Colors.black26;
    bool _isNavigationInProgress = false;

    @override
    void didChangeDependencies() 
    {
        super.didChangeDependencies();

        /// Сбрасываем флаг навигации при возврате на экран
        if (ModalRoute.of(context)?.isCurrent == true) 
        {
            setState(() => _isNavigationInProgress = false);
        }
    }

    void _handleNavigation() 
    {
        if (_isNavigationInProgress) return;
        
        setState(() => _isNavigationInProgress = true);
        context.go('/game_screen/army_lyst');
    }

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => context.pop()
                )
            ),
            body: Container(
                color: contentColor,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            MainButton(
                                textBTN: 'Army Builder',
                                isActive: !_isNavigationInProgress,
                                onPressed: _handleNavigation,
                            ),
                            const SizedBox(height: 24),
                            MainButton(
                                textBTN: 'Versus Mode',
                                isActive: !_isNavigationInProgress,
                                onPressed: _handleNavigation,
                            ),
                            const SizedBox(height: 24),
                            MainButton(
                                textBTN: 'Analytics',
                                isActive: !_isNavigationInProgress,
                                onPressed: _handleNavigation,
                            ),
                        ]
                    )
                )
            )
        );
    }
}

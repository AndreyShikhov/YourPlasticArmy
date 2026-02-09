/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'data/style_data.dart';

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
                            _MainButton(
                                text: 'Army Builder',
                                isActive: !_isNavigationInProgress,
                                onPressed: _handleNavigation,
                            ),
                            const SizedBox(height: 24),
                            _MainButton(
                                text: 'Versus Mode',
                                isActive: !_isNavigationInProgress,
                                onPressed: _handleNavigation,
                            ),
                            const SizedBox(height: 24),
                            _MainButton(
                                text: 'Analytics',
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

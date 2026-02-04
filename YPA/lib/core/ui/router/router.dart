/*
 * Copyright (c) 2026 Andrey Shikhov
 * SPDX-License-Identifier: MIT
 */

import 'package:go_router/go_router.dart';
import 'package:ypa/core/ui/screens/screen.dart';

import '../screens/data/style_data.dart';
import '../screens/unit_editor/unit_editor_screen.dart';
import '../widgets/base_window.dart';

final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
        GoRoute(
            path: '/',
            builder: (context, state) => const BaseWindow(bgColor: mainScreenColor, child:  MainScreen()),
            routes: [
                GoRoute(
                    path: 'game_screen',
                    builder: (context, state) => const BaseWindow(bgColor: mainScreenColor, child: GameScreen()),
                    routes: [
                        GoRoute(
                            path: 'army_lyst',
                            builder: (context, state) => const  BaseWindow(bgColor: mainScreenColor, child:  ArmyListScreen()),
                            routes: [
                                /// Билдер армии (принимает ID)
                                GoRoute(
                                    path: 'army_builder/:armyId',
                                    builder: (context, state)
                                    {
                                        final armyId = state.pathParameters['armyId']!;
                                        return BaseWindow(
                                            bgColor: mainScreenColor,
                                            child: ArmyBuilderScreen(armyId: armyId)
                                        );
                                    },
                                    routes: [
                                        GoRoute(
                                            path: 'unit_editor/:roleCode/:instanceId',
                                            builder: (context, state)
                                            {
                                                final armyId = state.pathParameters['armyId']!;
                                                final roleCode = state.pathParameters['roleCode']!;
                                                final unitInstanceId = state.pathParameters['instanceId']!;

                                                return BaseWindow(
                                                    bgColor: mainScreenColor,
                                                    child: UnitEditorScreen(
                                                        armyId: armyId,
                                                        instanceId: unitInstanceId, 
                                                        roleCode: roleCode
                                                    )
                                                );
                                            }
                                        )
                                    ]
                                ),
                                /// Просмотр армии (принимает ID)
                                GoRoute(
                                    path: 'view_army/:armyId',
                                    builder: (context, state)
                                    {
                                        final armyId = state.pathParameters['armyId']!;
                                        return BaseWindow(
                                            bgColor: mainScreenColor,
                                            child: ViewArmyScreen(armyId: armyId)
                                        );
                                    }
                                )
                            ]
                        )
                    ]
                )
            ]
        )
    ]
);

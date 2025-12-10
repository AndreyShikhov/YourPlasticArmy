import 'package:go_router/go_router.dart';

import 'package:ypa/core/screens/game_screen.dart';

import 'package:ypa/core/screens/main_screen.dart';
import 'package:ypa/core/screens/army_lyst_screen.dart';
import 'package:ypa/core/widgets/base_window.dart';

import '../data/style_data.dart';


final GoRouter router = GoRouter(
    initialLocation: '/',   // start page
    routes:
    [
      GoRoute(
          path: '/',
          builder: (context, state) => BaseWindow(
              bgColor: mainScreenColor,
              child: MainScreen()
          ),
        routes: [
          GoRoute(
            path: 'game_screen',
            builder: (context, state)=>BaseWindow(
                bgColor: mainScreenColor,
                child: GameScreen()
            ),
               routes: [
                 GoRoute(
                     path: 'army_lyst',
                     builder: (context, state) =>BaseWindow(
                         bgColor: mainScreenColor,
                         child: ArmyLystScreen()
                     ),
                 ),
               ],
          ),
        ],
      ),
    ],
);
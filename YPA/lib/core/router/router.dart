import 'package:go_router/go_router.dart';
import 'package:ypa/core/data/style_data%20.dart';

import 'package:ypa/core/screens/main_screen.dart';
import 'package:ypa/core/screens/army_lyst_screen.dart';
import 'package:ypa/core/widgets/base_window.dart';


final GoRouter router = GoRouter(
    initialLocation: '/',   // start page
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => BaseWindow(
              bgColor: mainScreenColor,
              child: MainScreen()
          ),
        routes: [
          GoRoute(
              path: 'army_lyst',
              builder: (context, state) =>BaseWindow(
                bgColor: mainScreenColor,
                  child: ArmyLystScreen()
              )
          ),
          /*GoRoute(
              path: 'new_page',
              builder: (context, state) =>BaseWindow(
                  bgColor: mainScreenColor,
                  child: ArmyLystScreen()
              ),*/
        ]
      ),


    ]
);
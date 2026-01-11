import 'package:go_router/go_router.dart';
import '../screens/data/style_data.dart';
import 'package:ypa/core/ui/screens/screen.dart';
import '../widgets/base_window.dart';



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
                         child: ArmyListScreen()
                     ),
                 ),
               ],
          ),
        ],
      ),
    ],
);
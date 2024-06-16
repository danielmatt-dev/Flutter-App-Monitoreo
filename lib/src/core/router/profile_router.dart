import 'package:app_plataforma/src/core/menu/screens.dart';
import 'package:app_plataforma/src/core/router/screens.dart';
import 'package:go_router/go_router.dart';

final profileRouter = GoRouter(
    initialLocation: '/profile',
    routes: [
      GoRoute(
          path: '/profile',
          name: 'profile',
        builder: (context, state) => const ProfileScreen()
      ),
      GoRoute(
          path: '/data',
          name: DataScreen.nombre,
          builder: (context, state) => const DataScreen()
      ),
      GoRoute(
          path: '/recommendations',
          name: RecommendationsScreen.nombre,
          builder: (context, state) => const RecommendationsScreen()
      ),
      GoRoute(
          path: '/password',
          name: PasswordScreen.nombre,
          builder: (context, state) => const PasswordScreen()
      ),
      GoRoute(
          path: '/about',
          name: AboutScreen.nombre,
          builder: (context, state) => const AboutScreen()
      ),
    ]
);
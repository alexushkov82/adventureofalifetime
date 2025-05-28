import 'package:adventureofalifetime/item_page.dart';
import 'package:go_router/go_router.dart';

import 'home_page.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomePage(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          path: '/cart',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: CartScreen(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/item',
      builder: (context, state) => ItemPage(),
    ),
  ],
);
import 'package:go_router/go_router.dart';

import '../../features/products/presentation/pages/home_page.dart';
import '../../features/products/presentation/pages/product_page.dart';
import '../../features/cart/presentation/widgets/cart_widget.dart';
import '../../features/products/presentation/widgets/home_widget.dart';
import 'routes.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomePage(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.home,
          pageBuilder: (context, state) => const NoTransitionPage(child: HomeWidget()),
        ),
        GoRoute(
          path: AppRoutes.cart,
          pageBuilder: (context, state) => const NoTransitionPage(child: CartWidget()),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.item,
      builder: (context, state) {
        final productId = state.pathParameters['productId']!;
        return ProductPage(productId: productId);
      },
    ),
  ],
);

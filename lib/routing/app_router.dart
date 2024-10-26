import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_go_router/models/product.dart';
import 'package:learn_go_router/screens/cart.dart';
import 'package:learn_go_router/screens/home.dart';
import 'package:learn_go_router/screens/product_details.dart';

enum AppRoute {
  details,
  cart,
}

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'details',
          name: AppRoute.details.name,
          builder: (context, state) {
            final product = state.extra as Product;
            return ProductDetailsScreen(product: product);
          },
        ),
        GoRoute(
          path: 'cart',
          name: AppRoute.cart.name,
          pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true,
            child: CartScreen(),
          ),
        ),
      ],
    ),
  ],
);

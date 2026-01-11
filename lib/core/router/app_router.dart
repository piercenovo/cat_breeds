import 'package:cat_breeds/lib.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

mixin RouterMixin on State<CatBreeds> {
  late final GoRouter _route;

  @override
  void initState() {
    super.initState();
    _route = GoRouter(
      initialLocation: Routes.splash.path,
      routes: [
        GoRoute(
          path: Routes.splash.path,
          name: Routes.splash.name,
          builder: (_, _) => const SplashScreen(),
        ),
        GoRoute(
          path: Routes.catBreeds.path,
          name: Routes.catBreeds.name,
          builder: (_, _) => const CatBreedsScreen(),
        ),
      ],
    );
  }

  GoRouter get appRouter => _route;
}

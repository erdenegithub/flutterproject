import 'package:flutter/material.dart';
import 'package:flutterproject/routes/home_route.dart';
import '../onboard_route.dart';
import 'main_route.dart';

class GenerateRoute {
  final List<MainRoute> routers = [
    OnboardRoute(),
    HomeRoute(),
  ];

  Route<dynamic> generateRoute(RouteSettings settings) {
    for (final router in routers) {
      final value = router.generateRoute(settings);
      if (value != null) {
        return value;
      }
    }
    return null;
  }
}

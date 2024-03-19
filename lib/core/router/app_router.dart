// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'routes.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings,
      {dynamic arguments}) {
    switch (settings.name) {
      case AppRoutes.root:
        return SignInRoute();
      case AppRoutes.home:
        return HomeRoute();
      default:
        throw Exception('Route not found!');
    }
  }
}

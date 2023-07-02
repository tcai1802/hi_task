import 'package:flutter/material.dart';
import 'package:hi_task/src/res/routes/routes.dart';
import 'package:hi_task/src/view/export.dart';

class AppRoutes extends Routes {
  @override
  String get getStartedRoute => "/get_started";

  @override
  String get loginRoute => "/login";

  @override
  String get registerRoute => "/register";

  @override
  String get verifyAccountRoute => "/verify_account";

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == getStartedRoute) {
      return MaterialPageRoute(
        builder: (context) => const GetStartedScreen(),
      );
    } else if (settings.name == loginRoute) {
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    }
    return null;
  }
}

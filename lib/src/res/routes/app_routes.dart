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

  @override
  String get successVerifyRoute => '/success_verify';

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == getStartedRoute) {
      return MaterialPageRoute(
        builder: (context) => const GetStartedScreen(),
      );
    } else if (settings.name == loginRoute) {
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    } else if (settings.name == registerRoute) {
      return MaterialPageRoute(
        builder: (context) => const RegisterScreen(),
      );
    } else if (settings.name == verifyAccountRoute) {
      return MaterialPageRoute(
        builder: (context) => const VerifyCodeScreen(),
      );
    } else if (settings.name == successVerifyRoute) {
      return MaterialPageRoute(
        builder: (context) => const SuccessVerifyScreen(),
      );
    }

    return null;
  }
}

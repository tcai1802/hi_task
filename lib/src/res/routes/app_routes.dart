import 'package:flutter/material.dart';
import 'package:hi_task/src/res/arguments/add_task_argument.dart';
import 'package:hi_task/src/res/arguments/edit_task_argument.dart';
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

  @override
  String get dashBoardRoute => '/dashboard';

  @override
  String get dailyTaskDetailsRoute => '/daily_task_details';

  @override
  String get priorityTaskDetailsRoute => '/priority_task_details';

  @override
  String get notifyRoute => '/notify';

  @override
  String get addTaskRoute => '/add_task';

  @override
  String get editTaskRoute => '/edit_task';

  @override
  String get myProfileRoute => '/my_profile';

  @override
  String get statisticRoute => '/statistic';

  @override
  String get locationRoute => '/location';

  @override
  String get settingsRoute => '/settings';

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
    } else if (settings.name == dashBoardRoute) {
      return MaterialPageRoute(
        builder: (context) => const DashBoardScreen(),
      );
    } else if (settings.name == dailyTaskDetailsRoute) {
      return MaterialPageRoute(
        builder: (context) => const DailyTaskDetailsScreen(),
      );
    } else if (settings.name == priorityTaskDetailsRoute) {
      return MaterialPageRoute(
        builder: (context) => const PriorityTaskDetailsScreen(),
      );
    } else if (settings.name == notifyRoute) {
      return MaterialPageRoute(
        builder: (context) => const NotifyScreen(),
      );
    } else if (settings.name == addTaskRoute) {
      final args = settings.arguments as AddTaskArgument;
      return MaterialPageRoute(
        builder: (context) => AddTaskScreen(
          taskTypeEnum: args.taskTypeEnum,
        ),
      );
    } else if (settings.name == editTaskRoute) {
      final args = settings.arguments as EditTaskArgument;

      return MaterialPageRoute(
        builder: (context) => EditTaskScreen(
          taskTypeEnum: args.taskTypeEnum,
        ),
      );
    } else if (settings.name == myProfileRoute) {
      return MaterialPageRoute(
        builder: (context) => const MyProfileScreen(),
      );
    } else if (settings.name == statisticRoute) {
      return MaterialPageRoute(
        builder: (context) => const StatisticScreen(),
      );
    } else if (settings.name == locationRoute) {
      return MaterialPageRoute(
        builder: (context) => const LocationScreen(),
      );
    } else if (settings.name == settingsRoute) {
      return MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      );
    }
    return null;
  }
}

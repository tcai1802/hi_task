import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_task/src/blocs/blocs_exports.dart';
import 'package:hi_task/src/res/arguments/add_task_argument.dart';
import 'package:hi_task/src/res/arguments/edit_profile_argument.dart';
import 'package:hi_task/src/res/arguments/edit_task_argument.dart';
import 'package:hi_task/src/res/routes/routes.dart';
import 'package:hi_task/src/view/export.dart';

class AppRoutes extends Routes {
  @override
  String get splashRoute => "/splash";

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

  @override
  String get settingsNotificationRoute => '/settings_notification';

  @override
  String get settingsSecurityRoute => '/settings_security';

  @override
  String get settingsHelpRoute => '/settings_help';

  @override
  String get settingsUpdateSystemRoute => '/settings_update_system';

  @override
  String get settingsAbout => '/settings_about';

  final _registerBloc = RegisterBloc();
  final _loginBloc = LoginBloc();
  final _dashboardBloc = DashboardBloc();
  final _addTaskBloc = AddTaskBloc();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == splashRoute) {
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    } else if (settings.name == getStartedRoute) {
      return MaterialPageRoute(
        builder: (context) => const GetStartedScreen(),
      );
    } else if (settings.name == loginRoute) {
      return MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: _loginBloc,
          child: const LoginScreen(),
        ),
      );
    } else if (settings.name == registerRoute) {
      return MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: _registerBloc,
          child: const RegisterScreen(),
        ),
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
        //builder: (context) => BlocProvider.value(
        //  value: _dashboardBloc,
        //  child: const DashBoardScreen(),
        //),
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
        builder: (context) => BlocProvider.value(
          value: _addTaskBloc,
          child: AddTaskScreen(
            taskTypeEnum: args.taskTypeEnum,
          ),
        ),
      );
    } else if (settings.name == editTaskRoute) {
      final args = settings.arguments as EditTaskArgument;
      return MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: _addTaskBloc,
          child: EditTaskScreen(
            taskModel: args.taskModel,
          ),
        ),
      );
    } else if (settings.name == myProfileRoute) {
      final args = settings.arguments as EditProfileArgument;

      return MaterialPageRoute(
        builder: (context) => EditProfileScreen(userModel: args.userModel),
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
    } else if (settings.name == settingsNotificationRoute) {
      return MaterialPageRoute(
        builder: (context) => const SettingsNotificationScreen(),
      );
    } else if (settings.name == settingsSecurityRoute) {
      return MaterialPageRoute(
        builder: (context) => const SettingsSecurityScreen(),
      );
    } else if (settings.name == settingsHelpRoute) {
      return MaterialPageRoute(
        builder: (context) => const SettingsHelpScreen(),
      );
    } else if (settings.name == settingsUpdateSystemRoute) {
      return MaterialPageRoute(
        builder: (context) => const SettingsUpdateSystemScreen(),
      );
    } else if (settings.name == settingsAbout) {
      return MaterialPageRoute(
        builder: (context) => const SettingsAboutScreen(),
      );
    }
    return null;
  }

  void dispose() {
    _registerBloc.close();
    _loginBloc.close();
    _dashboardBloc.close();
  }
}

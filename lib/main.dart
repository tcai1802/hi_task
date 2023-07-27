import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/blocs/blocs_exports.dart';
import 'package:hi_task/src/cubit/carousel_slider_cubit.dart';
import 'package:hi_task/src/cubit/checkbox/checkbox_cubit.dart';
import 'package:hi_task/src/cubit/navigation/navigation_cubit.dart';
import 'package:hi_task/src/main_observer.dart';
import 'package:hi_task/src/res/theme/app_theme.dart';
import 'package:hi_task/src/res/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MainObserver();

  // Init firebase app
  //await Firebase.initializeApp(
  //  options: DefaultFirebaseOptions.currentPlatform,
  //);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => CarouselSliderCubit()),
            BlocProvider(create: (context) => NavigationCubit()),
            BlocProvider(create: (context) => CheckBoxCubit()),
            BlocProvider(create: (context) => SplashBloc()),
            BlocProvider(lazy: false, create: (context) => LoginBloc()),
            BlocProvider(create: (context) => RegisterBloc()),
            BlocProvider(create: (context) => ProfileBloc()),
            BlocProvider(create: (context) => VerifyCodeBloc()),
          ],
          child: MaterialApp(
            initialRoute: AppRoutes().splashRoute,
            onGenerateRoute: AppRoutes().onGenerateRoute,
            title: 'Hi task application',
            debugShowCheckedModeBanner: false,
            theme: AppTheme().lightTheme,
            builder: EasyLoading.init(),
          ),
        );
      },
    );
  }
}

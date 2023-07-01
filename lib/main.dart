import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/cubit/carousel_slider_cubit.dart';
import 'package:hi_task/src/main_observer.dart';
import 'package:hi_task/src/res/theme/app_theme.dart';
import 'package:hi_task/src/view/export.dart';

void main() {
  Bloc.observer = MainObserver();
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
        //return MaterialApp(
        //  title: 'Flutter Demo',
        //  debugShowCheckedModeBanner: false,
        //  theme: AppTheme().lightTheme,
        //  home: const GetStartedScreen(),
        //);
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => CarouselSliderCubit(),
            ),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme().lightTheme,
            home: const GetStartedScreen(),
          ),
        );
      },
    );
  }
}

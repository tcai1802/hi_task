import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/blocs/splash/splash_bloc.dart';
import 'package:hi_task/src/res/drawable/app_drawable.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/res/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashBloc>(context).add(SplashInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.splashState == StateEnum.success) {
          if (!state.isLogged) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes().dashBoardRoute, (route) => false);
          } else if (!state.firstOpenAppState) {
            Navigator.pushNamed(context, AppRoutes().getStartedRoute);
          } else {
            Navigator.pushNamed(context, AppRoutes().loginRoute);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                AnimatedContainer(
                  height: 40.h,
                  duration: Duration(seconds: 4),
                  curve: Curves.easeIn,
                  child: SvgPicture.asset(AppDrawable().imgLogo),
                ),
                Opacity(
                  opacity: state.splashState == StateEnum.loading ? 1 : 0,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 40.h),
                    child: CircularProgressIndicator(
                      value: null,
                      strokeWidth: 4.0,
                      color: context.resources.color.brandColor_02,
                    ),
                  ),
                ),
                //SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

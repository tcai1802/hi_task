import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/cubit/navigation/navigation_cubit.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/view/export.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            if (state.navBarEnum == NavbarEnum.home) {
              return const HomeScreen();
            } else if (state.navBarEnum == NavbarEnum.calendarPriority) {
              return const CalendarPriorityScreen();
            } else if (state.navBarEnum == NavbarEnum.profile) {
              return const ProfileScreen();
            }
            return Container();
          },
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          decoration:
              BoxDecoration(color: context.resources.color.bgColor, boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                offset: const Offset(0, 2),
                spreadRadius: 5,
                blurRadius: 7)
          ]),
          child: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
              return Row(
                children: [
                  _navBarItem(
                    state.index == 0
                        ? context.resources.color.brandColor_02
                        : const Color(0xFFABCEF5),
                    context.resources.drawable.iconHome,
                    () {
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarEnum.home);
                    },
                  ),
                  _navBarItem(
                    state.index == 1
                        ? context.resources.color.brandColor_02
                        : const Color(0xFFABCEF5),
                    context.resources.drawable.iconCalendar,
                    () {
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarEnum.calendarPriority);
                    },
                  ),
                  _navBarItem(
                    state.index == 2
                        ? context.resources.color.brandColor_02
                        : const Color(0xFFABCEF5),
                    context.resources.drawable.iconProfile,
                    () {
                      BlocProvider.of<NavigationCubit>(context)
                          .getNavBarItem(NavbarEnum.profile);
                    },
                  )
                ],
              );
            },
          ),
        ));
  }

  Expanded _navBarItem(
    Color colorIcon,
    String iconUrl,
    Function onTap,
  ) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(),
        child: ImageBaseWidget(
          imageType: ImageTypeEnum.svgPicture,
          imageUrl: iconUrl,
          imageWidth: 24.w,
          imageHeight: 24.w,
          imgColor: colorIcon,
          boxFit: BoxFit.contain,
        ),
      ),
    );
  }
}

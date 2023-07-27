import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/blocs/get_started_bloc.dart';
import 'package:hi_task/src/cubit/carousel_slider_cubit.dart';
import 'package:hi_task/src/res/colors/app_colors.dart';
import 'package:hi_task/src/res/routes/app_routes.dart';
import 'package:hi_task/src/view/get_started/widgets/get_started_card.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GetStartedBloc getStartedBloc = GetStartedBloc();
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  BlocBuilder<CarouselSliderCubit, int>(
                      builder: (context, index) {
                    return Row(
                      children: [
                        CircleAvatar(
                          radius: index == 0 ? 6.w : 4.w,
                          backgroundColor: index == 0
                              ? AppColors().brandColor_02
                              : AppColors().textColor_03,
                        ),
                        SizedBox(width: 6.w),
                        CircleAvatar(
                          radius: index == 1 ? 6.w : 4.w,
                          backgroundColor: index == 1
                              ? AppColors().brandColor_02
                              : AppColors().textColor_03,
                        ),
                        SizedBox(width: 6.w),
                        CircleAvatar(
                          radius: index == 2 ? 6.w : 4.w,
                          backgroundColor: index == 2
                              ? AppColors().brandColor_02
                              : AppColors().textColor_03,
                        ),
                      ],
                    );
                  }),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes().loginRoute,
                        (route) => false,
                      );
                    },
                    child: Text(
                      "skip",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColors().brandColor_02,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  )
                ],
              ),
              BlocBuilder<CarouselSliderCubit, int>(builder: (context, index) {
                return Flexible(
                  child: PageView.builder(
                    itemCount: getStartedBloc.onboardingList.length,
                    onPageChanged: (value) {
                      context
                          .read<CarouselSliderCubit>()
                          .handleMoveSlide(value);
                    },
                    itemBuilder: (context, index) {
                      return GetStartedCard(
                        data: getStartedBloc.onboardingList[index],
                      );
                    },
                  ),
                );
              }),
              SizedBox(
                width: double.infinity,
                child: CustomButtonBase(
                  titleBtn: "Get Started",
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes().loginRoute,
                      (route) => false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

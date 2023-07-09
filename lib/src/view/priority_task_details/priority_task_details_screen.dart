import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/custom_button_base.dart';
import 'package:hi_task/src/view/priority_task_details/components/task_checkbox.dart';

class PriorityTaskDetailsScreen extends StatelessWidget {
  const PriorityTaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25.h),
                Row(
                  children: [
                    Text(
                      "UI Design",
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: context.resources.color.brandColor_02,
                              ),
                    ),
                    const Spacer(),
                    CustomButtonBase(
                      prefixWidget: Icon(
                        Icons.close,
                        size: 18.sp,
                        color: context.resources.color.brandColor_11,
                      ),
                      paddingBtn: EdgeInsets.all(12.h),
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                SizedBox(height: 17.h),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: context.resources.color.textColor),
                        children: [
                          TextSpan(
                            text: "start \n",
                            style: TextStyle(
                              fontSize: context.resources.dimension.textSM,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "21 Feb 2022",
                            style: TextStyle(
                              fontSize: context.resources.dimension.textXL,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: context.resources.color.textColor),
                        children: [
                          TextSpan(
                            text: "end \n",
                            style: TextStyle(
                              fontSize: context.resources.dimension.textSM,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: "3 March 2022",
                            style: TextStyle(
                              fontSize: context.resources.dimension.textXL,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _timeWidget(
                      context,
                      time: "0",
                      timeType: "months",
                    ),
                    SizedBox(width: 10.w),
                    _timeWidget(
                      context,
                      time: "20",
                      timeType: "days",
                    ),
                    SizedBox(width: 10.w),
                    _timeWidget(
                      context,
                      time: "18",
                      timeType: "hours",
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: context.resources.color.textColor,
                      ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "user interface (UI) is anything a user may interact with to use a digital product or service. This includes everything from screens and touchscreens, keyboards, sounds, and even lights. To understand the evolution of UI, however, it’s helpful to learn a bit more about its history and how it has evolved into best practices and a profession.",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: context.resources.color.textColor,
                      ),
                ),
                SizedBox(height: 24.h),
                Text(
                  "Progress",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: context.resources.color.textColor,
                      ),
                ),
                SizedBox(height: 2.h),
                Stack(
                  children: [
                    Container(
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFA9A2A2),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FractionallySizedBox(
                        widthFactor: 0.65,
                        child: Container(
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: context.resources.color.brandColor_02,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      top: 0,
                      child: Center(
                        child: Text(
                          "80%",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: context.resources.color.brandColor_11,
                              ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  "To do List",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: context.resources.color.textColor,
                      ),
                ),
                SizedBox(height: 4.h),
                Column(
                  children: [
                    ...List.generate(
                      10,
                      (index) => PriorityTaskCheckBox(),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _timeWidget(
    BuildContext context, {
    String time = "",
    String timeType = "",
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      constraints: BoxConstraints(
        minWidth: 90.w,
      ),
      decoration: BoxDecoration(
        color: context.resources.color.brandColor_02,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: SizedBox(
        child: Column(
          children: [
            Text(
              time,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.resources.color.brandColor_11,
                  ),
            ),
            Text(
              timeType,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.resources.color.brandColor_11,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

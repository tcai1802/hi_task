import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/custom_button_base.dart';
import 'package:hi_task/src/base_widgets/image_base.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/view/home/components/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 27.h, horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "Saturday, Feb 20 2022",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: context.resources.color.subHeaderColor,
                      ),
                ),
                const Spacer(),
                ImageBaseWidget(
                  imageType: ImageTypeEnum.svgPicture,
                  imageUrl: context.resources.drawable.iconNotification,
                  imageWidth: 24.w,
                )
              ],
            ),
            SizedBox(height: 30.h),
            Text(
              "Welcome Phillip",
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              "Have a nice day !",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: context.resources.color.subHeaderColor),
            ),
            SizedBox(height: 32.h),
            Text(
              "My Priority Task",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 188.h,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    width: 129.w,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            //color: context.resources.color.brandColor_02,
                            color: Color(0xFF362075),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: ImageBaseWidget(
                            imageType: ImageTypeEnum.svgPicture,
                            imageUrl:
                                context.resources.drawable.imgPriorityTaskCard,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 10.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Spacer(),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                      vertical: 2.h,
                                    ),
                                    decoration: BoxDecoration(
                                        color: context.resources.color.bgColor,
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Text(
                                      "10 days",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Row(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.directions_run_outlined,
                                    color:
                                        context.resources.color.brandColor_11,
                                  ),
                                  SizedBox(width: 5.w),
                                  Expanded(
                                    child: Text(
                                      "Laravel Task ",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: context.resources.color
                                                  .brandColor_11),
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text(
                                    "Progress",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: context
                                                .resources.color.brandColor_11),
                                  ),
                                  const Spacer()
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Stack(
                                children: [
                                  Container(
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF004797),
                                      borderRadius: BorderRadius.circular(2.r),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: FractionallySizedBox(
                                      widthFactor: 0.65,
                                      child: Container(
                                        height: 4,
                                        decoration: BoxDecoration(
                                          color: context
                                              .resources.color.brandColor_11,
                                          borderRadius:
                                              BorderRadius.circular(2.r),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  const Spacer(),
                                  Text(
                                    "80%",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: context
                                              .resources.color.brandColor_11,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
            ),
            ),
            SizedBox(height: 32.h),
            Text(
              "Daily Task",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const TaskCheckBox();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

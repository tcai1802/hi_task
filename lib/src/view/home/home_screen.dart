import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/image_base.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/res/routes/app_routes.dart';
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
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes().notifyRoute),
                  child: ImageBaseWidget(
                    imageType: ImageTypeEnum.svgPicture,
                    imageUrl: context.resources.drawable.iconNotification,
                    imageWidth: 24.w,
                  ),
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
            Row(
              children: [
                Text(
                  "My Priority Task",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Text(
                  "Sell all",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.resources.color.brandColor_02,
                      ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 188.h,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return HomePriorityTaskCard(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes().priorityTaskDetailsRoute,
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Text(
                  "Daily Task",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Text(
                  "Sell all",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: context.resources.color.brandColor_02,
                      ),
                ),
              ],
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

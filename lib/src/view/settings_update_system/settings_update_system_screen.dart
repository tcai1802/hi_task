import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

class SettingsUpdateSystemScreen extends StatelessWidget {
  const SettingsUpdateSystemScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBarWithBodyBase(
      title: "Update System",
      primaryColor: context.resources.color.brandColor_11,
      backgroundColor: context.resources.color.brandColor_02,
      bgAppBarColor: context.resources.color.brandColor_02,
      bodyWidget: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 30.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          color: context.resources.color.bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r),
            topRight: Radius.circular(50.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 61.h),
            Container(
              color: Colors.red,
            ),
            ImageBaseWidget(
              imageType: ImageTypeEnum.svgPicture,
              imageUrl: context.resources.drawable.imgLogo,
            ),
            SizedBox(height: 20.h),
            Text(
              "Version 3.22.18 | Android 12",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: context.resources.color.subHeaderColor,
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Official versions",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: context.resources.color.textColor,
                      ),
                ),
                SizedBox(width: 4.w),
                Text(
                  "2.42 GB",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: context.resources.color.textColor,
                      ),
                ),
                SizedBox(width: 4.w),
                Text(
                  "2022.03.02",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: context.resources.color.textColor,
                      ),
                ),
              ],
            ),
            SizedBox(height: 80.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About this update",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: context.resources.color.brandColor_02,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    "Your task-wan application system will go to a newer version based on android 12. With a newer and fresher look",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: context.resources.color.textColor,
                        ),
                  )
                ],
              ),
            ),
            SizedBox(height: 34.h),
            CustomButtonBase(
              titleBtn: "Update Now",
              widthBtn: double.infinity,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

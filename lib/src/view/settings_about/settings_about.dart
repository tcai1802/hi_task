import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

class SettingsAboutScreen extends StatelessWidget {
  const SettingsAboutScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBarWithBodyBase(
      title: "About",
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
            const Spacer(),
            Container(
              color: Colors.red,
            ),
            ImageBaseWidget(
              imageType: ImageTypeEnum.svgPicture,
              imageUrl: context.resources.drawable.imgLogo,
            ),
            SizedBox(height: 20.h),
            Text(
              "Version 1.0.0",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: context.resources.color.subHeaderColor,
                  ),
            ),
            SizedBox(height: 10.h),
            Text(
              "©2023 HiTask",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: context.resources.color.textColor,
                  ),
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

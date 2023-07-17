import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

class SettingsSecurityScreen extends StatelessWidget {
  const SettingsSecurityScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBarWithBodyBase(
      title: "Security",
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
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 61.h),
                  Text(
                    "Password",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: context.resources.color.brandColor_02,
                        ),
                  ),
                  SizedBox(height: 10.h),
                  TextFieldBase(
                    hintText: 'Password',
                    controller: TextEditingController(),
                    iconUrl: context.resources.drawable.iconLock,
                    isPass: true,
                  ),
                  SizedBox(height: 20.h),
                  TextFieldBase(
                    hintText: 'New Password',
                    controller: TextEditingController(),
                    iconUrl: context.resources.drawable.iconLock,
                    isPass: true,
                  ),
                  SizedBox(height: 20.h),
                  TextFieldBase(
                    hintText: 'Confirm New Password',
                    controller: TextEditingController(),
                    iconUrl: context.resources.drawable.iconLock,
                    isPass: true,
                  ),
                  SizedBox(height: 20.h),
                  CustomButtonBase(
                    widthBtn: double.infinity,
                    titleBtn: "Submit",
                    onTap: () {},
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    "Login Activity",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: context.resources.color.brandColor_02,
                        ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      ImageBaseWidget(
                        imageType: ImageTypeEnum.svgPicture,
                        imageUrl: context.resources.drawable.iconLocation,
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Malang, Indonesia",
                            style: Theme.of(context).textTheme.bodyMedium!,
                          ),
                          Text(
                            "Active Now",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color: context.resources.color.subHeaderColor,
                                ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

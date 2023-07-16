import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

class ProfileMenuOption extends StatelessWidget {
  const ProfileMenuOption({
    super.key,
    this.onTap,
    required this.iconUrl,
    this.title,
  });
  final Function? onTap;
  final String iconUrl;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap != null ? onTap!() : () {},
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 45.h),
        child: Row(
          children: [
            ImageBaseWidget(
              imageType: ImageTypeEnum.svgPicture,
              imageUrl: iconUrl,
              imgColor: context.resources.color.brandColor_02,
              imageWidth: 24.h,
              boxFit: BoxFit.contain,
              imageHeight: 24.h,
            ),
            SizedBox(width: 30.w),
            Text(
              title ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}

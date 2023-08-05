import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    super.key,
    this.size,
    this.imageUrl = "",
    this.imageTypeEnum = ImageTypeEnum.cachedNetWork,
  });
  final double? size;
  final String imageUrl;
  final ImageTypeEnum imageTypeEnum;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 84.h,
      width: size ?? 84.h,
      decoration: BoxDecoration(
        color: context.resources.color.bgColor,
        borderRadius: BorderRadius.circular(50.r),
        border: Border.all(
          color: context.resources.color.brandColor_02.withOpacity(.3),
          width: 0.3,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.r),
        child: ImageBaseWidget(
          imageType: imageTypeEnum,
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/colors/app_colors.dart';
import 'package:hi_task/src/res/drawable/app_drawable.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

class GetStartedCard extends StatelessWidget {
  const GetStartedCard({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageBaseWidget(
          imageType: ImageTypeEnum.assetFile,
          imageUrl: data["imageUrl"],
          imageHeight: 260.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Text(
            data["title"],
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          data["description"],
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColors().textColor_02,
              ),
        ),
      ],
    );
  }
}

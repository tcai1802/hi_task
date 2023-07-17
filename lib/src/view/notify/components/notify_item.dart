import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

class NotifyItem extends StatelessWidget {
  const NotifyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.h),
      color: Color(0xFFF1F7FE),
      child: Row(
        children: [
          ImageBaseWidget(
            imageType: ImageTypeEnum.svgPicture,
            imageUrl: context.resources.drawable.iconCheckBox,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "UI Task less than 8 days",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  "Well done Phillip, you have completed all the tasks for today",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Color(0xFF474747),
                      ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

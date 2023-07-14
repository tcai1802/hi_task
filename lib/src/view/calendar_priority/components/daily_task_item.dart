import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';

class DailyTaskItem extends StatefulWidget {
  const DailyTaskItem({super.key});

  @override
  State<DailyTaskItem> createState() => _DailyTaskItemState();
}

class _DailyTaskItemState extends State<DailyTaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: CustomButtonBase(
        titleBtn: "Daily meeting",
        paddingBtn: EdgeInsets.symmetric(
          vertical: 15.h,
          horizontal: 15.w,
        ),
        bgColorBtn: context.resources.color.brandColor_11,
        titleStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: context.resources.color.textColor,
              fontWeight: FontWeight.w500,
            ),
        borderStyle: Border.all(
          color: context.resources.color.brandColor_02.withOpacity(.1),
        ),
        suffixWidget: Expanded(child: Container()),
        onTap: () {
          //Navigator.pushNamed(context, AppRoutes().dailyTaskDetailsRoute);
        },
      ),
    );
  }
}

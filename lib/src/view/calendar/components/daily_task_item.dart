import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/models/task_model/exports.dart';

class DailyTaskItem extends StatefulWidget {
  const DailyTaskItem({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  State<DailyTaskItem> createState() => _DailyTaskItemState();
}

class _DailyTaskItemState extends State<DailyTaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: CustomButtonBase(
        titleBtn: widget.taskModel.title,
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
        //suffixWidget: Expanded(child: Container()),
        mainAxisAlignment: MainAxisAlignment.start,
        onTap: () {
          //Navigator.pushNamed(context, AppRoutes().dailyTaskDetailsRoute);
        },
      ),
    );
  }
}

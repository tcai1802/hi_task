import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/models/task_model/exports.dart';
import 'package:hi_task/src/utils/datetime_format.dart';

class PriorityCard extends StatelessWidget {
  const PriorityCard({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 138.h,
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
        color: context.resources.color.bgColor,
        border: Border.all(
          color: const Color(0xFFABCEF5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 68.h,
              width: 2.w,
              decoration: BoxDecoration(
                  color: context.resources.color.brandColor_02,
                  borderRadius: BorderRadius.circular(10.r)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 25.h,
              right: 20.h,
              top: 10.h,
              bottom: 10.h,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      taskModel.title!.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: context.resources.color.brandColor_02,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.more_horiz_rounded,
                      size: 24.h,
                      color: context.resources.color.brandColor_02,
                    )
                  ],
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      taskModel.description!,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: context.resources.color.textColor,
                          ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      "${DateTimeFormat().convertDateTimeToString(taskModel.startDate!, formatString: "MMMM,dd")} - ${DateTimeFormat().convertDateTimeToString(taskModel.endDate!, formatString: "MMMM,dd")}",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(0xFF0668E5),
                          ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

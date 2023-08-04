import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/models/model_exports.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/utils/datetime_format.dart';

class HomePriorityTaskCard extends StatelessWidget {
  const HomePriorityTaskCard({
    super.key,
    this.onTap,
    this.taskModel,
  });
  final Function? onTap;
  final TaskModel? taskModel;
  @override
  Widget build(BuildContext context) {
    final List<TodoModel> completedTaskList = taskModel!.todoList!
        .where((element) => element.isCompleted == true)
        .toList();
    //print("====${taskModel!.startDate}");

    Color randomColor() {
      List<Color> colorList = const [
        Color(0xFF68A0F4),
        Color(0xFF362075),
        Color(0xFFCD2C2C),
      ];
      return colorList[Random().nextInt(colorList.length)];
    }

    return GestureDetector(
      onTap: () => onTap != null ? onTap!() : () {},
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        width: 129.w,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                //color: context.resources.color.brandColor_02,
                color: randomColor(),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: ImageBaseWidget(
                imageType: ImageTypeEnum.svgPicture,
                imageUrl: context.resources.drawable.imgPriorityTaskCard,
                imgColor: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                            color: context.resources.color.bgColor,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Text(
                          DateTimeFormat()
                              .convertToRemainTime(taskModel!.endDate!),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.directions_run_outlined,
                        color: context.resources.color.brandColor_11,
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: Text(
                          "${taskModel?.title} ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: context.resources.color.brandColor_11),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        taskModel!.isCompleted! ? "Completed" : "Progress",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.resources.color.brandColor_11),
                      ),
                      const Spacer()
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Stack(
                    children: [
                      Container(
                        height: 4,
                        decoration: BoxDecoration(
                          color: const Color(0xFF004797),
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: taskModel!.todoList!.isNotEmpty
                              ? completedTaskList.length /
                                  taskModel!.todoList!.length
                              : 1,
                          child: Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: context.resources.color.brandColor_11,
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        "${((taskModel!.todoList!.isNotEmpty ? completedTaskList.length / taskModel!.todoList!.length : 1) * 100).toInt()} %",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: context.resources.color.brandColor_11,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

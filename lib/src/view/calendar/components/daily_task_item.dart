import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/blocs/blocs_exports.dart';
import 'package:hi_task/src/models/task_model/exports.dart';
import 'package:hi_task/src/res/arguments/arguments.dart';
import 'package:hi_task/src/res/arguments/task_details_argument.dart';
import 'package:hi_task/src/res/routes/app_routes.dart';

import 'exports.dart';

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        suffixWidget: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 22.h,
              width: 22.h,
              decoration: BoxDecoration(
                color: context.resources.color.bgColor,
                border: Border.all(
                  color: context.resources.color.brandColor_02,
                ),
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
            AnimatedContainer(
              height: widget.taskModel.isCompleted! ? 16.h : 0.h,
              width: widget.taskModel.isCompleted! ? 16.h : 0.h,
              duration: const Duration(milliseconds: 400),
              curve: Curves.bounceOut,
              decoration: BoxDecoration(
                color: context.resources.color.brandColor_02,
                border: Border.all(
                  color: context.resources.color.brandColor_02,
                ),
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoutes().taskDetailsRoute,
            arguments: TaskDetailsArguments(widget.taskModel),
          );
        },
        onDoubleTap: () {
          menuOptionDialog(
            context,
            onEditTodo: () {
              Navigator.pushNamed(
                context,
                AppRoutes().editTaskRoute,
                arguments: EditTaskArgument(widget.taskModel),
              );
            },
            onDeleteTodo: () {
              context.read<CalendarBloc>().add(OnDeleteClickEvent(widget.taskModel.taskId!));
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/custom_button_base.dart';
import 'package:hi_task/src/blocs/blocs_exports.dart';
import 'package:hi_task/src/models/model_exports.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/utils/datetime_format.dart';
import 'package:hi_task/src/view/task_details/components/task_checkbox.dart';

class TaskDetailsScreen extends StatefulWidget {
  final TaskModel taskModel;
  const TaskDetailsScreen({
    super.key,
    required this.taskModel,
  });

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TaskDetailsBloc>().add(InitTaskDetailsEvent(widget.taskModel.taskId!));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskDetailsBloc, TaskDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25.h),
                    Row(
                      children: [
                        Text(
                          state.taskModel?.title ?? "",
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontWeight: FontWeight.w700,
                                color: context.resources.color.brandColor_02,
                              ),
                        ),
                        const Spacer(),
                        CustomButtonBase(
                          prefixWidget: Icon(
                            Icons.close,
                            size: 18.sp,
                            color: context.resources.color.brandColor_11,
                          ),
                          paddingBtn: EdgeInsets.all(12.h),
                          onTap: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                    SizedBox(height: 17.h),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: context.resources.color.textColor),
                            children: [
                              TextSpan(
                                text: "start \n",
                                style: TextStyle(
                                  fontSize: context.resources.dimension.textSM,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                //text: "21 Feb 2022",
                                text: state.taskModel?.startDate != null
                                    ? DateTimeFormat().convertDateTimeToString(
                                        state.taskModel!.startDate!,
                                        formatString: "dd MMM yyyy",
                                      )
                                    : "-----",
                                style: TextStyle(
                                  fontSize: context.resources.dimension.textXL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: context.resources.color.textColor),
                            children: [
                              TextSpan(
                                text: "end \n",
                                style: TextStyle(
                                  fontSize: context.resources.dimension.textSM,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: state.taskModel?.endDate != null
                                    ? DateTimeFormat().convertDateTimeToString(
                                        state.taskModel!.endDate!,
                                        formatString: "dd MMM yyyy",
                                      )
                                    : "-----",
                                style: TextStyle(
                                  fontSize: context.resources.dimension.textXL,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 12.h),
                    BlocBuilder<TaskDetailsBloc, TaskDetailsState>(
                      buildWhen: (previous, current) => previous.seconds != current.seconds,
                      builder: (context, state) {
                        final List<String> timeArray = context.read<TaskDetailsBloc>().intToTimeLeft(state.seconds);

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _timeWidget(
                              context,
                              time: timeArray[0],
                              timeType: "days",
                            ),
                            SizedBox(width: 10.w),
                            _timeWidget(
                              context,
                              time: timeArray[1],
                              timeType: "hours",
                            ),
                            SizedBox(width: 10.w),
                            _timeWidget(
                              context,
                              time: timeArray[2],
                              timeType: "minutes",
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Description",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: context.resources.color.textColor,
                          ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      state.taskModel?.description ?? "",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: context.resources.color.textColor,
                          ),
                    ),
                    SizedBox(height: 24.h),
                    if (state.taskModel?.todoList != null && state.taskModel?.taskType == TaskTypeEnum.priorityTask)
                      BlocListener<TaskDetailsBloc, TaskDetailsState>(
                        listener: (context, state) {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Progress",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: context.resources.color.textColor,
                                  ),
                            ),
                            SizedBox(height: 2.h),
                            Stack(
                              children: [
                                Container(
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFA9A2A2),
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AnimatedFractionallySizedBox(
                                    widthFactor: state.percentCompleted,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn,
                                    child: Container(
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                        color: context.resources.color.brandColor_02,
                                        borderRadius: BorderRadius.circular(20.r),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  left: 0,
                                  bottom: 0,
                                  top: 0,
                                  child: Center(
                                    child: Text(
                                      "${state.percentCompleted * 100}%",
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: context.resources.color.brandColor_11,
                                          ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              "To do List",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: context.resources.color.textColor,
                                  ),
                            ),
                            SizedBox(height: 4.h),
                            ...state.todoList.asMap().entries.map(
                                  (data) => PriorityTaskCheckBox(
                                    todoModel: data.value,
                                    onTap: (value) {
                                      context.read<TaskDetailsBloc>().add(
                                            OnCompleteOrNotTodoEvent(
                                              data.value,
                                              value,
                                              data.key,
                                            ),
                                          );
                                    },
                                  ),
                                ),
                          ],
                        ),
                      ),
                    SizedBox(height: 30.h),
                    CustomButtonBase(
                      widthBtn: double.infinity,
                      titleBtn: state.finishedTask ? "Completed" : "Finish",
                      onTap: () {
                        context.read<TaskDetailsBloc>().add(SubmitFinishTask(!state.finishedTask));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Container _timeWidget(
    BuildContext context, {
    String time = "",
    String timeType = "",
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      constraints: BoxConstraints(
        minWidth: 90.w,
      ),
      decoration: BoxDecoration(
        color: context.resources.color.brandColor_02,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: SizedBox(
        child: Column(
          children: [
            Text(
              time,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.resources.color.brandColor_11,
                  ),
            ),
            Text(
              timeType,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.resources.color.brandColor_11,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

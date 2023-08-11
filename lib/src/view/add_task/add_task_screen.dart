import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/blocs/blocs_exports.dart';
import 'package:hi_task/src/models/model_exports.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/res/routes/app_routes.dart';
import 'package:hi_task/src/utils/datetime_format.dart';
import 'package:hi_task/src/view/add_task/components/exports.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
    required this.taskTypeEnum,
  });
  final TaskTypeEnum taskTypeEnum;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBarWithBodyBase(
      title: "Add task",
      primaryColor: context.resources.color.brandColor_11,
      backgroundColor: context.resources.color.brandColor_02,
      bgAppBarColor: context.resources.color.brandColor_02,
      resizeToAvoidBottomInset: true,
      bodyWidget: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 30.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        decoration: BoxDecoration(
          color: context.resources.color.bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r),
            topRight: Radius.circular(50.r),
          ),
        ),
        child: BlocConsumer<AddTaskBloc, AddTaskState>(
          listener: (context, state) {
            switch (state.addTaskStatusEnum) {
              case AddTaskStatusEnum.loading:
                EasyLoading.show(status: "Uploading...");
                break;
              case AddTaskStatusEnum.init:
                break;
              case AddTaskStatusEnum.failure:
                EasyLoading.showError(state.message ?? "Task create failed");
                break;
              case AddTaskStatusEnum.success:
                EasyLoading.showSuccess("Task created");
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes().dashBoardRoute, (route) => false);
                break;
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: context.resources.color.brandColor_02,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            SizedBox(height: 5.h),
                            CustomButtonBase(
                              widthBtn: double.infinity,
                              prefixWidget: Padding(
                                padding: EdgeInsets.only(right: 15.w),
                                child: Icon(
                                  Icons.calendar_today_rounded,
                                  size: 24.h,
                                  color: context.resources.color.brandColor_02,
                                ),
                              ),
                              bgColorBtn: context.resources.color.bgColor,
                              titleBtn: state.startTime != null
                                  ? DateTimeFormat().convertDateTimeToString(
                                      state.startTime!,
                                    )
                                  : "---",
                              paddingBtn: EdgeInsets.all(10.h),
                              borderStyle: Border.all(
                                color: context.resources.color.brandColor_02.withOpacity(.1),
                              ),
                              mainAxisAlignment: MainAxisAlignment.start,
                              onTap: () => {
                                showDialogBase(
                                  context,
                                  CalendarBase(
                                    onDaySelected: (DateTime timeSelected) {
                                      context.read<AddTaskBloc>().add(OnChangeStartTimeEvent(timeSelected));
                                    },
                                  ),
                                ),
                              },
                              titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: context.resources.color.textColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ends",
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: context.resources.color.brandColor_02,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            SizedBox(height: 5.h),
                            CustomButtonBase(
                              widthBtn: double.infinity,
                              prefixWidget: Padding(
                                padding: EdgeInsets.only(right: 15.w),
                                child: Icon(
                                  Icons.calendar_today_rounded,
                                  size: 24.h,
                                  color: context.resources.color.brandColor_02,
                                ),
                              ),
                              bgColorBtn: state.taskTypeEnum != TaskTypeEnum.dailyTask
                                  ? context.resources.color.bgColor
                                  : Colors.grey[100],
                              titleBtn: state.endTime != null
                                  ? DateTimeFormat().convertDateTimeToString(state.endTime ?? DateTime.now())
                                  : "---",
                              paddingBtn: EdgeInsets.all(10.h),
                              borderStyle: Border.all(
                                color: context.resources.color.brandColor_02.withOpacity(.1),
                              ),
                              mainAxisAlignment: MainAxisAlignment.start,
                              onTap: () => {
                                if (state.taskTypeEnum != TaskTypeEnum.dailyTask)
                                  showDialogBase(
                                    context,
                                    CalendarBase(
                                      onDaySelected: (DateTime timeSelected) {
                                        context.read<AddTaskBloc>().add(OnChangeEndTimeEvent(timeSelected));
                                      },
                                    ),
                                  ),
                              },
                              titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: context.resources.color.textColor,
                                  ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "Title",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: context.resources.color.brandColor_02,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: 5.h),
                  TextFieldBase(
                    hintText: 'Type something...',
                    controller: titleController,
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "Category",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: context.resources.color.brandColor_02,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Expanded(
                        child: state.taskTypeEnum == TaskTypeEnum.priorityTask
                            ? CustomButtonBase(
                                titleBtn: 'Priority Task',
                                paddingBtn: EdgeInsets.symmetric(vertical: 13.h),
                                onTap: () {},
                              )
                            : CustomButtonBase(
                                titleBtn: 'Priority Task',
                                paddingBtn: EdgeInsets.symmetric(vertical: 13.h),
                                onTap: () {
                                  context
                                      .read<AddTaskBloc>()
                                      .add(const OnChangeTaskTypeEvent(TaskTypeEnum.priorityTask));
                                },
                                bgColorBtn: Colors.transparent,
                                borderStyle: Border.all(
                                  color: context.resources.color.brandColor_02.withOpacity(.1),
                                ),
                                titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: context.resources.color.brandColor_02,
                                    ),
                              ),
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: state.taskTypeEnum == TaskTypeEnum.dailyTask
                            ? CustomButtonBase(
                                titleBtn: 'Daily Task',
                                paddingBtn: EdgeInsets.symmetric(vertical: 13.h),
                                onTap: () {},
                              )
                            : CustomButtonBase(
                                titleBtn: 'Daily Task',
                                paddingBtn: EdgeInsets.symmetric(vertical: 13.h),
                                onTap: () {
                                  context.read<AddTaskBloc>().add(
                                        const OnChangeTaskTypeEvent(
                                          TaskTypeEnum.dailyTask,
                                        ),
                                      );
                                },
                                bgColorBtn: Colors.transparent,
                                borderStyle: Border.all(
                                  color: context.resources.color.brandColor_02.withOpacity(.1),
                                ),
                                titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: context.resources.color.brandColor_02,
                                    ),
                              ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: context.resources.color.brandColor_02,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: 5.h),
                  TextFieldBase(
                    hintText: 'Enter description...',
                    controller: desController,
                    maxLines: 8,
                  ),
                  if (state.taskTypeEnum == TaskTypeEnum.priorityTask)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        Text(
                          "To do list",
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                color: context.resources.color.brandColor_02,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        SizedBox(height: 5.h),
                        BlocBuilder<AddTaskBloc, AddTaskState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                ...state.todoList.asMap().entries.map(
                                      (entry) => Container(
                                        margin: EdgeInsets.only(bottom: 20.h),
                                        child: CustomButtonBase(
                                          titleBtn: entry.value.content,
                                          widthBtn: double.infinity,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          paddingBtn: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
                                          onDoubleTap: () {
                                            //successWidget(
                                            //  context,
                                            //  content: "new task has been created successfully",
                                            //);
                                            editTodoWidget(
                                              context,
                                              currentModel: entry.value,
                                              onEditTodo: (String value) {
                                                context.read<AddTaskBloc>().add(
                                                      OnEditTodoEvent(
                                                        TodoModel(
                                                          content: value,
                                                          isCompleted: false,
                                                        ),
                                                        entry.key,
                                                      ),
                                                    );
                                              },
                                              onDeleteTodo: () {
                                                context.read<AddTaskBloc>().add(
                                                      OnDelTodoEvent(entry.key),
                                                    );
                                              },
                                            );
                                          },
                                          bgColorBtn: Colors.transparent,
                                          borderStyle: Border.all(
                                            color: context.resources.color.brandColor_02.withOpacity(.1),
                                          ),
                                          titleStyle: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ),
                                    ),
                              ],
                            );
                          },
                        ),
                        CustomButtonBase(
                          titleBtn: 'Add more',
                          widthBtn: double.infinity,
                          paddingBtn: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                          onTap: () {
                            newTodoWidget(
                              context,
                              onAddTodo: (String value) {
                                context.read<AddTaskBloc>().add(
                                      OnAddTodoEvent(
                                        TodoModel(content: value, isCompleted: false),
                                      ),
                                    );
                              },
                            );
                          },
                          prefixWidget: Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Icon(
                              Icons.add,
                              color: context.resources.color.textColor_01,
                              size: 22.h,
                            ),
                          ),
                          bgColorBtn: Colors.transparent,
                          borderStyle: Border.all(
                            color: context.resources.color.brandColor_02.withOpacity(.1),
                          ),
                          titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: context.resources.color.textColor_01,
                              ),
                        ),
                      ],
                    ),
                  SizedBox(height: 50.h),
                  CustomButtonBase(
                    titleBtn: 'Create task',
                    widthBtn: double.infinity,
                    paddingBtn: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
                    onTap: () {
                      context.read<AddTaskBloc>().add(
                            OnSubmitTaskEvent(
                              TaskModel(
                                createdAt: DateTime.now().toUtc(),
                                title: titleController.text.trim(),
                                startDate: state.startTime,
                                endDate: state.endTime,
                                todoList: state.todoList,
                                userId: FirebaseAuth.instance.currentUser!.uid,
                                taskType: state.taskTypeEnum,
                                description: desController.text.trim(),
                              ),
                            ),
                          );
                    },
                    titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: context.resources.color.brandColor_11,
                        ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

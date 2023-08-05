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
import 'package:hi_task/src/view/edit_task/components/todo_checkbox.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<EditTaskBloc>().add(OnInitDataEvent(widget.taskModel));
    titleController.text = widget.taskModel.title ?? "";
    desController.text = widget.taskModel.description ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditTaskBloc, EditTaskState>(
      listener: (context, state) {
        switch (state.ediTaskStatus) {
          case AddTaskStatusEnum.loading:
            EasyLoading.show(status: "Updating...");
            break;
          case AddTaskStatusEnum.init:
            break;
          case AddTaskStatusEnum.failure:
            EasyLoading.showError(state.message);
            break;
          case AddTaskStatusEnum.success:
            EasyLoading.showSuccess(state.message);
            Navigator.pushNamedAndRemoveUntil(context, AppRoutes().dashBoardRoute, (route) => false);
            break;
        }
      },
      builder: (context, state) {
        return AppBarWithBodyBase(
          title: "Edit task",
          primaryColor: context.resources.color.brandColor_11,
          backgroundColor: context.resources.color.brandColor_02,
          bgAppBarColor: context.resources.color.brandColor_02,
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "UI Design",
                      style: Theme.of(context).textTheme.displayMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.resources.color.brandColor_02,
                          ),
                    ),
                  ),
                  SizedBox(height: 34.h),
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
                              titleBtn: DateTimeFormat().convertDateTimeToString(
                                state.startDate ?? DateTime.now(),
                                formatString: "MMMM-dd-yyyy",
                              ),
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
                                      //print(
                                      //    "Time selected: ${timeSelected.toUtc()} ");
                                      context.read<EditTaskBloc>().add(OnChangeStartDateEvent(timeSelected));
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
                              bgColorBtn: context.resources.color.bgColor,
                              titleBtn: DateTimeFormat().convertDateTimeToString(
                                state.endDate ?? DateTime.now(),
                                formatString: "MMMM-dd-yyyy",
                              ),
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
                                      //print(
                                      //    "Time selected: ${timeSelected.toUtc()} ");
                                      context.read<EditTaskBloc>().add(OnChangeEndDateEvent(timeSelected));
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
                    hintText: 'Enter title...',
                    controller: titleController,
                    onChange: (String value) {
                      context.read<EditTaskBloc>().add(OnChangeTitleEvent(value.trim()));
                    },
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
                          child: CustomButtonBase(
                        titleBtn: widget.taskModel.taskType == TaskTypeEnum.priorityTask
                            ? 'Priority Task'
                            : widget.taskModel.taskType == TaskTypeEnum.dailyTask
                                ? 'Daily Task'
                                : "-----",
                        paddingBtn: EdgeInsets.symmetric(vertical: 13.h),
                        onTap: () {},
                      )),
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
                    onChange: (String value) {
                      context.read<EditTaskBloc>().add(OnChangeDesEvent(value.trim()));
                    },
                  ),
                  if (widget.taskModel.taskType == TaskTypeEnum.priorityTask)
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
                        ...state.todoList.asMap().entries.map(
                              (data) => TodoCheckBox(
                                data: data.value,
                                onDoubleTap: () {
                                  editTodoWidget(
                                    context,
                                    currentModel: data.value,
                                    onEditTodo: (String value) {
                                      context.read<AddTaskBloc>().add(
                                            OnEditTodoEvent(
                                              TodoModel(
                                                content: value,
                                                isCompleted: false,
                                              ),
                                              data.key,
                                            ),
                                          );
                                    },
                                    onDeleteTodo: () {
                                      context.read<EditTaskBloc>().add(
                                            OnEditDelTodoEvent(data.key),
                                          );
                                    },
                                  );
                                },
                                onTap: () {
                                  //print("Change");
                                  context.read<EditTaskBloc>().add(
                                        OnChangeTodoItemStatusEvent(
                                          data.key,
                                          !data.value.isCompleted,
                                        ),
                                      );
                                },
                              ),
                            ),
                        CustomButtonBase(
                          titleBtn: 'Add more',
                          widthBtn: double.infinity,
                          paddingBtn: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                          onTap: () {
                            newTodoWidget(
                              context,
                              onAddTodo: (String value) {
                                context.read<EditTaskBloc>().add(
                                      OnEditAddTodoEvent(
                                        TodoModel(
                                          content: value,
                                          isCompleted: false,
                                        ),
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
                    titleBtn: 'Update',
                    widthBtn: double.infinity,
                    paddingBtn: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
                    onTap: () {
                      context.read<EditTaskBloc>().add(SubmitEditEvent(widget.taskModel));
                    },
                    titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: context.resources.color.brandColor_11,
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

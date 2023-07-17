import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/show_dialog_base.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/view/add_task/components/edit_todo_widget.dart';
import 'package:hi_task/src/view/add_task/components/exports.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
    required this.taskTypeEnum,
  });
  final TaskTypeEnum taskTypeEnum;
  @override
  Widget build(BuildContext context) {
    return AppBarWithBodyBase(
      title: "Add task",
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
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
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
                          titleBtn: "Feb-21-2022",
                          paddingBtn: EdgeInsets.all(10.h),
                          borderStyle: Border.all(
                            color: context.resources.color.brandColor_02
                                .withOpacity(.1),
                          ),
                          mainAxisAlignment: MainAxisAlignment.start,
                          onTap: () => {
                            showDialogBase(context, const CalendarBase()),
                          },
                          titleStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
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
                          titleBtn: "Feb-21-2022",
                          paddingBtn: EdgeInsets.all(10.h),
                          borderStyle: Border.all(
                            color: context.resources.color.brandColor_02
                                .withOpacity(.1),
                          ),
                          mainAxisAlignment: MainAxisAlignment.start,
                          onTap: () => {
                            showDialogBase(context, const CalendarBase()),
                          },
                          titleStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                hintText: 'Username',
                controller: TextEditingController(),
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
                    child: taskTypeEnum == TaskTypeEnum.priorityTask
                        ? CustomButtonBase(
                            titleBtn: 'Priority Task',
                            paddingBtn: EdgeInsets.symmetric(vertical: 13.h),
                            onTap: () {},
                          )
                        : CustomButtonBase(
                            titleBtn: 'Priority Task',
                            paddingBtn: EdgeInsets.symmetric(vertical: 13.h),
                            onTap: () {},
                            bgColorBtn: Colors.transparent,
                            borderStyle: Border.all(
                              color: context.resources.color.brandColor_02
                                  .withOpacity(.1),
                            ),
                            titleStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: context.resources.color.brandColor_02,
                                ),
                          ),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: taskTypeEnum == TaskTypeEnum.dailyTask
                        ? CustomButtonBase(
                            titleBtn: 'Daily Task',
                            paddingBtn: EdgeInsets.symmetric(vertical: 13.h),
                            onTap: () {},
                          )
                        : CustomButtonBase(
                            titleBtn: 'Daily Task',
                            paddingBtn: EdgeInsets.symmetric(vertical: 13.h),
                            onTap: () {},
                            bgColorBtn: Colors.transparent,
                            borderStyle: Border.all(
                              color: context.resources.color.brandColor_02
                                  .withOpacity(.1),
                            ),
                            titleStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
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
                controller: TextEditingController(),
                maxLines: 8,
              ),
              if (taskTypeEnum == TaskTypeEnum.priorityTask)
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
                    ...List.generate(
                      10,
                      (index) => Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        child: CustomButtonBase(
                          titleBtn: 'Priority Task',
                          widthBtn: double.infinity,
                          mainAxisAlignment: MainAxisAlignment.start,
                          paddingBtn: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 12.w),
                          onDoubleTap: () {
                            //successWidget(
                            //  context,
                            //  content: "new task has been created successfully",
                            //);
                            newTodoWidget(context);
                          },
                          bgColorBtn: Colors.transparent,
                          borderStyle: Border.all(
                            color: context.resources.color.brandColor_02
                                .withOpacity(.1),
                          ),
                          titleStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    CustomButtonBase(
                      titleBtn: 'Add more',
                      widthBtn: double.infinity,
                      paddingBtn: EdgeInsets.symmetric(
                          vertical: 12.h, horizontal: 12.w),
                      onTap: () {},
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
                        color: context.resources.color.brandColor_02
                            .withOpacity(.1),
                      ),
                      titleStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: context.resources.color.textColor_01,
                              ),
                    ),
                  ],
                ),
              SizedBox(height: 50.h),
              CustomButtonBase(
                titleBtn: 'Create task',
                widthBtn: double.infinity,
                paddingBtn:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
                onTap: () {},
                titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: context.resources.color.brandColor_11,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

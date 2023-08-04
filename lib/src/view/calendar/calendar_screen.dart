import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/blocs/blocs_exports.dart';
import 'package:hi_task/src/blocs/home/home_bloc.dart';
import 'package:hi_task/src/res/arguments/add_task_argument.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/res/routes/app_routes.dart';
import 'package:hi_task/src/utils/datetime_format.dart';
import 'package:hi_task/src/view/calendar/components/exports.dart';

class CalendarPriorityScreen extends StatefulWidget {
  const CalendarPriorityScreen({super.key});

  @override
  State<CalendarPriorityScreen> createState() => _CalendarPriorityScreenState();
}

class _CalendarPriorityScreenState extends State<CalendarPriorityScreen> {
  @override
  void initState() {
    super.initState();
    if (context.read<CalendarBloc>().state.isFirstInit) {
      {
        context.read<CalendarBloc>().add(CalendarInitEvent(DateTime.now()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalendarBloc, CalendarState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Row(
                  children: [
                    ImageBaseWidget(
                      imageType: ImageTypeEnum.svgPicture,
                      imageUrl: context.resources.drawable.iconCalendar,
                      imgColor: context.resources.color.brandColor_02,
                      imageWidth: 24.w,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        DateTimeFormat().convertDateTimeToString(
                                state.currentTime ?? DateTime.now(),
                                formatString: "MMMM,yyyy") ??
                            "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                    //const Spacer(),
                    CustomButtonBase(
                      prefixWidget: Icon(
                        Icons.add,
                        color: context.resources.color.brandColor_11,
                      ),
                      titleBtn: "Add task",
                      paddingBtn: EdgeInsets.all(10.h),
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRoutes().addTaskRoute,
                        arguments: AddTaskArgument(TaskTypeEnum.priorityTask),
                      ),
                    ),
                  ],
                ),
              ),
              EasyDateTimeLine(
                initialDate: state.currentTime ?? DateTime.now(),
                onDateChange: (selectedDate) {
                  //[selectedDate] the new date selected.
                  //print("selected date: ${selectedDate}");
                  //print("selected date: ${DateTime.now()}");
                  context
                      .read<CalendarBloc>()
                      .add(CalendarInitEvent(selectedDate));
                },
                headerProps: const EasyHeaderProps(
                  showHeader: false,
                  showMonthPicker: false,
                ),
                activeColor: const Color(0xffFFBF9B),
                dayProps: EasyDayProps(
                  dayStructure: DayStructure.dayNumDayStr,
                  inactiveBorderRadius: 10.r,
                  activeDayDecoration: null,
                  activeBorderRadius: 10.r,
                  height: 64.h,
                ),
                itemBuilder: (context, dayNumber, dayName, monthName, fullDate,
                    isSelected) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        margin: EdgeInsets.only(right: 10.w),
                        height: isSelected ? 64.h : 50.h,
                        width: isSelected ? 64.h : 50.h,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? context.resources.color.brandColor_02
                              : const Color(0xFFEBF2FF),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              dayName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: isSelected
                                        ? context.resources.color.brandColor_10
                                        : context.resources.color.brandColor_02,
                                  ),
                            ),
                            Text(
                              dayNumber,
                              style: isSelected
                                  ? Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: context
                                            .resources.color.brandColor_10,
                                        fontWeight: FontWeight.w700,
                                      )
                                  : Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: context
                                            .resources.color.brandColor_02,
                                        fontWeight: FontWeight.w700,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 30.h),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      _taskTabBar(
                        context,
                        title: "Priority Task",
                        index: 0,
                        isEnable: state.currentTabIndex == 0,
                      ),
                      _taskTabBar(
                        context,
                        title: "Daily Task",
                        index: 1,
                        isEnable: state.currentTabIndex == 1,
                      )
                    ],
                  )
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: state.currentTabIndex == 0
                      ? state.priorityTaskStatus ==
                              PriorityTaskStatusEnum.loading
                          ? const Center(
                              child: Text("Loading data..."),
                            )
                          : state.priorityTaskList.isEmpty
                              ? const Center(
                                  child: Text("No data"),
                                )
                              : ListView.builder(
                                  itemCount: state.priorityTaskList.length,
                                  itemBuilder: (context, index) {
                                    return PriorityCard(
                                      taskModel: state.priorityTaskList[index],
                                    );
                                  },
                                )
                      : state.dailyTaskStatus == DailyTaskStatusEnum.loading
                          ? const Center(
                              child: Text("Loading data..."),
                            )
                          : state.dailyTaskList.isEmpty
                              ? const Center(
                                  child: Text("No data"),
                                )
                              : ListView.builder(
                                  itemCount: state.dailyTaskList.length,
                                  itemBuilder: (context, index) {
                                    return DailyTaskItem(
                                      taskModel: state.dailyTaskList[index],
                                    );
                                  },
                                ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _taskTabBar(
    BuildContext context, {
    required String title,
    required int index,
    required bool isEnable,
  }) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          context.read<CalendarBloc>().add(OnChangeIndexTabEvent(index));
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Column(
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isEnable
                          ? context.resources.color.brandColor_02
                          : context.resources.color.subHeaderColor,
                    ),
              ),
              SizedBox(height: 4.h),
              AnimatedContainer(
                width: isEnable ? 20.w : 0.w,
                height: 2.h,
                decoration: BoxDecoration(
                  color: context.resources.color.brandColor_02,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
              )
            ],
          ),
        ),
      ),
    );
  }
}

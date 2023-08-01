import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBase extends StatefulWidget {
  const CalendarBase({
    super.key,
    required this.onDaySelected,
  });
  final Function onDaySelected;
  @override
  State<CalendarBase> createState() => _CalendarBaseState();
}

class _CalendarBaseState extends State<CalendarBase> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      today = focusedDay;
      //print('Today ${today}');
      widget.onDaySelected(focusedDay);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.h,
      width: double.maxFinite,
      padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.w),
      child: SingleChildScrollView(
        child: TableCalendar(
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: context.resources.color.brandColor_02,
                  fontWeight: FontWeight.w500,
                ),
            leftChevronMargin: EdgeInsets.symmetric(horizontal: 23.w),
            rightChevronMargin: EdgeInsets.symmetric(horizontal: 23.w),
            leftChevronIcon: ImageBaseWidget(
              imageType: ImageTypeEnum.svgPicture,
              imageUrl: context.resources.drawable.iconLeftCaretForward,
            ),
            rightChevronIcon: ImageBaseWidget(
              imageType: ImageTypeEnum.svgPicture,
              imageUrl: context.resources.drawable.iconRightCaretForward,
            ),
          ),
          availableGestures: AvailableGestures.all,
          calendarStyle: CalendarStyle(
            selectedTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: context.resources.color.brandColor_11,
                ),
            selectedDecoration: BoxDecoration(
              color: context.resources.color.brandColor_02,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: context.resources.color.brandColor_02,
              ),
              shape: BoxShape.circle,
            ),
            todayTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: context.resources.color.textColor,
                ),
            defaultTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: context.resources.color.textColor,
                ),
            disabledTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: context.resources.color.textColor_01,
                ),
          ),
          focusedDay: today,
          rowHeight: 36.h,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          selectedDayPredicate: (day) => isSameDay(day, today),
          onDaySelected: _onDaySelected,
        ),
      ),
    );
  }
}

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';

showDialogBase(BuildContext context) {
  return showCalendarDatePicker2Dialog(
    context: context,
    config: CalendarDatePicker2WithActionButtonsConfig(
      selectedDayTextStyle: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: context.resources.color.brandColor_11),
      selectedDayHighlightColor: context.resources.color.brandColor_02,
    ),
    dialogSize: Size(315.w, 289.h),
    value: [DateTime.now()],
    borderRadius: BorderRadius.circular(15),
  );
}

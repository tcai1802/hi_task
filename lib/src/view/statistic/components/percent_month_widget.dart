import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentMonthWidget extends StatelessWidget {
  const PercentMonthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'January',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(height: 10.h),
        CircularPercentIndicator(
          radius: 40.w,
          lineWidth: 9.h,
          animation: true,
          percent: 90 / 100,
          reverse: true,
          center: Text(90.toString() + "%",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  )),
          backgroundColor: const Color(0xFFE8E8E8),
          circularStrokeCap: CircularStrokeCap.square,
          progressColor: context.resources.color.brandColor_02,
        ),
      ],
    );
  }
}

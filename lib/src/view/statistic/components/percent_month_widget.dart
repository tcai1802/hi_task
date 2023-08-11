import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/blocs/statistic/statistic_bloc.dart';
import 'package:hi_task/src/utils/datetime_format.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentMonthWidget extends StatelessWidget {
  const PercentMonthWidget({
    super.key,
    required this.indexMoth,
  });
  final int indexMoth;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StatisticBloc, StatisticState>(
      listener: (context, state) {},
      builder: (context, state) {
        final data = context.read<StatisticBloc>().handleGetTotalTaskInMonth(month: indexMoth + 1);
        return Column(
          children: [
            Text(
              DateTimeFormat().monthTimeList[indexMoth],
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(height: 10.h),
            CircularPercentIndicator(
              radius: 40.w,
              lineWidth: 9.h,
              animation: true,
              percent: (data.isEmpty ? 1 : data.where((element) => !element.isCompleted!).toList().length / data.length)
                  .toDouble(),
              reverse: true,
              center: Text(
                "${data.isEmpty ? "100" : (data.where((element) => !element.isCompleted!).toList().length / data.length * 100).toStringAsFixed(1)} %",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              backgroundColor: const Color(0xFFE8E8E8),
              circularStrokeCap: CircularStrokeCap.square,
              progressColor: context.resources.color.brandColor_02,
            ),
          ],
        );
      },
    );
  }
}

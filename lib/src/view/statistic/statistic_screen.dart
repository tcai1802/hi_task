import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/blocs/statistic/statistic_bloc.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/utils/datetime_format.dart';
import 'package:hi_task/src/view/statistic/components/exports.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({
    super.key,
  });

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StatisticBloc>().add(InitDataEvent(DateTime.now().year));
  }

  @override
  Widget build(BuildContext context) {
    return AppBarWithBodyBase(
      title: "Statistic",
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
        child: BlocConsumer<StatisticBloc, StatisticState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<StatisticBloc>().add(InitDataEvent(state.currentYear! - 1));
                            },
                            child: ImageBaseWidget(
                              imageType: ImageTypeEnum.svgPicture,
                              imageUrl: context.resources.drawable.iconLeftCaretForward,
                              imageWidth: 24.h,
                              imageHeight: 24.h,
                              imgColor: context.resources.color.textColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35.w),
                            child: Text(
                              state.currentYear.toString(),
                              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => context.read<StatisticBloc>().add(InitDataEvent(state.currentYear! + 1)),
                            child: ImageBaseWidget(
                              imageType: ImageTypeEnum.svgPicture,
                              imageUrl: context.resources.drawable.iconRightCaretForward,
                              imageWidth: 24.h,
                              imageHeight: 24.h,
                              imgColor: context.resources.color.textColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 37.h),
                      Row(
                        children: [
                          TotalAnalysisWidget(
                            title: "Total task",
                            totalNumber: state.taskModelList.length,
                          ),
                          SizedBox(width: 25.w),
                          TotalAnalysisWidget(
                            title: "Completed Tasks",
                            totalNumber:
                                state.taskModelList.where((element) => element.isCompleted ?? false).toList().length,
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return PercentMonthWidget(
                        indexMoth: index,
                      );
                    },
                    childCount: DateTimeFormat().monthTimeList.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

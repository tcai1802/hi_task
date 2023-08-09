import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/image_base.dart';
import 'package:hi_task/src/blocs/home/home_bloc.dart';
import 'package:hi_task/src/res/arguments/arguments.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/res/routes/app_routes.dart';
import 'package:hi_task/src/view/home/components/exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    //print("Init state");
    if (context.read<HomeBloc>().state.firstInit) {
      context.read<HomeBloc>().add(const HomeInitEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    //print("=====");
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 27.h, horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  "Saturday, Feb 20 2022",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: context.resources.color.subHeaderColor,
                      ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => {
                    context.read<HomeBloc>().add(const HomeInitEvent())
                    //Navigator.pushNamed(context, AppRoutes().notifyRoute)
                  },
                  child: ImageBaseWidget(
                    imageType: ImageTypeEnum.svgPicture,
                    imageUrl: context.resources.drawable.iconNotification,
                    imageWidth: 24.w,
                  ),
                )
              ],
            ),
            SizedBox(height: 30.h),
            Text(
              "Welcome Phillip",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              "Have a nice day !",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: context.resources.color.subHeaderColor),
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Text(
                  "My Priority Task",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w700),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: 10.h),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.priorityTaskStatus == PriorityTaskStatusEnum.loading) {
                  return SizedBox(
                    height: 188.h,
                    child: Center(
                      child: Text(
                        "Loading data...",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                  );
                }
                return state.priorityTaskList != null && state.priorityTaskList!.isNotEmpty
                    ? SizedBox(
                        height: 188.h,
                        child: ListView.builder(
                          itemCount: state.priorityTaskList?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return HomePriorityTaskCard(
                              onTap: () {
                                Navigator.of(context).pushNamed(AppRoutes().taskDetailsRoute,
                                    arguments: TaskDetailsArguments(
                                      state.priorityTaskList![index],
                                    ));
                              },
                              taskModel: state.priorityTaskList![index],
                            );
                          },
                        ),
                      )
                    : SizedBox(
                        height: 188.h,
                        child: Center(
                          child: Text(
                            "You have no task",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                        ),
                      );
              },
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                Text(
                  "Daily Task",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w700),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.dailyTaskStatus == DailyTaskStatusEnum.loading) {
                    return Center(
                      child: Text(
                        "Loading data...",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    );
                  }
                  return state.dailyTaskList != null && state.dailyTaskList!.isNotEmpty
                      ? ListView.builder(
                          itemCount: state.dailyTaskList!.length,
                          itemBuilder: (context, index) {
                            return TaskCheckBox(
                              data: state.dailyTaskList![index],
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            "You have no daily task",
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: Colors.black,
                                ),
                          ),
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

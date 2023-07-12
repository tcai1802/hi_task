import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CalendarPriorityScreen extends StatefulWidget {
  const CalendarPriorityScreen({super.key});

  @override
  State<CalendarPriorityScreen> createState() => _CalendarPriorityScreenState();
}

class _CalendarPriorityScreenState extends State<CalendarPriorityScreen> {
  final ItemScrollController itemScrollController = ItemScrollController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
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
                Text(
                  "Feb, 2022",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const Spacer(),
                CustomButtonBase(
                  prefixWidget: Icon(
                    Icons.add,
                    color: context.resources.color.brandColor_11,
                  ),
                  titleBtn: "Add task",
                  paddingBtn: EdgeInsets.all(10.h),
                ),
              ],
            ),
          ),
          Container(
            //height: 64.w,
            constraints: new BoxConstraints(
              minHeight: 56.w,
              maxHeight: 64.w,
            ),
            child: ScrollablePositionedList.builder(
              itemScrollController: itemScrollController,
              itemCount: 200,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  itemScrollController.jumpTo(index: 40 - 2);
                  if (mounted) {
                    setState(() {
                      currentIndex = 40;
                    });
                  }
                },
                child: Center(
                  child: AnimatedContainer(
                    margin: EdgeInsets.only(right: 10.w),
                    height: index == currentIndex ? 64.w : 56.w,
                    width: index == currentIndex ? 64.w : 56.w,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? context.resources.color.brandColor_02
                          : Color(0xFFEBF2FF),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Mon",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: index == currentIndex
                                        ? context.resources.color.brandColor_10
                                        : context.resources.color.brandColor_02,
                                  ),
                        ),
                        Text(
                          "${index}",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: index == currentIndex
                                        ? context.resources.color.brandColor_10
                                        : context.resources.color.brandColor_02,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

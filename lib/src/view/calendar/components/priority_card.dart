import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';

class PriorityCard extends StatelessWidget {
  const PriorityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 138.h,
      margin: EdgeInsets.only(top: 20.h),
      decoration: BoxDecoration(
        color: context.resources.color.bgColor,
        border: Border.all(
          color: const Color(0xFFABCEF5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 68.h,
              width: 2.w,
              decoration: BoxDecoration(
                  color: context.resources.color.brandColor_02,
                  borderRadius: BorderRadius.circular(10.r)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 25.h,
              right: 20.h,
              top: 10.h,
              bottom: 10.h,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "UI Design",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: context.resources.color.brandColor_02,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.more_horiz_rounded,
                      size: 24.h,
                      color: context.resources.color.brandColor_02,
                    )
                  ],
                ),
                Expanded(
                  child: Text(
                    "User interface (UI) design is the process designers use to build interfaces in software or computerized devices, focusing on looks or style. Designers aim to create interfaces which users find easy to use and pleasurable. UI design refers to graphical user interfaces and other forms e.g., voice-controlled interfaces.",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: context.resources.color.textColor,
                        ),
                  ),
                ),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      "Feb, 21 - Mar, 22",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(0xFF0668E5),
                          ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

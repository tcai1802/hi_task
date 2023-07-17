import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/custom_button_base.dart';

class SettingNotificationList extends StatelessWidget {
  const SettingNotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 15.w),
            child: Row(
              children: [
                Text(
                  "Notification Tone",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: context.resources.color.brandColor_02,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const Spacer(),
                CustomButtonBase(
                  bgColorBtn: context.resources.color.brandColor_02,
                  prefixWidget: Icon(
                    Icons.close,
                    size: 20.h,
                    color: context.resources.color.brandColor_11,
                  ),
                  paddingBtn: EdgeInsets.all(6.h),
                  onTap: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: index == 2
                        ? const Color(0xFFF1F7FE)
                        : context.resources.color.bgColor,
                  ),
                  child: Text(
                    "Silent ",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: context.resources.color.textColor_01,
                        ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}

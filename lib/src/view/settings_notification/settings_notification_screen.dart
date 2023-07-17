import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/view/settings_notification/components/exports.dart';
import 'package:hi_task/src/view/settings_notification/setting_notification_list.dart';

class SettingsNotificationScreen extends StatelessWidget {
  const SettingsNotificationScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBarWithBodyBase(
      title: "Notification",
      primaryColor: context.resources.color.brandColor_11,
      backgroundColor: context.resources.color.brandColor_02,
      bgAppBarColor: context.resources.color.brandColor_02,
      bodyWidget: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 30.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          color: context.resources.color.bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r),
            topRight: Radius.circular(50.r),
          ),
        ),
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
                child: Column(
              children: [
                SizedBox(height: 61.h),
                SettingNotifyItem(
                  title: "Notification Tone",
                  content: "Silent",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingNotificationList(),
                        ));
                  },
                ),
                SettingNotifyItem(
                  title: "Vibrate",
                  content: "Off",
                  isEnableToggle: true,
                  onTap: () {},
                ),
                SettingNotifyItem(
                  title: "Use High Priority Notification",
                  content:
                      "Show previews of notification at the top of the screen",
                  isEnableToggle: true,
                  onTap: () {},
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

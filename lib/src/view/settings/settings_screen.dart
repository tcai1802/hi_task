import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/view/settings/components/exports.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBarWithBodyBase(
      title: "Settings",
      primaryColor: context.resources.color.brandColor_11,
      backgroundColor: context.resources.color.brandColor_02,
      bgAppBarColor: context.resources.color.brandColor_02,
      bodyWidget: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 30.h),
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
                SettingOption(
                  iconUrl: context.resources.drawable.iconNotification,
                  title: "Notification",
                ),
                SettingOption(
                  iconUrl: context.resources.drawable.iconLockClosed,
                  title: "Security",
                ),
                SettingOption(
                  iconUrl: context.resources.drawable.iconHelp,
                  title: "Help",
                ),
                SettingOption(
                  iconUrl: context.resources.drawable.iconSync,
                  title: "Update System",
                ),
                SettingOption(
                  iconUrl: context.resources.drawable.iconInformation,
                  title: "About",
                ),
                SettingOption(
                  iconUrl: context.resources.drawable.iconPeople,
                  title: "Invite a friend",
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}

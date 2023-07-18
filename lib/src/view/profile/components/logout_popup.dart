import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/base_widgets/show_dialog_base.dart';

showLogoutPopup(BuildContext context) {
  return showDialogBase(
    context,
    Container(
      padding: EdgeInsets.symmetric(
        vertical: 37.h,
        horizontal: 22.w,
      ),
      child: Column(
        children: [
          SizedBox(height: 18.h),
          Text(
            "Logout of Hi task?",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: context.resources.color.brandColor_02,
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(height: 18.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Remember my login info",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: context.resources.color.subHeaderColor,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(height: 20.h),
          CustomButtonBase(
            titleBtn: "Logout",
            widthBtn: double.infinity,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 10.h),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Center(
                child: Text(
                  "Cancel",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

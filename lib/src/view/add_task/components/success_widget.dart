import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';

successWidget(BuildContext context, {String content = ""}) {
  return showDialogBase(
    context,
    Container(
      padding: EdgeInsets.symmetric(
        vertical: 37.h,
        horizontal: 22.w,
      ),
      height: 227.h,
      child: Column(
        children: [
          const Spacer(),
          Text(
            content,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: context.resources.color.brandColor_02,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const Spacer(),
          SizedBox(height: 15.h),
          CustomButtonBase(
            titleBtn: "Back",
            widthBtn: double.infinity,
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    ),
  );
}

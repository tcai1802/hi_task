import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/base_widgets/export.dart';

menuOptionDialog(
  BuildContext context, {
  required Function onEditTodo,
  required Function onDeleteTodo,
}) {
  return showDialogBase(
    context,
    Container(
      padding: EdgeInsets.symmetric(
        vertical: 37.h,
        horizontal: 22.w,
      ),
      child: Column(
        children: [
          SizedBox(height: 25.h),
          CustomButtonBase(
            titleBtn: "Edit Task",
            widthBtn: double.infinity,
            onTap: () {
              onEditTodo();
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 15.h),
          CustomButtonBase(
            titleBtn: "Delete Task",
            widthBtn: double.infinity,
            onTap: () {
              onDeleteTodo();
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 15.h),
          CustomButtonBase(
            titleBtn: "Cancel",
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

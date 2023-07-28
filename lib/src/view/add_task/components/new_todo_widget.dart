import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/base_widgets/export.dart';

newTodoWidget(
  BuildContext context, {
  Function? onAddTodo,
}) {
  final TextEditingController inputController = TextEditingController();
  return showDialogBase(
    context,
    Container(
      padding: EdgeInsets.symmetric(
        vertical: 37.h,
        horizontal: 22.w,
      ),
      child: Column(
        children: [
          TextFieldBase(
            controller: inputController,
            hintText: "Type somethings...",
          ),
          SizedBox(height: 25.h),
          SizedBox(height: 15.h),
          CustomButtonBase(
            titleBtn: "Add Task",
            widthBtn: double.infinity,
            onTap: () {
              String text = inputController.text.trim();
              if (text.isNotEmpty) {
                onAddTodo != null ? onAddTodo(text) : () {};
                Navigator.pop(context);
              }
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

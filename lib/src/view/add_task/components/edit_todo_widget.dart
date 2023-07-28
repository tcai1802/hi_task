import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/models/model_exports.dart';

editTodoWidget(
  BuildContext context, {
  required TodoModel currentModel,
  required Function onEditTodo,
  required Function onDeleteTodo,
}) {
  final TextEditingController controller = TextEditingController(
    text: currentModel.content,
  );
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
            controller: controller,
            hintText: "Hello",
          ),
          SizedBox(height: 25.h),
          CustomButtonBase(
            titleBtn: "Edit Task",
            widthBtn: double.infinity,
            onTap: () {
              final content = controller.text.trim();
              if (content.isNotEmpty) {
                onEditTodo(content);
                Navigator.pop(context);
              }
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

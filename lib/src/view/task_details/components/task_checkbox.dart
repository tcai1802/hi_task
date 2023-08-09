import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/custom_button_base.dart';
import 'package:hi_task/src/models/model_exports.dart';

class PriorityTaskCheckBox extends StatefulWidget {
  const PriorityTaskCheckBox({
    super.key,
    required this.todoModel,
    required this.onTap,
  });
  final TodoModel todoModel;
  final Function(bool value) onTap;
  @override
  State<PriorityTaskCheckBox> createState() => _TaskCheckBoxState();
}

class _TaskCheckBoxState extends State<PriorityTaskCheckBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: CustomButtonBase(
        titleBtn: widget.todoModel.content,
        paddingBtn: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 15.w,
        ),
        widthBtn: double.infinity,
        bgColorBtn: context.resources.color.brandColor_11,
        titleStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: widget.todoModel.isCompleted ? context.resources.color.brandColor_02 : const Color(0xFF4A4646),
              fontWeight: FontWeight.w500,
            ),
        textAlign: TextAlign.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        borderStyle: Border.all(
          color: context.resources.color.brandColor_02.withOpacity(.1),
        ),
        suffixWidget: Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 22.h,
                    width: 22.h,
                    decoration: BoxDecoration(
                      color: context.resources.color.bgColor,
                      border: Border.all(
                        color: context.resources.color.brandColor_02,
                      ),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
                  AnimatedContainer(
                    height: widget.todoModel.isCompleted ? 16.h : 0.h,
                    width: widget.todoModel.isCompleted ? 16.h : 0.h,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.bounceOut,
                    decoration: BoxDecoration(
                      color: context.resources.color.brandColor_02,
                      border: Border.all(
                        color: context.resources.color.brandColor_02,
                      ),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        onTap: () {
          widget.onTap(!widget.todoModel.isCompleted);
          //if (mounted) {
          //  setState(() {
          //    isCheck = !isCheck;
          //  });
          //}
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/custom_button_base.dart';
import 'package:hi_task/src/cubit/checkbox/checkbox_cubit.dart';
import 'package:hi_task/src/cubit/checkbox/checkbox_state.dart';

class TaskCheckBox extends StatefulWidget {
  const TaskCheckBox({
    super.key,
  });

  @override
  State<TaskCheckBox> createState() => _TaskCheckBoxState();
}

class _TaskCheckBoxState extends State<TaskCheckBox> {
  bool isCheck = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: CustomButtonBase(
        titleBtn: "Daily meeting",
        paddingBtn: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 15.w,
        ),
        bgColorBtn: context.resources.color.brandColor_11,
        titleStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: isCheck
                  ? context.resources.color.brandColor_02
                  : const Color(0xFF4A4646),
              fontWeight: FontWeight.w500,
            ),
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
                    height: isCheck ? 16.h : 0.h,
                    width: isCheck ? 16.h : 0.h,
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
          if (mounted) {
            setState(() {
              isCheck = !isCheck;
            });
          }
        },
      ),
    );
  }
}

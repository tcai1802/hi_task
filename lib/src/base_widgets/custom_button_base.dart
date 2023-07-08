import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';

class CustomButtonBase extends StatelessWidget {
  const CustomButtonBase({
    super.key,
    this.titleBtn,
    this.paddingBtn,
    this.prefixWidget,
    this.suffixWidget,
    this.onTap,
    this.widthBtn,
    this.borderStyle,
    this.bgColorBtn,
  });
  final String? titleBtn;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final EdgeInsets? paddingBtn;
  final Function? onTap;
  final double? widthBtn;
  final BoxBorder? borderStyle;
  final Color? bgColorBtn;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap != null ? onTap!() : () {},
      child: Container(
        width: widthBtn,
        decoration: BoxDecoration(
          color: bgColorBtn ?? context.resources.color.brandColor_02,
          borderRadius: BorderRadius.circular(10.r),
          border: borderStyle,
        ),
        padding: paddingBtn ??
            EdgeInsets.symmetric(
              vertical: 14.h,
              horizontal: 45.w,
            ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixWidget ?? Container(),
            titleBtn != null
                ? Text(
                    titleBtn!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: context.resources.color.brandColor_11),
                  )
                : Container(),
            suffixWidget ?? Container()
          ],
        ),
      ),
    );
  }
}

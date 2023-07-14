import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/custom_button_base.dart';

class AppBarWithBodyBase extends StatelessWidget {
  const AppBarWithBodyBase({
    super.key,
    this.title = "",
    this.bodyWidget,
    this.bgAppBarColor,
    this.enableBorder = false,
    this.backgroundColor,
    this.primaryColor,
  });
  final String title;
  final Widget? bodyWidget;
  final Color? bgAppBarColor;
  final bool enableBorder;
  final Color? backgroundColor;
  final Color? primaryColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? context.resources.color.bgColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 15.h),
                  decoration: BoxDecoration(
                    color: bgAppBarColor ?? context.resources.color.bgColor,
                    border: enableBorder
                        ? Border(
                            bottom: BorderSide(
                              color: context.resources.color.brandColor_02,
                            ),
                          )
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButtonBase(
                        bgColorBtn: primaryColor,
                        prefixWidget: Icon(
                          Icons.arrow_back,
                          size: 24.h,
                          color: backgroundColor ??
                              context.resources.color.brandColor_11,
                        ),
                        paddingBtn: EdgeInsets.all(10.h),
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox()
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: primaryColor ??
                              context.resources.color.brandColor_02,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
            Expanded(child: bodyWidget ?? Container())
          ],
        ),
      ),
    );
  }
}

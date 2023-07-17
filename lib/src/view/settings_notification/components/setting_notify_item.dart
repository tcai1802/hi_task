import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';

class SettingNotifyItem extends StatefulWidget {
  const SettingNotifyItem(
      {super.key,
      this.title = "",
      this.content = "",
      this.isEnableToggle,
      this.onTap});
  final String title;
  final String content;
  final bool? isEnableToggle;
  final Function? onTap;
  @override
  State<SettingNotifyItem> createState() => _SettingNotifyItemState();
}

class _SettingNotifyItemState extends State<SettingNotifyItem> {
  bool enableToggle = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap != null ? widget.onTap!() : (){},
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 25.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: context.resources.color.brandColor_02,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    widget.content,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: context.resources.color.textColor,
                        ),
                  ),
                ],
              ),
            ),
            widget.isEnableToggle != null
                ? SizedBox(
                    height: 30.w,
                    //width: 80.h,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Switch(
                        value: enableToggle,
                        onChanged: (value) {
                          setState(() {
                            enableToggle = value;
                          });
                        },
                        activeColor: context.resources.color.brandColor_02,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

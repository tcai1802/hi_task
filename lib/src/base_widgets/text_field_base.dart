import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

class TextFieldBase extends StatelessWidget {
  const TextFieldBase({
    super.key,
    this.iconUrl,
    this.hintText = "",
    this.isPass = false,
    this.controller,
    this.maxLines,
    this.onChange,
    this.errorText,
  });
  final String? iconUrl;
  final String hintText;
  final bool isPass;
  final TextEditingController? controller;
  final int? maxLines;
  final Function(String value)? onChange;
  final String? errorText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 1,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: context.resources.color.textColor_01,
          ),
      obscureText: isPass,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        prefixIcon: iconUrl != null
            ? Container(
                padding: EdgeInsets.all(15.w),
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: context.resources.color.brandColor_02,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r),
                  ),
                ),
                child: ImageBaseWidget(
                  imageType: ImageTypeEnum.svgPicture,
                  imageUrl: iconUrl!,
                  imageWidth: 15.w,
                  boxFit: BoxFit.contain,
                ),
              )
            : null,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: const Color(0xFF9A9A9A),
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.resources.color.brandColor_02.withOpacity(.1),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: context.resources.color.brandColor_02.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10.r),
        ),
        errorText:
            errorText != null && errorText!.isNotEmpty ? errorText : null,
      ),
      onChanged: (value) => onChange != null ? onChange!(value) : () {},
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/res/routes/app_routes.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CustomButtonBase(
                    prefixWidget: Icon(
                      Icons.arrow_back,
                      size: 24.sp,
                      color: context.resources.color.brandColor_11,
                    ),
                    paddingBtn: EdgeInsets.all(12.h),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
                //const Spacer(),
                SizedBox(height: 10.h),

                ImageBaseWidget(
                  imageType: ImageTypeEnum.svgPicture,
                  imageUrl: context.resources.drawable.imgLogo,
                ),
                SizedBox(height: 10.h),
                Text(
                  "Management  App",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: context.resources.color.textColor_02),
                ),
                SizedBox(height: 40.h),
                Text(
                  "Verify Account",
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
                SizedBox(height: 30.h),
                ImageBaseWidget(
                  imageType: ImageTypeEnum.assetFile,
                  imageUrl: context.resources.drawable.imgVerifyAccount,
                  imageWidth: 216.w,
                ),
                SizedBox(height: 35.h),
                Text(
                  "Please enter the verification number \n we send to your email",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color(0xFF4A4646),
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _textField(context, first: true, last: false),
                    _textField(context, first: false, last: false),
                    _textField(context, first: false, last: false),
                    _textField(context, first: false, last: true),
                  ],
                ),
                SizedBox(height: 25.h),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      const TextSpan(text: "Don’t receive a code? "),
                      TextSpan(
                        text: "Resend",
                        recognizer: TapGestureRecognizer()..onTap = () => {},
                        style: TextStyle(
                          color: context.resources.color.brandColor_02,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 61.h),

                CustomButtonBase(
                  titleBtn: 'Confirm',
                  widthBtn: double.infinity,
                  onTap: () => Navigator.pushNamed(
                      context, AppRoutes().successVerifyRoute),
                ),
                SizedBox(height: 35.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField(
    BuildContext context, {
    bool first = false,
    bool last = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: 50.w,
      child: TextField(
        autofocus: true,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.bold,
              color: context.resources.color.brandColor_02,
            ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: context.resources.color.brandColor_02,
              width: 3,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: context.resources.color.brandColor_02,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}

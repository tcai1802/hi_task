import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/res/regex/app_regex.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
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
                SizedBox(height: 10.h),
                ImageBaseWidget(
                  imageType: ImageTypeEnum.svgPicture,
                  imageUrl: context.resources.drawable.imgLogo,
                ),
                SizedBox(height: 10.h),
                Text(
                  "Management  App",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(color: context.resources.color.textColor_02),
                ),
                SizedBox(height: 40.h),
                Text(
                  "Send email to reset your password",
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
                ImageBaseWidget(
                  imageType: ImageTypeEnum.assetFile,
                  imageUrl: context.resources.drawable.imgSuccessVerify,
                  //imageHeight: 150.h,
                  imageWidth: 216.w,
                ),
                SizedBox(height: 30.h),
                TextFieldBase(
                  hintText: 'Email',
                  controller: emailController,
                  //iconUrl: context.resources.drawable.iconPerson,
                  onChange: (String value) {
                    //context.read<RegisterBloc>().add(OnChangedUserNameEvent(value));
                  },
                ),
                SizedBox(height: 70.h),
                CustomButtonBase(
                  titleBtn: 'Send email',
                  widthBtn: double.infinity,
                  onTap: () {
                    RegExp emailRegex = RegExp(AppRegex().emailRegex);
                    if (emailRegex.hasMatch(emailController.text.trim())) {
                      FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim()).then((value) {
                        EasyLoading.showSuccess("Sended");
                        Navigator.pop(context);
                      });
                    } else {
                      EasyLoading.showError("error");
                    }
                  },
                ),
                SizedBox(height: 35.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

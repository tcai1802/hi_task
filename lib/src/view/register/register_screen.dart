import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/res/routes/app_routes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              const Spacer(),
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
              const Spacer(),
              Text(
                "Create your account",
                style: Theme.of(context).textTheme.bodyLarge!,
              ),
              SizedBox(height: 30.h),
              TextFieldBase(
                hintText: 'Username',
                controller: TextEditingController(),
                iconUrl: context.resources.drawable.iconPerson,
              ),
              SizedBox(height: 20.h),
              TextFieldBase(
                hintText: 'Email',
                controller: TextEditingController(),
                iconUrl: context.resources.drawable.iconEmail,
                isPass: true,
              ),
              SizedBox(height: 20.h),
              TextFieldBase(
                hintText: 'Password',
                controller: TextEditingController(),
                iconUrl: context.resources.drawable.iconLock,
                isPass: true,
              ),
              SizedBox(height: 20.h),
              TextFieldBase(
                hintText: 'Confirm password',
                controller: TextEditingController(),
                iconUrl: context.resources.drawable.iconLock,
                isPass: true,
              ),
              SizedBox(height: 25.h),
              CustomButtonBase(
                titleBtn: 'Register',
                widthBtn: double.infinity,
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes().verifyAccountRoute);
                },
              ),
              SizedBox(height: 35.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2,
                      width: 10.w,
                      color: context.resources.color.brandColor_02,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.h),
                      child: Text(
                        "Or Login with",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Container(
                      height: 2,
                      width: 10.w,
                      color: context.resources.color.brandColor_02,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonBase(
                    prefixWidget: ImageBaseWidget(
                      imageType: ImageTypeEnum.svgPicture,
                      imageWidth: 30.h,
                      imageHeight: 30.h,
                      imageUrl: context.resources.drawable.iconGoogle,
                    ),
                    paddingBtn: EdgeInsets.all(15.h),
                    bgColorBtn: Colors.transparent,
                    borderStyle: Border.all(
                      color:
                          context.resources.color.brandColor_02.withOpacity(.1),
                    ),
                  ),
                  SizedBox(width: 40.w),
                  CustomButtonBase(
                    prefixWidget: ImageBaseWidget(
                      imageType: ImageTypeEnum.svgPicture,
                      imageWidth: 30.h,
                      imageHeight: 30.h,
                      imageUrl: context.resources.drawable.iconFacebook,
                    ),
                    paddingBtn: EdgeInsets.all(15.h),
                    bgColorBtn: Colors.transparent,
                    borderStyle: Border.all(
                      color:
                          context.resources.color.brandColor_02.withOpacity(.1),
                    ),
                  ),
                  SizedBox(width: 40.w),
                  CustomButtonBase(
                    prefixWidget: ImageBaseWidget(
                      imageWidth: 30.h,
                      imageHeight: 30.h,
                      imageType: ImageTypeEnum.svgPicture,
                      imageUrl: context.resources.drawable.iconGithub,
                    ),
                    paddingBtn: EdgeInsets.all(15.h),
                    bgColorBtn: Colors.transparent,
                    borderStyle: Border.all(
                      color:
                          context.resources.color.brandColor_02.withOpacity(.1),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

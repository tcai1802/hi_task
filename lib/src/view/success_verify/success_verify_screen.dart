import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/res/routes/app_routes.dart';

class SuccessVerifyScreen extends StatelessWidget {
  const SuccessVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  imageUrl: context.resources.drawable.imgSuccessVerify,
                  //imageHeight: 150.h,
                  imageWidth: 216.w,
                ),
                SizedBox(height: 35.h),
                Text(
                  "Your Account has been \n Verified Successfully!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color(0xFF4A4646),
                        fontWeight: FontWeight.w500,
                      ),
                ),

                SizedBox(height: 70.h),

                CustomButtonBase(
                  titleBtn: 'Go to Dashboard',
                  widthBtn: double.infinity,
                  onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes().dashBoardRoute, (route) => false),
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

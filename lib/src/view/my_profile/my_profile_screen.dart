import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/show_dialog_base.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBarWithBodyBase(
      title: "My profile",
      primaryColor: context.resources.color.brandColor_11,
      backgroundColor: context.resources.color.brandColor_02,
      bgAppBarColor: context.resources.color.brandColor_02,
      bodyWidget: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 30.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        decoration: BoxDecoration(
          color: context.resources.color.bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r),
            topRight: Radius.circular(50.r),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatarWidget(
                        size: 84.h,
                        imageUrl:
                            "https://gravatar.com/avatar/bb30407e0ad54828be5bc05a515e4b32?s=400&d=robohash&r=x",
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: ImageBaseWidget(
                          imageType: ImageTypeEnum.svgPicture,
                          imageUrl: context.resources.drawable.iconEdit,
                          imageWidth: 24.h,
                          imageHeight: 24.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                "Name",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: context.resources.color.brandColor_02,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(height: 5.h),
              TextFieldBase(
                hintText: 'Username',
                controller: TextEditingController(),
              ),
              SizedBox(height: 30.h),
              Text(
                "Profession",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: context.resources.color.brandColor_02,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(height: 5.h),
              TextFieldBase(
                hintText: 'Profession',
                controller: TextEditingController(),
              ),
              SizedBox(height: 25.h),
              Text(
                "Date of Birth",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: context.resources.color.brandColor_02,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              CustomButtonBase(
                widthBtn: double.infinity,
                prefixWidget: Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: Icon(
                    Icons.calendar_today_rounded,
                    size: 24.h,
                    color: context.resources.color.brandColor_02,
                  ),
                ),
                bgColorBtn: context.resources.color.bgColor,
                titleBtn: "Feb-21-2022",
                paddingBtn:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.h),
                borderStyle: Border.all(
                  color: context.resources.color.brandColor_02.withOpacity(.1),
                ),
                mainAxisAlignment: MainAxisAlignment.start,
                onTap: () => {
                  showDialogBase(context,  CalendarBase(
                    onDaySelected: (DateTime timeSelected) {
                      
                    },
                  )),
                },
                titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: context.resources.color.textColor,
                    ),
              ),
              SizedBox(height: 25.h),
              Text(
                "Email",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: context.resources.color.brandColor_02,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(height: 5.h),
              TextFieldBase(
                hintText: 'Username',
                controller: TextEditingController(),
              ),
              SizedBox(height: 40.h),
              CustomButtonBase(
                titleBtn: 'Save',
                widthBtn: double.infinity,
                paddingBtn:
                    EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
                onTap: () {},
                titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: context.resources.color.brandColor_11,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

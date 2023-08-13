import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/blocs/settings_security/settings_security_bloc.dart';

class SettingsSecurityScreen extends StatefulWidget {
  const SettingsSecurityScreen({
    super.key,
  });

  @override
  State<SettingsSecurityScreen> createState() => _SettingsSecurityScreenState();
}

class _SettingsSecurityScreenState extends State<SettingsSecurityScreen> {
  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBarWithBodyBase(
      title: "Security",
      primaryColor: context.resources.color.brandColor_11,
      backgroundColor: context.resources.color.brandColor_02,
      bgAppBarColor: context.resources.color.brandColor_02,
      bodyWidget: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.only(top: 30.h),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          color: context.resources.color.bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r),
            topRight: Radius.circular(50.r),
          ),
        ),
        child: BlocConsumer<SettingsSecurityBloc, SettingsSecurityState>(
          listener: (context, state) {
            switch (state.status) {
              case SettingsSecurityStatus.loading:
                EasyLoading.show(status: "Loading...");
                break;
              case SettingsSecurityStatus.init:
                break;
              case SettingsSecurityStatus.success:
                EasyLoading.showSuccess(state.message ?? "");
                //Future.delayed(
                //  const Duration(seconds: 1),
                //  () {
                //    Navigator.of(context).pop();
                //  },
                //);
                break;
              case SettingsSecurityStatus.failed:
                EasyLoading.showError(state.message ?? "");
            }
          },
          builder: (context, state) {
            return CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 61.h),
                      Text(
                        "Password",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: context.resources.color.brandColor_02,
                            ),
                      ),
                      SizedBox(height: 10.h),
                      TextFieldBase(
                        hintText: 'Password',
                        controller: currentPassController,
                        iconUrl: context.resources.drawable.iconLock,
                        isPass: true,
                        errorText: state.currentPassErr,
                        onChange: (value) {
                          context.read<SettingsSecurityBloc>().add(OnChangeCurrentPassword(
                                currentPassController.text.trim(),
                              ));
                        },
                      ),
                      SizedBox(height: 20.h),
                      TextFieldBase(
                        hintText: 'New Password',
                        controller: newPassController,
                        iconUrl: context.resources.drawable.iconLock,
                        isPass: true,
                        errorText: state.newPassErr,
                        onChange: (value) {
                          context.read<SettingsSecurityBloc>().add(OnChangeNewPassword(value.trim()));
                        },
                      ),
                      SizedBox(height: 20.h),
                      TextFieldBase(
                        hintText: 'Confirm New Password',
                        controller: confirmPassController,
                        iconUrl: context.resources.drawable.iconLock,
                        isPass: true,
                        errorText: state.confirmPassErr,
                        onChange: (value) {
                          context.read<SettingsSecurityBloc>().add(OnChangeConfirmPassword(
                                newPassController.text.trim(),
                                confirmPassController.text.trim(),
                              ));
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomButtonBase(
                        widthBtn: double.infinity,
                        bgColorBtn: state.isValidForm ? null : Colors.grey[300],
                        titleBtn: "Submit",
                        onTap: () {
                          if (state.isValidForm) {
                            context.read<SettingsSecurityBloc>().add(
                                  OnSubmitChangePassword(
                                    newPassController.text.trim(),
                                    currentPassController.text.trim(),
                                  ),
                                );
                          }
                        },
                      ),
                      SizedBox(height: 25.h),
                      //Text(
                      //  "Login Activity",
                      //  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      //        fontWeight: FontWeight.w500,
                      //        color: context.resources.color.brandColor_02,
                      //      ),
                      //),
                      //SizedBox(height: 10.h),
                      //Row(
                      //  children: [
                      //    ImageBaseWidget(
                      //      imageType: ImageTypeEnum.svgPicture,
                      //      imageUrl: context.resources.drawable.iconLocation,
                      //    ),
                      //    SizedBox(width: 10.w),
                      //    Column(
                      //      crossAxisAlignment: CrossAxisAlignment.start,
                      //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //      children: [
                      //        Text(
                      //          "Malang, Indonesia",
                      //          style: Theme.of(context).textTheme.bodyMedium!,
                      //        ),
                      //        Text(
                      //          "Active Now",
                      //          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      //                color: context.resources.color.subHeaderColor,
                      //              ),
                      //        )
                      //      ],
                      //    )
                      //  ],
                      //)
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

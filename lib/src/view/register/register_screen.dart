import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/blocs/register/register_bloc.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/res/routes/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final registerBloc = RegisterBloc();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        switch (state.status) {
          case RegisterStatusEnum.loading:
            EasyLoading.show(status: "Loading...");
            break;
          case RegisterStatusEnum.success:
            EasyLoading.showToast("Đăng ký thành công");
            Future.delayed(
              const Duration(seconds: 1),
              () {
                Navigator.of(context).pushNamed(AppRoutes().verifyAccountRoute);
              },
            );
            break;
          case RegisterStatusEnum.failure:
            EasyLoading.showToast("Đăng ký thất bại: ${state.message}");
            break;
          default:
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
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
                      //const Spacer(),
                      Text(
                        "Create your account",
                        style: Theme.of(context).textTheme.bodyLarge!,
                      ),
                      SizedBox(height: 30.h),
                      TextFieldBase(
                        hintText: 'Username',
                        controller: userNameController,
                        iconUrl: context.resources.drawable.iconPerson,
                        onChange: (String value) {
                          context.read<RegisterBloc>().add(OnChangedUserNameEvent(value));
                        },
                      ),
                      SizedBox(height: 20.h),

                      TextFieldBase(
                        hintText: 'Email',
                        controller: emailController,
                        iconUrl: context.resources.drawable.iconEmail,
                        onChange: (String value) {
                          context.read<RegisterBloc>().add(OnChangedEmailEvent(value));
                        },
                        errorText: state.emailErr,
                      ),
                      SizedBox(height: 20.h),
                      BlocBuilder<RegisterBloc, RegisterState>(
                        buildWhen: (previous, current) => previous.passErr != current.passErr,
                        builder: (context, state) {
                          return TextFieldBase(
                            hintText: 'Password',
                            controller: passController,
                            iconUrl: context.resources.drawable.iconLock,
                            isPass: true,
                            onChange: (String value) {
                              context.read<RegisterBloc>().add(OnChangedPasswordEvent(value));
                            },
                            errorText: state.passErr,
                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                      TextFieldBase(
                        hintText: 'Confirm password',
                        controller: confirmPassController,
                        iconUrl: context.resources.drawable.iconLock,
                        isPass: true,
                        onChange: (String value) {
                          context.read<RegisterBloc>().add(OnChangedConfirmPassEvent(value));
                        },
                        errorText: state.confirmPassErr,
                      ),
                      SizedBox(height: 25.h),
                      CustomButtonBase(
                        titleBtn: 'Register',
                        bgColorBtn: state.isValid ? null : Colors.grey[300],
                        widthBtn: double.infinity,
                        onTap: state.isValid
                            ? () {
                                context.read<RegisterBloc>().add(const OnRegisterSubmitEvent(true));
                              }
                            : () {},
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
                            bgColorBtn: Colors.grey[300],
                            borderStyle: Border.all(
                              color: context.resources.color.brandColor_02.withOpacity(.1),
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
                            bgColorBtn: Colors.grey[300],
                            borderStyle: Border.all(
                              color: context.resources.color.brandColor_02.withOpacity(.1),
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
                            bgColorBtn: Colors.grey[300],
                            borderStyle: Border.all(
                              color: context.resources.color.brandColor_02.withOpacity(.1),
                            ),
                          ),
                        ],
                      ),
                      //const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

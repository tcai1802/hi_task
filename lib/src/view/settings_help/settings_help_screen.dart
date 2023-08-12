import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/blocs/settings_help/settings_help_bloc.dart';

class SettingsHelpScreen extends StatefulWidget {
  const SettingsHelpScreen({
    super.key,
  });

  @override
  State<SettingsHelpScreen> createState() => _SettingsHelpScreenState();
}

class _SettingsHelpScreenState extends State<SettingsHelpScreen> {
  final TextEditingController helpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBarWithBodyBase(
      title: "Help",
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
        child: BlocConsumer<SettingsHelpBloc, SettingsHelpState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state.status == SettingHelpStatus.loading) {
              EasyLoading.show(status: "Sending...");
            } else if (state.status == SettingHelpStatus.success) {
              EasyLoading.showSuccess("Sended");
              Navigator.of(context).pop();
            } else if (state.status == SettingHelpStatus.failed) {
              EasyLoading.showError("Something error. Please try later");
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
                        "Tell us how we can help",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: context.resources.color.brandColor_02,
                            ),
                      ),
                      SizedBox(height: 20.h),
                      TextFieldBase(
                        hintText: 'Type some message.......',
                        maxLines: 5,
                        controller: helpController,
                        onChange: (value) {
                          context.read<SettingsHelpBloc>().add(OnChangeHelpInputEvent(helpController.text.trim()));
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomButtonBase(
                        widthBtn: double.infinity,
                        titleBtn: "Send",
                        bgColorBtn: state.enableSubmitBtn ? null : Colors.grey[300],
                        onTap: () {
                          if (state.enableSubmitBtn) {
                            context.read<SettingsHelpBloc>().add(OnSubmitEvent(helpController.text.trim()));
                          }
                        },
                      ),
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

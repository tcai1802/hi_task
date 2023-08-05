import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/blocs/blocs_exports.dart';
import 'package:hi_task/src/models/user_model/user_model.dart';
import 'package:hi_task/src/res/enum/app_enum.dart';
import 'package:hi_task/src/utils/datetime_format.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
    required this.userModel,
  });
  final UserModel userModel;
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<EditProfileBloc>().add(EditProfileInitEvent(widget.userModel));
    userNameController.text = widget.userModel.userName ?? "";
    professionController.text = widget.userModel.profession ?? "";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileBloc, EditProfileState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<EditProfileBloc>().add(const OnChangeAvatarAssetEvent());
                        },
                        child: Stack(
                          children: [
                            state.imageAsset != null
                                ? CircleAvatarWidget(
                                    size: 84.h,
                                    imageUrl: state.imageAsset!.path,
                                    imageTypeEnum: ImageTypeEnum.file,
                                  )
                                : CircleAvatarWidget(
                                    size: 84.h,
                                    imageUrl: widget.userModel.avatarUrl ?? "",
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
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "Username",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: context.resources.color.brandColor_02,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(height: 5.h),
                  TextFieldBase(
                    hintText: 'Username',
                    controller: userNameController,
                    onChange: (String value) {
                      context.read<EditProfileBloc>().add(OnChangeUserNameEvent(value));
                    },
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
                    controller: professionController,
                    onChange: (String value) {
                      context.read<EditProfileBloc>().add(OnChangeProfessionEvent(value));
                    },
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
                    titleBtn: state.dateOfBirth != null
                        ? DateTimeFormat().convertDateTimeToString(state.dateOfBirth!, formatString: "MMMM-dd-yyyy")
                        : "--",
                    paddingBtn: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.h),
                    borderStyle: Border.all(
                      color: context.resources.color.brandColor_02.withOpacity(.1),
                    ),
                    mainAxisAlignment: MainAxisAlignment.start,
                    onTap: () => {
                      showDialogBase(context, CalendarBase(
                        onDaySelected: (DateTime timeSelected) {
                          context.read<EditProfileBloc>().add(OnChangeDateOfBirthEvent(timeSelected));
                        },
                      )),
                    },
                    titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: context.resources.color.textColor,
                        ),
                  ),
                  //SizedBox(height: 25.h),
                  //Text(
                  //  "Email",
                  //  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  //        color: context.resources.color.brandColor_02,
                  //        fontWeight: FontWeight.w500,
                  //      ),
                  //),
                  //SizedBox(height: 5.h),
                  //TextFieldBase(
                  //  hintText: 'Email',
                  //  controller: TextEditingController(),
                  //),
                  const Spacer(),
                  CustomButtonBase(
                    titleBtn: 'Save',
                    widthBtn: double.infinity,
                    bgColorBtn: state.isValid ? null : context.resources.color.textColor_03,
                    paddingBtn: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
                    onTap: state.isValid
                        ? () {
                            context.read<EditProfileBloc>().add(UpdateProfileEvent(widget.userModel));
                          }
                        : null,
                    titleStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: context.resources.color.brandColor_11,
                        ),
                  ),
                  SizedBox(height: 10.h),
                ],
              )),
        );
      },
    );
  }
}

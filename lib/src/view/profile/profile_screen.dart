import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_task/src/app_context_extension.dart';
import 'package:hi_task/src/base_widgets/export.dart';
import 'package:hi_task/src/res/routes/app_routes.dart';
import 'package:hi_task/src/view/profile/components/exports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.resources.color.bgColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                height: 140.h,
                decoration: BoxDecoration(
                  color: context.resources.color.brandColor_02,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(200.w, 30.h),
                    bottomRight: Radius.elliptical(200.w, 30.h),
                  ),
                ),
                child: Text(
                  "Profile",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: context.resources.color.brandColor_11,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Positioned(
                top: 90.h,
                right: 0,
                left: 0,
                child: Container(
                  //height: 299,
                  //color: Colors.red,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 174.h,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 15.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              offset: const Offset(0, 1),
                              spreadRadius: 2,
                              blurRadius: 4,
                            )
                          ],
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              top: -41.h,
                              right: 0,
                              left: 0,
                              child: Column(
                                children: [
                                  CircleAvatarWidget(
                                    size: 84.h,
                                    imageUrl:
                                        "https://gravatar.com/avatar/bb30407e0ad54828be5bc05a515e4b32?s=400&d=robohash&r=x",
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    "Phillip Williamson",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          color: context
                                              .resources.color.brandColor_02,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    "UI UX Designer",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          color:
                                              context.resources.color.textColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: context.resources.color
                                                  .brandColor_02,
                                              size: 14.h,
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              "Malang, Indonesia",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    color: context.resources
                                                        .color.textColor,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        height: 25.h,
                                        decoration: BoxDecoration(
                                          color: context
                                              .resources.color.brandColor_02
                                              .withOpacity(.23),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: context.resources.color
                                                  .brandColor_02,
                                              size: 14.h,
                                            ),
                                            SizedBox(width: 4.w),
                                            Text(
                                              "Malang, Indonesia",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    color: context.resources
                                                        .color.textColor,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10.h),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ProfileMenuOption(
                              iconUrl: context.resources.drawable.iconPerson,
                              title: "My profile",
                              onTap: () => Navigator.pushNamed(
                                  context, AppRoutes().myProfileRoute),
                            ),
                            ProfileMenuOption(
                              iconUrl: context.resources.drawable.iconChart,
                              title: "Statistic",
                              onTap: () => Navigator.pushNamed(
                                  context, AppRoutes().statisticRoute),
                            ),
                            ProfileMenuOption(
                              iconUrl: context.resources.drawable.iconLocation,
                              title: "Location",
                              onTap: () => Navigator.pushNamed(
                                  context, AppRoutes().locationRoute),
                            ),
                            ProfileMenuOption(
                              iconUrl: context.resources.drawable.iconSetting,
                              title: "Settings",
                              onTap: () => Navigator.pushNamed(
                                  context, AppRoutes().settingsRoute),
                            ),
                            ProfileMenuOption(
                              iconUrl: context.resources.drawable.iconLogOut,
                              title: "Logout",
                              onTap: () {},
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

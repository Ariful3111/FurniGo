import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/auth/controller/logout_controller.dart';
import 'package:zb_dezign/features/profile/controllers/profile_controller.dart';
import 'package:zb_dezign/features/profile/widgets/profile_view_widgets/profile_user_image.dart';
import 'package:zb_dezign/features/profile/widgets/profile_view_widgets/profile_user_info.dart';
import 'package:zb_dezign/features/profile/widgets/profile_view_widgets/profile_view_items.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';

class ProfileViews extends GetView<ProfileController> {
  const ProfileViews({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Obx(() {
        return controller.isLoading.value
            ? ButtonLoading()
            : ListView(
                children: [
                  CustomAppbar(
                    title: 'My Profile',
                    isIcon: false,
                    onDrawerTap: () {},
                  ),
                  SizedBox(height: 10.h),
                  ProfileUserImage(),
                  SizedBox(height: 10.h),
                  ProfileUserInfo(),
                  SizedBox(height: 20.h),
                  ProfileViewItems(),
                  SizedBox(height: 20.h),
                  Get.find<LogoutController>().isLoading.value
                      ? ButtonLoading()
                      : CustomPrimaryButton(
                          text: 'Logout',
                          onPressed: () async {
                            await Get.find<LogoutController>().logout();
                          },
                          height: 52.h,
                          fontSize: 16.sp,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                  SizedBox(height: 20.h),
                ],
              );
      }),
    );
  }
}

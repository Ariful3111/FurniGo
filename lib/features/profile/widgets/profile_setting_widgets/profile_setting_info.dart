import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/profile/controllers/profile_update_controller.dart';
import 'package:zb_dezign/features/profile/widgets/profile_setting_widgets/profile_setting_info_fields.dart';
import 'package:zb_dezign/features/profile/widgets/profile_setting_widgets/profile_settings_header.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProfileSettingInfo extends GetWidget<ProfileUpdateController> {
  const ProfileSettingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedContainer(
      padding: EdgeInsets.all(20.r),
      child: Column(
        children: [
          ProfileSettingsHeader(
            icon: IconsPath.user,
            title: 'Profile',
            subtitle: 'Your personal details',
            button: CustomSecondaryButton(
              width: 105.w,
              text: 'Edit',
              icon: IconsPath.edit,
              onPressed: () {
                controller.isEdit.value = !controller.isEdit.value;
              },
            ),
          ),
          SizedBox(height: 12.h),
          ProfileSettingInfoFields(),
        ],
      ),
    );
  }
}

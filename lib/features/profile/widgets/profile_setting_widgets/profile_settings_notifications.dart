import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/profile/controllers/profile_setting_controller.dart';
import 'package:zb_dezign/features/profile/widgets/profile_setting_widgets/profile_settings_header.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_switch_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProfileSettingsNotifications extends GetWidget<ProfileSettingController> {
  const ProfileSettingsNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      child: Column(
        children: [
          ProfileSettingsHeader(
            icon: IconsPath.notification,
            title: 'Notifications',
            subtitle: 'Manage email and push notifications',
          ),
          SizedBox(height: 20.h),
          ...List.generate(controller.notification.length, (
            index,
          ) {
            final item = controller.notification[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom:
                    controller.notification.length - 1 == index
                    ? 0
                    : 16.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomPrimaryText(
                          text: item['title'],
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.titleColor,
                        ),
                        SizedBox(height: 4.h),
                        CustomPrimaryText(
                          text: item['sub'],
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: isDark
                              ? AppColors.primaryBorderColor
                              : AppColors.secondaryTextColor,
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => CustomSwitchButton(
                      isOn: item['isOn'].value,
                      onChanged: (value) {
                        item['isOn'].value = value;
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

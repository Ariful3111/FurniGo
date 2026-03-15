import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/profile/widgets/profile_setting_widgets/profile_setting_address.dart';
import 'package:zb_dezign/features/profile/widgets/profile_setting_widgets/profile_setting_info.dart';
import 'package:zb_dezign/features/profile/widgets/profile_setting_widgets/profile_settings_notifications.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProfileSettingView extends StatelessWidget {
  const ProfileSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(
            title: 'Profile & Settings',
            onDrawerTap: () {
              Navigator.pop(context);
            },
            icon: IconsPath.back,
          ),
          SizedBox(height: 12.h),
          SharedContainer(
            padding: EdgeInsets.all(12.r),
            radius: 12.r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomPrimaryText(
                  text: 'Profile & Settings',
                  color: isDark ? AppColors.whiteColor : AppColors.titleColor,
                ),
                SizedBox(height: 4.h),
                CustomPrimaryText(
                  text:
                      'Manage your personal information, addresses, and preferences.',
                  color: isDark
                      ? AppColors.primaryBorderColor
                      : AppColors.secondaryTextColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          ProfileSettingInfo(),
          SizedBox(height: 16.h),
          ProfileSettingAddress(),
          SizedBox(height: 16.h),
          ProfileSettingsNotifications(),
        ],
      ),
    );
  }
}

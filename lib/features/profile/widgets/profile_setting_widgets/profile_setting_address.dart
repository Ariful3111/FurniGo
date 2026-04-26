import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/profile/widgets/profile_setting_widgets/add_new_address_dialog.dart';
import 'package:zb_dezign/features/profile/widgets/profile_setting_widgets/profile_setting_address_list.dart';
import 'package:zb_dezign/features/profile/widgets/profile_setting_widgets/profile_settings_header.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_dialog_animation.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProfileSettingAddress extends StatelessWidget {
  const ProfileSettingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      radius: 16.r,
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileSettingsHeader(
            icon: IconsPath.userLocation,
            title: 'Addresses',
            subtitle: 'Manage delivery and billing addresses',
          ),
          SizedBox(height: 12.h),
          CustomSecondaryButton(
            width: 140.w,
            text: 'Add Address',
            icon: IconsPath.add,
            onPressed: () {
              CustomDialogAnimation().showAnimatedDialog(
                context: context,
                dialog: AddNewAddressDialog(),
                isDark: isDark,
              );
            },
          ),
          SizedBox(height: 12.h),
          ProfileSettingAddressList(),
        ],
      ),
    );
  }
}

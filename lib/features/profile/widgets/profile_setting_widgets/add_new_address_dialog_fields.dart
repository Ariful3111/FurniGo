import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/profile/controllers/profile_setting_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AddNewAddressDialogFields extends StatelessWidget {
  const AddNewAddressDialogFields({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ProfileSettingController profileSettingController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title(text: 'Address Label', isDark: isDark),
        field(controller: profileSettingController.addressLabelController),
        SizedBox(height: 12.h),
        title(text: 'Full Name', isDark: isDark),
        field(controller: profileSettingController.dialogNameController),
        SizedBox(height: 12.h),
        title(text: 'Address', isDark: isDark),
        field(controller: profileSettingController.dialogAddressController,suffixIcon: Padding(padding: EdgeInsetsGeometry.only(right: 12.w),
        child: Image.asset(IconsPath.search,height: 20.h,width: 20.w,),
        )),
        SizedBox(height: 12.h),
      ],
    );
  }

  Widget title({required String text, required bool isDark}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: CustomPrimaryText(
        text: text,
        color: isDark ? AppColors.whiteColor : AppColors.fieldTextColorDark,
        fontSize: 14.sp,
      ),
    );
  }

  Widget field({
    required TextEditingController controller,
    Widget? suffixIcon,
  }) {
    return SizedBox(
      height: 44.h,
      child: CustomTextFormField(
        controller: controller,
        padding: EdgeInsets.all(4.r),
        suffixIcon: suffixIcon,
      ),
    );
  }
}

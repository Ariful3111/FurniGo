import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/auth/controller/user_mode_controller.dart';
import 'package:zb_dezign/features/auth/widgets/auth_header.dart';
import 'package:zb_dezign/features/auth/widgets/user_option.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class UserModeView extends StatelessWidget {
  const UserModeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    UserModeController userModeController = Get.find();
    return CustomContainer(
      gradient:isDark?AppColors.darkAuthBG: AppColors.authBG,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AuthHeader(),
          SizedBox(height: 32.h),
          CustomPrimaryText(
            text: 'How will you use ZB Design?',
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color:isDark?AppColors.primaryBorderColor: AppColors.darkColor,
          ),
          SizedBox(height: 32.h),
          UserOption(),
          SizedBox(height: 42.h),
          CustomPrimaryButton(
            height: 48.h, 
            fontSize: 16.sp,
            text: 'Continue',
            onPressed: () {
              if (userModeController.selectedIndex.value == 0) {
                Get.toNamed(AppRoutes.signUpOptionView);
              } else if (userModeController.selectedIndex.value == 1) {
                 Get.toNamed(AppRoutes.signUpOptionView);
              }
            },
          ),
          SizedBox(height: 32.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 48.h,
            width: MediaQuery.widthOf(context),
            decoration: BoxDecoration(
              color:isDark?AppColors.darkErrorBG: Color(0xFFFFF3D0),
              border: Border.all(width: 1.r, color:isDark?AppColors.darkErrorBorder: Color(0xFFFEE498)),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Image.asset(IconsPath.info, height: 16.h, width: 16.w,color: isDark?AppColors.darkPendingTextColor:null,),
                SizedBox(width: 10.w),
                CustomPrimaryText(
                  text: 'You can add or switch profiles later.',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color:isDark? AppColors.darkPendingTextColor:AppColors.darkColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

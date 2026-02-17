import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/auth/controller/user_mode_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_radio_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class UserOption extends StatelessWidget {
  const UserOption({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    UserModeController userModeController = Get.find();
    return Column(
      children: List.generate(userModeController.userItem.length, (index) {
        final item = userModeController.userItem[index];
        return Container(
          padding: EdgeInsets.all(20.r),
          margin: EdgeInsets.only(bottom: index == 0 ? 20.h : 0),
          width: MediaQuery.widthOf(context),
          decoration: BoxDecoration(
            color: isDark ? AppColors.labelColor : AppColors.whiteColor,
            border: Border.all(
              width: 1.r,
              color: isDark ? AppColors.darkBorderColor : Color(0xFFE8E6EB),
            ),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 6,
                color: AppColors.shadowColor.withValues(alpha: 0.06),
              ),
            ],
          ),
          child: Row(
            children: [
              Image.asset(item['icon'], height: 45.h, width: 45.w),
              SizedBox(width: 18.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPrimaryText(
                    text: item['title'],
                    fontSize: 18.sp,
                    color:isDark?AppColors.whiteColor: Color(0xFF121212),
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  CustomPrimaryText(
                    text: item['subTitle'],
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color:isDark?AppColors.primaryBorderColor: Color(0xFF4D4D4D),
                  ),
                ],
              ),
              Spacer(),
              Obx(() {
                return CustomRadioButton(
                  value: index,
                  groupValue: userModeController.selectedIndex.value,
                  onChange: (value) {
                    userModeController.selectedIndex.value = value!;
                  },
                );
              }),
            ],
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiInsufficientButton extends StatelessWidget {
  final VoidCallback onTap;

  const AiInsufficientButton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SharedContainer(
      width: MediaQuery.widthOf(context),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      radius: 50.r,
      color: isDark
          ? AppColors.errorColor.withValues(alpha: 0.15)
          : Color(0xFFFFEBEB),
      border: Border.all(width: 1, color: AppColors.errorColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                IconsPath.creditCoin,
                height: 16.h,
                width: 16.w,
                color: AppColors.errorColor,
              ),
              SizedBox(width: 8.w),
              CustomPrimaryText(
                text: "Insufficient Credit Balance",
                fontSize: 14.sp,
                color: AppColors.errorColor,
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
            child: CustomPrimaryButton(
              text: "Upgrade",
              backgroundColor: AppColors.errorColor,
              textColor: AppColors.whiteColor,
              onPressed: onTap,
              borderRadius: BorderRadius.circular(50.r),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
          ),
        ],
      ),
    );
  }
}

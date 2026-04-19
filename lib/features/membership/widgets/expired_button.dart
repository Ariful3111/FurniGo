import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';

class ExpiredButton extends StatelessWidget {
  const ExpiredButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSecondaryButton(
      padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 12.w),
      radius: 8.r,
      text: 'Expired',
      icon: IconsPath.expire,
      onPressed: () {},
      backgroundColor: Color(0xFFDF1C41),
      textColor: AppColors.whiteColor,
      border: Border.all(color: Colors.transparent),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 12,
          color: AppColors.shadowColor.withValues(alpha: 0.08),
        ),
      ],
    );
  }
}

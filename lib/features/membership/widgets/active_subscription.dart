import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';

class ActiveSubscription extends StatelessWidget {
  const ActiveSubscription({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSecondaryButton(
      text: 'Active',
      icon: IconsPath.mark,
      onPressed: () {},
      backgroundColor: AppColors.successColor,
      textColor: AppColors.whiteColor,
      iconColor: AppColors.whiteColor,
      radius: 9.r,
      padding: EdgeInsets.symmetric(vertical: 6.75.h, horizontal: 13.5.w),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 2.25),
          blurRadius: 13.5,
          color: AppColors.shadowColor.withValues(alpha: 0.08),
        ),
      ],
    );
  }
}

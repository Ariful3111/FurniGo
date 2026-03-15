import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/auth/widgets/login_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class OnboardLogin extends StatelessWidget {
  final String subTitle;
  final ValueKey valueKey;
  const OnboardLogin({
    super.key,
    required this.subTitle,
    required this.valueKey,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      key: key,
      children: [
        SizedBox(height: 20.h),
        LoginButton(
          onTap: () {},
          icon: IconsPath.google,
          title: 'Continue With Goggle',
          borderColor: Color(0xFFBEBEBE),
        ),
        SizedBox(height: 12.h),
        LoginButton(
          onTap: () {},
          icon: IconsPath.apple,
          iconColor: isDark ? AppColors.whiteColor : null,
          title: 'Continue With Apple',
          borderColor: Color(0xFFBEBEBE),
        ),
        SizedBox(height: 12.h),
        LoginButton(
          onTap: () {
            Get.toNamed(AppRoutes.signInView);
          },
          icon: IconsPath.gmail,
          title: 'Continue With Email',
          color: AppColors.primaryColor,
          fontColor: AppColors.whiteColor,
          borderColor: Colors.transparent,
        ),
        SizedBox(height: 20.h),
        CustomPrimaryText(
          text: subTitle,
          fontSize: 14.sp,
          color: AppColors.whiteColor,
          textAlign: TextAlign.center,
          shadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 4,
              color: AppColors.darkColor.withValues(alpha: 0.25),
            ),
          ],
        ),
      ],
    );
  }
}

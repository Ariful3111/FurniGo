import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/profile/controllers/profile_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class DashboardWelcome extends GetWidget<ProfileController> {
  const DashboardWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return controller.isLoading.value
          ? ButtonLoading()
          : SharedContainer(
              width: MediaQuery.widthOf(context),
              padding: EdgeInsets.all(8.r),
              radius: 12.r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'Welcome back, ',
                      style: GoogleFonts.montserrat(
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.primaryColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text:
                              ' ${controller.userProfile.value?.data?.name ?? "User"}!',
                          style: GoogleFonts.montserrat(
                            foreground: Paint()
                              ..shader = LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color(0xFF15003B), Color(0xFF9810FA)],
                              ).createShader(Rect.fromLTWH(100, 100, 100, 100)),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CustomPrimaryText(
                    text: 'Buy, rent, and sell furniture  all from one place.',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: isDark
                        ? AppColors.primaryBorderColor
                        : AppColors.secondaryTextColor,
                  ),
                ],
              ),
            );
    });
  }
}

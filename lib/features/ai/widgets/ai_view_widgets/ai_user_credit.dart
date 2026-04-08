import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/ai/widgets/ai_view_widgets/ai_dropdown.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';

class AiUserCredit extends StatelessWidget {
  const AiUserCredit({super.key});

  @override
  Widget build(BuildContext context) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSecondaryButton(
          padding: EdgeInsets.symmetric(vertical: 9.09.h,horizontal: 14.55.w),
          text: "Back",
          textColor:isDark?AppColors.darkColor :AppColors.whiteColor,
          iconColor:isDark?AppColors.darkColor: AppColors.whiteColor,
          icon: IconsPath.arrowLeft,
          backgroundColor:isDark?AppColors.boxColor: AppColors.secondaryColor,
          onPressed: () => Navigator.pop(context),
        ),
        AiDropdown(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/ai_design/models/ai_design_model.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_table/custom_table_expanded.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class AiDesignTableExpanded extends StatelessWidget {
  final AiDesignModel aiDesignModel;
  const AiDesignTableExpanded({super.key, required this.aiDesignModel});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDetailRow('Type', aiDesignModel.type, isDark: isDark),
        SizedBox(height: 8.h),
        buildDetailRow(
          'Design Generation date',
          aiDesignModel.generateDate,
          isDark: isDark,
        ),
        SizedBox(height: 8.h),
        CustomPrimaryText(
          text: 'Action:',
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.primaryBorderColor : AppColors.greyColor,
        ),
        SizedBox(height: 8.h),
        CustomSecondaryButton(
          width: 140.w,
          text: 'View Details',
          icon: IconsPath.view,
          onPressed: () {
            Get.toNamed(
              AppRoutes.aiDesignDetailsView,
              arguments: aiDesignModel,
            );
          },
        ),
      ],
    );
  }
}

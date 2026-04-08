import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/dashboard_ai_design/models/ai_design_model.dart';
import 'package:zb_dezign/features/dashboard_ai_design/widgets/dashboard_ai_design_details_widgets/dashboard_ai_interior_design.dart';
import 'package:zb_dezign/features/dashboard_ai_design/widgets/dashboard_ai_design_details_widgets/dashboard_ai_product_placement.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class DashboardAiDesignDetails extends StatelessWidget {
  const DashboardAiDesignDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final AiDesignModel aiDesignModel = Get.arguments as AiDesignModel;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(
            title: 'AI Designs',
            icon: IconsPath.back,
            onDrawerTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 12.h),
          SharedContainer(
            radius: 12.r,
            padding: EdgeInsets.all(12.r),
            child: CustomPrimaryText(
              text: 'AI Designs',
              color: isDark ? AppColors.whiteColor : AppColors.titleColor,
            ),
          ),
          SizedBox(height: 16.h),
          SharedContainer(
            radius: 20.r,
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSecondaryButton(
                  width: 90.w,
                  text: 'Back',
                  icon: IconsPath.arrowLeft,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 20.h),
                if (aiDesignModel.type == 'Product Placement')
                  DashboardAiProductPlacement(),
                if (aiDesignModel.type == 'AI Interior Design')
                  DashboardAiInteriorDesign(),
                SizedBox(height: 20.h),
                SharedContainer(
                  height: 291.h,
                  image: DecorationImage(
                    image: AssetImage(ImagesPath.aiAfter),
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

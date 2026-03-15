import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai_design/controller/ai_design_controller.dart';
import 'package:zb_dezign/features/ai_design/widgets/ai_design_view_widgets/ai_design_table.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:zb_dezign/shared/widgets/custom_pagination/custom_pagination.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiDesignView extends StatelessWidget {
  const AiDesignView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    AiDesignController aiDesignController = Get.find();
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(
            title: 'AI Designs',
            onDrawerTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDrawer();
                },
              );
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
          AiDesignTable(),
          SizedBox(height: 24.h),
          CustomPagination(
            currentPage: aiDesignController.currentPage,
            totalPage: aiDesignController.totalPages,
          ),
        ],
      ),
    );
  }
}

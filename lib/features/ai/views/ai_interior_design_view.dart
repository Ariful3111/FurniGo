import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/ai/widgets/ai_generate_button.dart';
import 'package:zb_dezign/features/ai/widgets/ai_header.dart';
import 'package:zb_dezign/features/ai/widgets/ai_insufficient_button.dart';
import 'package:zb_dezign/features/ai/widgets/ai_interior_design_widgets/ai_interior_design_preference.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiInteriorDesignView extends StatelessWidget {
  const AiInteriorDesignView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final String title = args['title'] ?? 'AI';
    final String sub = args['sub'] ?? '';
    return CustomContainer(
      child: ListView(
        children: [
          AiHeader(),
          SizedBox(height: 20.h),
          SharedContainer(
            width: double.infinity,
            height: 237.h,
            radius: 24.r,
            image: DecorationImage(
              image: AssetImage(ImagesPath.product),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20.h),
          AiInteriorDesignPreference(),
          SizedBox(height: 12.h),
          AiGenerateButton(onTap: () {
            Get.toNamed(
              AppRoutes.aiProductPlacementRegenerateView,
              arguments: {'title': title, 'sub': sub},
            );
          }),
          SizedBox(height: 12.h),
          AiInsufficientButton(onTap: () {}),
        ],
      ),
    );
  }
}

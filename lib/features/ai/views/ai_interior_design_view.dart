import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/ai/widgets/ai_header.dart';
import 'package:zb_dezign/features/ai/widgets/ai_interior_design_widgets/ai_interior_design_preference.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiInteriorDesignView extends StatelessWidget {
  const AiInteriorDesignView({super.key});

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}

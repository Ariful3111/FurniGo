import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/ai/widgets/ai_header.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiProductPlacementView extends StatelessWidget {
  const AiProductPlacementView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: ListView(
        children: [
          AiHeader(),
          SizedBox(height: 20.h),
          SharedContainer(
            width: MediaQuery.widthOf(context),
            height: 237.h,
            padding: EdgeInsets.zero,
            image: DecorationImage(
              image: AssetImage(ImagesPath.placement),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20.h),
          // AiProductPlacementRoom()
        ],
      ),
    );
  }
}

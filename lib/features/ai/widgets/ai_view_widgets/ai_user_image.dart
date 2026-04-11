import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/ai/widgets/ai_view_widgets/ai_user_image_border.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiUserImage extends StatelessWidget {
  const AiUserImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AiUserImageBorder(
      child: SharedContainer(
        width: 48.w,
        height: 48.h,
        radius: 100.r,
        color: AppColors.fieldColor,
        image:  DecorationImage(
          image: AssetImage(IconsPath.user),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

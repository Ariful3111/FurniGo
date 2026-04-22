import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/ai/widgets/ai_view_widgets/ai_user_image_border.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiUserImage extends StatelessWidget {
  const AiUserImage({super.key});

  @override
  Widget build(BuildContext context) {
    // Avatar is slightly smaller than the outer ring to show the ring
    return AiUserImageBorder(
      child: SharedContainer(
        padding: EdgeInsets.zero,
        width: 28.33.w,
        height: 28.33.h,
        radius: 41.67.r,
        image: DecorationImage(
          image: AssetImage(IconsPath.user),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
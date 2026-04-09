import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/ai/widgets/ai_view_widgets/ai_user_credit.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_header.dart';

class AiHeader extends StatelessWidget {
  const AiHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final String title = args['title'] ?? 'AI';
    final String sub = args['sub'] ?? '';
    return Column(
      children: [
        CustomAppbar(
          title: title,
          onDrawerTap: () => Navigator.pop(context),
          icon: IconsPath.back,
        ),
        SizedBox(height: 20.h),
        FlowHeader(title: title, sub: sub),
        SizedBox(height: 24.h),
        AiUserCredit(),
      ],
    );
  }
}

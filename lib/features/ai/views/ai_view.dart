import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/features/ai/widgets/ai_header.dart';
import 'package:zb_dezign/features/ai/widgets/ai_view_widgets/ai_view_image.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';

class AiView extends StatelessWidget {
  const AiView({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AiHeader(),
          SizedBox(height: 60.h,),
          AiViewImage(),

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/ai/controller/ai_controller.dart';
import 'package:zb_dezign/features/ai/widgets/ai_view_widgets/ai_user_image_painter.dart';

class AiUserImageBorder extends GetWidget<AiController> {
  final Widget? child;

  const AiUserImageBorder({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Size and stroke tuned to match Figma proportions
    final double size        = 33.33.r;
    final double strokeWidth = 6.r;

    return Obx(() => SizedBox(
          width: size,
          height: size,
          child: CustomPaint(
            painter: AiUserImagePainter(
              progress: controller.progress.value,
              strokeWidth: strokeWidth,
              context: context,
            ),
            child: Center(child: child),
          ),
        ));
  }
}
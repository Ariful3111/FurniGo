import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/ai/controller/ai_controller.dart';
import 'package:zb_dezign/features/ai/widgets/ai_view_widgets/ai_user_image_painter.dart';

class AiUserImageBorder extends GetWidget<AiController> {
  final double size;
  final double strokeWidth;
  final Widget? child;

  const AiUserImageBorder({
    super.key,
    this.size = 60,
    this.strokeWidth = 5,
    this.child,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: AiUserImagePainter(
            progress: controller.progress.value,
            strokeWidth: strokeWidth, context: context,
          ),
          child: Center(child: child),
        ),
      );
  }
}

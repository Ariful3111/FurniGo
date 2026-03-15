import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/home/controller/home_controller.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_helper.dart';

class HomeAiSlider extends GetWidget<HomeController> {
  const HomeAiSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            controller.updatePosition(
              details.localPosition.dx,
              constraints.maxWidth,
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: Obx(
              () => Stack(
                children: [
                  Positioned.fill(
                    child: ClipRect(
                      clipper: SplitImageClipper(
                        position: controller.position.value,
                        side: SplitSide.left,
                      ),
                      child: Image.asset(
                        ImagesPath.aiBefore,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: ClipRect(
                      clipper: SplitImageClipper(
                        position: controller.position.value,
                        side: SplitSide.right,
                      ),
                      child: Image.asset(ImagesPath.aiAfter, fit: BoxFit.cover),
                    ),
                  ),

                  Positioned(
                    left: constraints.maxWidth * controller.position.value,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      width: 2.76.w,
                      decoration: BoxDecoration(color: Colors.white),
                    ),
                  ),
                  Positioned(
                    left:
                        constraints.maxWidth * controller.position.value -
                        10.w,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Image.asset(
                        IconsPath.handle,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

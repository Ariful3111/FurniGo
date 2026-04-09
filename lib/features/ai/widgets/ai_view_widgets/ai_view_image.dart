import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/core/utils/image_picker.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiViewImage extends StatelessWidget {
  const AiViewImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SharedContainer(
          padding: EdgeInsets.all(24.r),
          gradient: LinearGradient(
            begin: Alignment(0, 0),
            end: Alignment(1, 1.03),
            colors: [Color(0xFF1347D1), Color(0xFF1B6ADD), Color(0xFF209DF0)],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 50,
              offset: Offset(0, 25),
              spreadRadius: -12,
            ),
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(IconsPath.aiDesign, height: 32.h, width: 32.w),
              CustomPrimaryText(
                text:
                    'Upload a photo of your room to see how this product fits in your space using AI.',
                textAlign: TextAlign.center,
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: CustomSecondaryButton(
                      radius: 32.r,
                      boxShadow: multiDropShadow(),
                      onPressed: () async {
                        final args = Get.arguments ?? {};
                        final String rawTitle = args['title'] ?? '';
                        final String title = rawTitle.toString().toLowerCase();
                        final String? imagePath =
                            await ImageManager.pickImageFromGallery();
                        if (imagePath == null) {
                          return;
                        }
                        if (title == 'interior design') {
                          Get.toNamed(
                            AppRoutes.aiInteriorDesignView,
                            arguments: {...args, 'imagePath': imagePath},
                          );
                        } else if (title == 'product placement') {
                          Get.toNamed(
                            AppRoutes.aiProductPlacementView,
                            arguments: {...args, 'imagePath': imagePath},
                          );
                        }
                      },
                      text: 'Upload Room',
                      icon: IconsPath.gallery,
                      fontSize: 14.sp,
                      textColor: AppColors.primaryColor,
                      iconColor: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: CustomSecondaryButton(
                      radius: 32.r,
                      boxShadow: multiDropShadow(),
                      onPressed: () async {
                        final args = Get.arguments ?? {};
                        final String rawTitle = args['title'] ?? '';
                        final String title = rawTitle.toString().toLowerCase();
                        final String? imagePath =
                            await ImageManager.captureImageViaCamera();
                        if (imagePath == null) {
                          return;
                        }
                        if (title == 'interior design') {
                          Get.toNamed(
                            AppRoutes.aiInteriorDesignView,
                            arguments: {...args, 'imagePath': imagePath},
                          );
                        } else if (title == 'product placement') {
                          Get.toNamed(
                            AppRoutes.aiProductPlacementView,
                            arguments: {...args, 'imagePath': imagePath},
                          );
                        }
                      },
                      text: 'Take Photo',
                      icon: IconsPath.camera,
                      fontSize: 14.sp,
                      textColor: AppColors.primaryColor,
                      iconColor: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<BoxShadow> multiDropShadow() {
    return [
      BoxShadow(
        color: AppColors.darkColor.withValues(alpha: 0.1),
        blurRadius: 6,
        offset: const Offset(0, 4),
        spreadRadius: -4,
      ),
      BoxShadow(
        color: AppColors.darkColor.withValues(alpha: 0.1),
        blurRadius: 15,
        offset: Offset(0, 10),
        spreadRadius: -3,
      ),
    ];
  }
}

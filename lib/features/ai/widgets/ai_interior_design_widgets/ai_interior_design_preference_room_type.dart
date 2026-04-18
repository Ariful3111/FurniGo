import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/ai/controller/ai_interior_design_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AiInteriorDesignPreferenceRoomType extends GetWidget<AiInteriorDesignController> {
  const AiInteriorDesignPreferenceRoomType({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
          return Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: List.generate(controller.roomTypes.length, (index) {
              final room = controller.roomTypes[index];
              final isSelected = controller.selectedRooms.contains(room);
              return GestureDetector(
                onTap: () {
                  if (controller.selectedRooms.contains(room)) {
                    controller.selectedRooms.remove(room);
                  } else {
                    controller.selectedRooms.add(room);
                  }
                },
                child: SharedContainer(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  radius: 8.r,
                  color: isSelected
                      ?isDark? AppColors.boxColor:AppColors.primaryColor
                      : (isDark ? AppColors.primaryColor : AppColors.fieldColor),
                  
                  child: CustomPrimaryText(
                    text: room,
                    fontSize: 12.sp,
                    color: isSelected
                        ?isDark?AppColors.darkColor :AppColors.whiteColor
                        : (isDark ? AppColors.whiteColor : AppColors.darkColor),
                  ),
                ),
              );
            }),
          );
        });
  }
}
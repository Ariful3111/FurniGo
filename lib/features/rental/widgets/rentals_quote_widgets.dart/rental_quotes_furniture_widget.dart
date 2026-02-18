import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/controller/rental_quotes_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RentalQuotesFurnitureWidget extends StatelessWidget {
  const RentalQuotesFurnitureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    RentalQuotesController quotesController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Column(
        children: List.generate(quotesController.furniture.length, (index) {
          final item = quotesController.furniture[index];
          final isSelected = quotesController.isOpen[index];
          return Column(
            key: ValueKey(index),
            children: [
              SharedContainer(
                padding: EdgeInsets.all(12.r),
                radius: 12.r,
                border: Border.all(
                  width: 1.r,
                  color: isDark
                      ? AppColors.darkBorderColor
                      : AppColors.primaryBorderColor,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomPrimaryText(
                          text: item['title'],
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.darkColor,
                        ),
                        InkWell(
                          onTap: () {
                            quotesController.isOpen[index] =
                                !quotesController.isOpen[index];
                          },
                          child: AnimatedRotation(
                            turns: isSelected ? 1 : 0,
                            duration:  Duration(milliseconds: 300),
                            child: Image.asset(
                              isSelected
                                  ? IconsPath.upArrow
                                  : IconsPath.downArrow,
                              height: 20.h,
                              width: 20.w,
                              color: isDark
                                  ? AppColors.whiteColor
                                  : AppColors.darkColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AnimatedSize(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                      child: isSelected
                          ? Padding(
                              padding: EdgeInsetsGeometry.only(top: 20.h),
                              child: Column(
                                key: ValueKey('widget'),
                                children: [item['widget']],
                              ),
                            )
                          : SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
            ],
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/controllers/rental_quotes_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RentalQuotesFurnitureWidget extends GetWidget<RentalQuotesController> {
  final List itemList;
  final RxList<bool> isOpen;
  const RentalQuotesFurnitureWidget({
    super.key,
    required this.itemList,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Column(
        children: [
          Column(
            children: List.generate(itemList.length, (index) {
              final item = itemList[index];
              final isSelected = isOpen[index];
              return Column(
                key: ValueKey(index),
                children: [
                  GestureDetector(
                    onTap: () {
                      isOpen[index] = !isOpen[index];
                    },
                    child: SharedContainer(
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
                              AnimatedRotation(
                                turns: isSelected ? 1 : 0,
                                duration: Duration(milliseconds: 300),
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
                            ],
                          ),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                            alignment: Alignment.topCenter,
                            child: isSelected
                                ? Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Column(
                                      key: ValueKey('widget'),
                                      children: [item['widget']],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              );
            }),
          ),
          CustomPrimaryButton(
            height: 40.h,
            width: 120.w,
            fontSize: 14.sp,
            backgroundColor: AppColors.successColor,
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            textColor: AppColors.whiteColor,
            text: 'Approve All',
            onPressed: () {
              controller.approveAll();
            },
          ),
        ],
      ),
    );
  }
}

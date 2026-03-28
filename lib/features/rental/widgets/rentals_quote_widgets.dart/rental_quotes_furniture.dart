import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controllers/rental_quotes_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rental_quotes_furniture_action.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rentals_quote_item_details.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalQuotesFurniture extends GetWidget<RentalQuotesController> {
  final String category;
  const RentalQuotesFurniture({super.key, this.category = 'furniture'});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      final items = category == 'furniture'
          ? controller.furniture
          : controller.appliance;

      final expandedList = category == 'furniture'
          ? controller.isFurnitureExpanded
          : controller.isApplianceExpanded;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isExpanded = index < expandedList.length
              ? expandedList[index]
              : false;

          if (isExpanded) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.toggleItemExpanded(
                      index,
                      category == 'appliance',
                    );
                  },
                  child: RentalsQuoteItemDetails(
                    item: item,
                    index: index,
                    isAppliance: category == 'appliance',
                  ),
                ),
                SizedBox(height: 20.h),
                if (items.length - 1 != index) SizedBox(height: 20.h),
              ],
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(title: item['room'] ?? 'Unknown Room', isDark: isDark),
              SizedBox(height: 12.h),
              InkWell(
                onTap: () {
                  controller.toggleItemExpanded(index, category == 'appliance');
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/furniture.png',
                      height: 48.h,
                      width: 48.w,
                    ),
                    SizedBox(width: 19.w),
                    text(
                      title: '${item['items']?.length ?? 0} items',
                      isDark: isDark,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  row(data: '${item['condition'] ?? 'Good'}', isDark: isDark),
                  row(data: '${item['style'] ?? 'Modern'}', isDark: isDark),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  text(title: 'Action:', isDark: isDark),
                  SizedBox(width: 8.w),
                  RentalQuotesFurnitureAction(
                    index: index,
                    isAppliance: category == 'appliance',
                    action: category == 'furniture'
                        ? (index < controller.furnitureActions.length
                              ? controller.furnitureActions[index]
                              : QuoteItemAction.none)
                        : (index < controller.applianceActions.length
                              ? controller.applianceActions[index]
                              : QuoteItemAction.none),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              CustomDivider(),
              if (items.length - 1 != index) SizedBox(height: 20.h),
            ],
          );
        }),
      );
    });
  }

  Widget text({required String title, required bool isDark}) {
    return CustomPrimaryText(
      text: title,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
    );
  }

  Widget row({required String data, required bool isDark}) {
    return Expanded(
      child: Row(
        children: [
          text(title: 'Condition:', isDark: isDark),
          SizedBox(width: 16.w),
          text(title: data, isDark: isDark),
        ],
      ),
    );
  }
}

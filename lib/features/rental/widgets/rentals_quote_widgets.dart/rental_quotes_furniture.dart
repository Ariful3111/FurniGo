import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controller/rental_quotes_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rental_quotes_furniture_action.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalQuotesFurniture extends StatelessWidget {
  const RentalQuotesFurniture({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    RentalQuotesController rentalQuotesController = Get.find();
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(rentalQuotesController.item.length, (index) {
          final item = rentalQuotesController.item[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(title: item['title'], isDark: isDark),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Image.asset(item['image'], height: 48.h, width: 48.w),
                  SizedBox(width: 19.w),
                  text(title: item['name'], isDark: isDark),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  row(data: item['qty'], isDark: isDark),
                  row(data: item['price'], isDark: isDark),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  text(title: 'Action:', isDark: isDark),
                  SizedBox(width: 8.w),
                  RentalQuotesFurnitureAction(index: index),
                ],
              ),
              SizedBox(height: 20.h),
              CustomDivider(),
              if (rentalQuotesController.item.length - 1 != index)
                SizedBox(height: 20.h),
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
          text(title: 'Qty:', isDark: isDark),
          SizedBox(width: 16.w),
          text(title: data, isDark: isDark),
        ],
      ),
    );
  }
}

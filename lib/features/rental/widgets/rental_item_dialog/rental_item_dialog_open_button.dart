import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/controller/rental_quotes_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalItemDialogOpenButton extends StatelessWidget {
  const RentalItemDialogOpenButton({super.key});

  @override
  Widget build(BuildContext context) {
    final RentalQuotesController controller = Get.find();
    return Obx(() {
      final int itemCount =
          controller.approvedItems.length + controller.revisedItems.length;
      final double totalPrice = controller.grandTotal;
      if (itemCount == 0) return const SizedBox.shrink();
      return Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 14.29.h,
              horizontal: 17.14.w,
            ),
            height: 69.57.h,
            width: 100.w,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
            ),
            child: Column(
              children: [
                Image.asset(IconsPath.open, height: 18.h, width: 18.w),
                SizedBox(width: 5.w),
                CustomPrimaryText(
                  text: '$itemCount items',
                  color: Colors.white,
                  fontSize: 16.sp,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.29.h),
            height: 46.57.h,
            width: 100.w,
            decoration: BoxDecoration(
              gradient: AppColors.secondaryGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r),
              ),
            ),
            child: Center(
              child: CustomPrimaryText(
                text: '\$${totalPrice.toStringAsFixed(0)}',
                color: Colors.white,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CartOrderSummery extends StatelessWidget {
  const CartOrderSummery({super.key});

  @override
  Widget build(BuildContext context) {
    List price = [
      {'title': 'Subtotal', 'value': '\$280.00'},
      {'title': 'Shipping', 'value': '\$7.00'},
      {'title': 'Discount', 'value': '\$0'},
      {'title': 'Total', 'value': '\$287.00'},
    ];
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: MediaQuery.widthOf(context),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color:isDark? AppColors.darkBorderColor: AppColors.primaryBorderColor),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Order Summary',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color:isDark? AppColors.whiteColor: AppColors.buttonTextColor,
          ),
          SizedBox(height: 16.h),
          CustomDivider(),
          SizedBox(height: 16.h),
          ...List.generate(
            price.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                bottom: index == price.length - 1 ? 0 : 20.h,
              ),
              child: _priceRow(
                price[index]['title'],
                price[index]['value'],
                isBold: index == price.length - 1,
                isDark: isDark
              ),
            ),
          ),
          SizedBox(height: 16.h),
          CustomDivider(),
          SizedBox(height: 20.h),
          CustomPrimaryButton(
            text: 'Proceed to Checkout',
            onPressed: () {
              Get.toNamed(AppRoutes.checkoutView);
            },
            height: 64.h,
            fontSize: 16.sp,
          ),
        ],
      ),
    );
  }

  Widget _priceRow(String title, String value, {bool isBold = false,required bool isDark}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: 16.sp,
          color:isDark? AppColors.primaryBorderColor:( isBold
              ? AppColors.darkSecondaryColor
              : AppColors.buttonTextColor),
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
        ),
        CustomPrimaryText(
          text: value,
          fontSize: isBold ? 20.sp : 18.sp,
          color:isDark? AppColors.primaryBorderColor: AppColors.darkGreyColor,
          fontWeight: isBold ? FontWeight.w600 : FontWeight.w500,
        ),
      ],
    );
  }
}

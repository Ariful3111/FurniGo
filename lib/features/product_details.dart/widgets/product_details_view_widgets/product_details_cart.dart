import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProductDetailsCart extends GetWidget<ProductDetailsController> {
  const ProductDetailsCart({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        gradient: isDark
            ? LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.darkColor,
                  AppColors.darkColor.withValues(alpha: 0.75),
                  AppColors.darkColor.withValues(alpha: 0),
                ],
              )
            : LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColors.whiteColor,
                  AppColors.whiteColor.withValues(alpha: 0.75),
                  AppColors.whiteColor.withValues(alpha: 0),
                ],
              ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: 20.h,
          top: 40.h,
        ),
        child: controller.isStock.value
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _qtyButton(
                            icon: Icons.remove,
                            onTap: () {
                              if (controller.qty > 1) {
                                controller.qty--;
                              }
                            },
                          ),
                          SizedBox(width: 6.w),
                          Obx(() => _qtyValue(controller.qty.toString())),
                          SizedBox(width: 6.w),
                          _qtyButton(
                            icon: Icons.add,
                            onTap: () {
                              controller.qty++;
                            },
                          ),
                        ],
                      ),
                      button(
                        text: 'Add TO CART',
                        icon: IconsPath.productCart,
                        onTap: () {},
                        border: Border.all(color: Color(0xFF111116)),
                        bgColor: AppColors.whiteColor,
                        iconColor: AppColors.darkColor,
                        textColor: AppColors.darkColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  button(
                    width: MediaQuery.widthOf(context),
                    text: 'BUY NOW',
                    icon: IconsPath.cart,
                    onTap: () {},
                    bgColor: AppColors.secondaryColor,
                    textColor: AppColors.whiteColor,
                    iconColor: AppColors.whiteColor,
                  ),
                ],
              )
            : Column(
                children: [
                  ProductDetailsHelper().outOfStock(
                    onTap: () {},
                    isDark: isDark,
                  ),
                  SizedBox(height: 12.h),
                  ProductDetailsHelper().reStock(onTap: () {}, isDark: isDark),
                ],
              ),
      ),
    );
  }

  Widget _qtyButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 55.w,
        height: 49.h,
        decoration: _boxDecoration(),
        child: Icon(icon, size: 20.sp),
      ),
    );
  }

  Widget _qtyValue(String value) {
    return Container(
      width: 55.w,
      height: 49.h,
      alignment: Alignment.center,
      decoration: _boxDecoration(),
      child: CustomPrimaryText(
        text: value,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: Color(0xFF2D2D2D),
      ),
    );
  }

  Widget button({
    required String text,
    required String icon,
    required VoidCallback onTap,
    required Color bgColor,
    required Color textColor,
    required Color iconColor,
    double? width,
    Border? border,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 49.h,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.r),
          border: border,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPrimaryText(text: text, fontSize: 14.sp, color: textColor),
            SizedBox(width: 8.w),
            Image.asset(icon, height: 20.h, width: 20.w, color: iconColor),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: const Color(0xFFEAEAEA)),
      borderRadius: BorderRadius.circular(8.5.r),
      boxShadow: [
        BoxShadow(
          color: AppColors.darkColor.withValues(alpha: 0.2),
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/order/controller/order_details_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_rating_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class OrderDetailsStatus extends GetWidget<OrderDetailsController> {
  const OrderDetailsStatus({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(20.r),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Order Status',
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              sub(text: 'Current Status:', isDark: isDark),
              sub(text: 'Tracking Number:', isDark: isDark),
            ],
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              Image.asset(
                IconsPath.truck,
                height: 20.h,
                width: 20.w,
                color: isDark ? null : AppColors.labelColor,
              ),
              SizedBox(width: 8.w),
              title(text: 'Shipped', isDark: isDark),
              Spacer(),
              title(text: 'TRK-9928-XA', isDark: isDark),
            ],
          ),
          SizedBox(height: 8.h),
          sub(text: 'Estimated Delivery:', isDark: isDark),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title(text: 'Nov 15 - Nov 17, 2025', isDark: isDark),
              CustomPrimaryButton(
                text: 'Add Review',
                onPressed: () {
                  showDialog(
                    barrierColor: isDark
                        ? AppColors.whiteColor.withValues(alpha: 0.2)
                        : null,
                    context: context,
                    builder: (context) {
                      return Obx(
                        () => CustomRatingDialog(
                          onSubmitTap: () {},
                          rating: controller.rating.value,
                          textEditingController:
                              controller.ratingController,
                          onRatingUpdate: (double value) {
                            controller.rating.value = value;
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget sub({required String text, required bool isDark}) {
    return CustomPrimaryText(
      text: text,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: isDark ? AppColors.darkPrimaryTextColor : AppColors.greyColor,
    );
  }

  Widget title({required String text, required bool isDark}) {
    return CustomPrimaryText(
      text: text,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: isDark ? AppColors.whiteColor : AppColors.labelColor,
    );
  }
}

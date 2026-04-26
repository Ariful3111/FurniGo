import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/order/controllers/order_review_controller.dart';
import 'package:zb_dezign/features/order/models/orders_model.dart';
import 'package:zb_dezign/shared/extensions/extractors/estimate_delivery_extractor.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_dialog_animation.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_rating_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class OrderDetailsStatus extends GetWidget<OrderReviewController> {
  final OrderData order;
  const OrderDetailsStatus({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(20.r),

      child: Column(
        mainAxisSize: MainAxisSize.min,
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
              Container(
                constraints: BoxConstraints(maxWidth: 120.w),
                child: title(text: order.status ?? '', isDark: isDark),
              ),
              Spacer(),
              Container(
                constraints: BoxConstraints(maxWidth: 120.w),
                child: title(text: order.id ?? '', isDark: isDark),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Flexible(
            child: sub(text: 'Estimated Delivery:', isDark: isDark),
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: title(
                  text: order.calculateEstimatedDelivery(),
                  isDark: isDark,
                ),
              ),
              SizedBox(width: 8.w),
              CustomPrimaryButton(
                text: 'Add Review',
                onPressed: () {
                  CustomDialogAnimation().showAnimatedDialog(
                    context: context,
                    dialog: Obx(
                      () => CustomRatingDialog(
                        onSubmitTap: () async {
                          await controller.submitReview(
                            orderID: order.id ?? '',
                          );
                        },
                        rating: controller.rating.value,
                        textEditingController: controller.ratingController,
                        onRatingUpdate: (double value) {
                          controller.rating.value = value;
                        },
                        isLoading: controller.isLoading.value,
                      ),
                    ),
                    isDark: isDark,
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
      maxLine: 1,
      textOverflow: TextOverflow.ellipsis,
    );
  }

  Widget title({required String text, required bool isDark}) {
    return CustomPrimaryText(
      text: text,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: isDark ? AppColors.whiteColor : AppColors.labelColor,
      maxLine: 1,
      textOverflow: TextOverflow.ellipsis,
    );
  }
}

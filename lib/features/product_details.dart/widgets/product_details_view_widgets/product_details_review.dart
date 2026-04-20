import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_review_card.dart';
import 'package:zb_dezign/shared/extensions/formatters/date_formatter.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_rating_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ProductDetailsReview extends GetWidget<ProductDetailsController> {
  const ProductDetailsReview({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    if (controller.productDetails.value == null) {
      return SizedBox.shrink();
    }

    final reviews = controller.productDetails.value!.data.reviews ?? [];

    if (reviews.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Center(child: CustomPrimaryText(text: "No reviews yet")),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          ProductDetailsReviewCard(
            name: reviews[controller.reviewIndex.value].reviewerName ?? '',
            time:
                reviews[controller.reviewIndex.value].createdAt
                    ?.toSmartRelativeTime() ??
                '',
            rating: (reviews[controller.reviewIndex.value].rating ?? 0)
                .toDouble(),
            image:
                reviews[controller.reviewIndex.value].reviewerImage ??
                IconsPath.profile,
            review: reviews[controller.reviewIndex.value].review ?? '',
            isDark: isDark,
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _navButton(
                icon: IconsPath.arrowLeft,
                isDark: isDark,
                isFilled: false,
                onTap: () {
                  if (controller.reviewIndex.value > 0) {
                    controller.reviewIndex.value--;
                  }
                },
              ),
              SizedBox(width: 10.w),
              _navButton(
                icon: IconsPath.arrowRight,
                isDark: isDark,
                isFilled: true,
                onTap: () {
                  if (controller.reviewIndex.value < reviews.length - 1) {
                    controller.reviewIndex.value++;
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CustomPrimaryButton(
            text: 'Submit Your Review',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => Obx(
                  () => CustomRatingDialog(
                    onSubmitTap: () {},
                    rating: controller.rating.value,
                    textEditingController: controller.ratingController,
                    onRatingUpdate: (double value) {
                      controller.rating.value = value;
                    },
                    isLoading: controller.isLoading.value,
                  ),
                ),
              );
            },
            width: 200.w,
          ),
        ],
      ),
    );
  }

  Widget _navButton({
    required String icon,
    required bool isDark,
    required bool isFilled,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: isFilled ? Color(0xFF363636) : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: isFilled
                ? AppColors.darkColor
                : (isDark ? AppColors.darkBorderColor : Color(0xFF363636)),
          ),
        ),
        child: Center(
          child: Image.asset(
            icon,
            height: 20.sp,
            width: 20.sp,
            color: isFilled
                ? AppColors.whiteColor
                : (isDark ? AppColors.whiteColor : Color(0xFF363636)),
          ),
        ),
      ),
    );
  }
}

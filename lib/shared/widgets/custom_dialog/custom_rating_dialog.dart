import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';
import 'package:zb_dezign/shared/widgets/custom_rating/custom_rating_builder.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CustomRatingDialog extends StatelessWidget {
  final VoidCallback onSubmitTap;
  final double rating;
  final TextEditingController textEditingController;
  final ValueChanged<double> onRatingUpdate;
  final bool isLoading;
  const CustomRatingDialog({
    super.key,
    required this.onSubmitTap,
    required this.rating,
    required this.textEditingController,
    required this.onRatingUpdate,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.widthOf(context),
        height: 480.h,
        padding: EdgeInsets.all(24.r),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  CustomPrimaryText(
                    text: 'Rate and Review',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.whiteColor
                        : AppColors.darkTextColor,
                  ),
                  SizedBox(height: 38.h),
                  CustomPrimaryText(
                    text: rating.toString(),
                    fontSize: 48.sp,
                    color: isDark ? AppColors.whiteColor : AppColors.darkColor,
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100.w),
                    child: CustomDivider(
                      color: isDark
                          ? Color(0xFF697483)
                          : AppColors.fieldBorderColor,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CustomRatingBuilder(
                    rating: rating,
                    onRatingUpdate: onRatingUpdate,
                  ),
                  SizedBox(height: 24.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomPrimaryText(
                      text: 'Write your review',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.darkTextColor,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  CustomTextFormField(
                    controller: textEditingController,
                    maxLines: 3,
                    labelText: 'Please share your opinion about the product...',
                    labelFontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    labelColor: isDark
                        ? AppColors.primaryBorderColor
                        : Color(0xFF99A1AF),
                    borderWidth: 1.2.r,
                    borderRadius: 8.r,
                  ),
                  SizedBox(height: 16.h),
                  isLoading
                      ? ButtonLoading()
                      : CustomPrimaryButton(
                          text: 'Submit Review',
                          onPressed: () => onSubmitTap(),
                        ),
                ],
              ),
            ),
            Positioned(
              top: 7.h,
              right: 0.w,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  fontWeight: FontWeight.w900,
                  color: isDark ? AppColors.whiteColor : AppColors.darkColor,
                  size: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

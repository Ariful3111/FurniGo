import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/product_details.dart/models/product_attributes_model.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AttributeOptionChip extends StatelessWidget {
  final int attributeIndex;
  final int optionIndex;
  final AttributeOption option;

  const AttributeOptionChip({
    super.key,
    required this.attributeIndex,
    required this.optionIndex,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        // Handle option selection - implement as needed
      },
      child: SharedContainer(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        radius: 8.r,
        border: Border.all(
          color: isDark ? AppColors.darkBorderColor : Color(0xFFE5E9EE),
        ),
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (option.image != null) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: CachedNetworkImage(
                  imageUrl: option.image!,
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 8.w),
            ],
            CustomPrimaryText(
              text: option.name,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
            ),
            if (option.price > 0) ...[
              SizedBox(width: 6.w),
              CustomPrimaryText(
                text: '+\$${option.price.toStringAsFixed(2)}',
                fontSize: 12.sp,
                color: isDark
                    ? AppColors.primaryBorderColor
                    : AppColors.lightTextColor,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rental_quotes_furniture_action.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalsQuoteItemDetailsPreview extends StatelessWidget {
  final int index;
  const RentalsQuoteItemDetailsPreview({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List preview = [
      {'image': IconsPath.furniture, 'text': 'Modern Velvet Sofa'},
      {'image': IconsPath.furniture, 'text': 'Modern Velvet Sofa'},
      {'image': IconsPath.furniture, 'text': 'Modern Velvet Sofa'},
    ];
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 22.h),
        RentalQuotesFurnitureAction(index: index),
        SizedBox(height: 22.h),
        CustomPrimaryText(text: 'Other Items (Preview)'),
        Row(
          children: List.generate(preview.length, (index) {
            final item = preview[index];
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(5.66.r),
                  child: Image.asset(
                    item['image'],
                    height: 75.22.h,
                    width: 75.22.w,
                  ),
                ),
                SizedBox(height: 4.24.h),
                CustomPrimaryText(
                  text: item['text'],
                  color: isDark
                      ? AppColors.whiteColor
                      : AppColors.buttonTextColor,
                      fontSize: 9,
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}

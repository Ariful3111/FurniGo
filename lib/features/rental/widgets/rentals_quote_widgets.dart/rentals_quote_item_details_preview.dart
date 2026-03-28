import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rental/controllers/rental_quotes_controller.dart';
import 'package:zb_dezign/features/rental/widgets/rentals_quote_widgets.dart/rental_quotes_furniture_action.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentalsQuoteItemDetailsPreview extends GetWidget<RentalQuotesController> {
  final int index;
  final bool isAppliance;

  const RentalsQuoteItemDetailsPreview({
    super.key,
    required this.index,
    required this.isAppliance,
  });

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
        RentalQuotesFurnitureAction(
          index: index,
          isAppliance: isAppliance,
          action: isAppliance
              ? (index < controller.applianceActions.length
                    ? controller.applianceActions[index]
                    : QuoteItemAction.none)
              : (index < controller.furnitureActions.length
                    ? controller.furnitureActions[index]
                    : QuoteItemAction.none),
        ),
        SizedBox(height: 22.h),
        CustomPrimaryText(text: 'Other Items (Preview)'),
        SizedBox(height: 15.h),
        SizedBox(
          height: 94.h,
          child: ListView.builder(
            itemCount: preview.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = preview[index];
              return Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.66.r),
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
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

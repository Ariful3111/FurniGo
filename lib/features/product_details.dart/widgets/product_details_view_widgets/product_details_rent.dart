import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProductDetailsRent extends StatelessWidget {
  const ProductDetailsRent({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ProductDetailsRentHelper productDetailsRentHelper =
        ProductDetailsRentHelper();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Visualize before you rent or buy',
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
          ),
          SizedBox(height: 12.h),
          SharedContainer(
            padding: EdgeInsets.zero,
            height: 370.h,
            width: MediaQuery.widthOf(context),
            image: DecorationImage(
              image: AssetImage(ImagesPath.product),
              fit: BoxFit.cover,
            ),
            child: Stack(
              children: [
                productDetailsRentHelper.buildTopRightButton(),

                productDetailsRentHelper.buildBottomControls(),

                productDetailsRentHelper.buildColorOptions(),

                productDetailsRentHelper.buildSideArrows(),

                productDetailsRentHelper.buildFooterText(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

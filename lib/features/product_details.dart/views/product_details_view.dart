import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_description.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_view_header.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_view_image.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkColor : AppColors.whiteColor,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ProductDetailsViewHeader(),
          SizedBox(height: 12.h),
          ProductDetailsViewImage(),
          SizedBox(height: 16.h,),
          ProductDetailsDescription()
        ],
      ),
    );
  }
}

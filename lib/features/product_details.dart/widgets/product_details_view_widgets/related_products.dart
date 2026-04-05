import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/related_product_card.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RelatedProductsSection extends StatelessWidget {
  const RelatedProductsSection({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      "title": "Modern Velvet Sofa",
      "price": "\$299.00",
      "tag": "New Arrival",
      "image": ImagesPath.chair,
    },
    {
      "title": "Oakline Modern Bed Frame",
      "price": "\$169.00",
      "tag": "Rent Product",
      "image": ImagesPath.chair,
    },
    {
      "title": "Wooden Chair",
      "price": "\$99.00",
      "tag": "Rent Product",
      "image": ImagesPath.chair,
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomPrimaryText(
                text: 'Related Products',
                fontWeight: FontWeight.w600,
                color: isDark
                    ? AppColors.whiteColor
                    : AppColors.darkTextColor,
              ),
              InkWell(
                onTap: () {},
                child: CustomPrimaryText(
                  text: 'See All',
                  fontSize: 14.sp,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 240.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];
                return Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: RelatedProductCard(
                    data: item,
                    isDark: isDark,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


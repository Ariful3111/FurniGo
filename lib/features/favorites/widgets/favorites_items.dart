import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_product_design.dart';
import 'package:zb_dezign/shared/widgets/custom_product_text.dart';

class FavoritesItems extends StatelessWidget {
  const FavoritesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 12.h,
        mainAxisExtent: 260.h,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProductDesign(
              onFavorite: () {},
              icon: IconsPath.favoriteFill,
              color: Color(0xFFFF383C),
            ),
            SizedBox(height: 14.h),
            CustomProductText(
              color: AppColors.productColorList,
              title: 'Modern Velvet Sofa',
              price: '\$299',
            ),
          ],
        );
      },
    );
  }
}

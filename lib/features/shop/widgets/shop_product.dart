import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/features/shop/widgets/shop_product_design.dart';
import 'package:zb_dezign/features/shop/widgets/shop_product_text.dart';

class ShopProduct extends StatelessWidget {
  const ShopProduct({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> color = [
      Color(0xFFBCBAC9),
      Color(0xFFDEC4AF),
      Color(0xFFD28E8D),
      Color(0xFF86765B),
    ];
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
            ShopProductDesign(onFavorite: () {}),
            SizedBox(height: 14.h),
            ShopProductText(
              color: color,
              title: 'Modern Velvet Sofa',
              price: '\$299',
            ),
          ],
        );
      },
    );
  }
}

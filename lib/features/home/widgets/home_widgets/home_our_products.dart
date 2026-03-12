import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_helper.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_our_product_filter.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_product_design.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_product_text.dart';

class HomeOurProducts extends StatelessWidget {
  const HomeOurProducts({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> color = [
      Color(0xFFBCBAC9),
      Color(0xFFDEC4AF),
      Color(0xFFD28E8D),
      Color(0xFF86765B),
    ];

    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          HomeHelper().categoryTitle(
            title: 'Our Products',
            onTap: () {},
            isDark: isDark,
          ),
          SizedBox(height: 16.h),
          HomeOurProductFilter(),
          SizedBox(height: 16.h),
          SizedBox(
            height: 240.h,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeProductDesign(
                        onFavorite: () {},
                        onCart: () {},
                        image: IconsPath.furniture,
                      ),
                      SizedBox(height: 14.h),
                      HomeProductText(
                        color: color,
                        title: 'Modern Velvet Sofa',
                        price: '\$299.00',
                      ),
                    ],
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

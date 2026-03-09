import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_product_design.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_product_text.dart';

class HomeNewArrival extends StatelessWidget {
  const HomeNewArrival({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> color = [
      Color(0xFFBCBAC9),
      Color(0xFFDEC4AF),
      Color(0xFFD28E8D),
      Color(0xFF86765B),
    ];
    
    return SizedBox(
      height: 240.h,
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
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
                HomeProductText(color: color, title: 'Modern Velvet Sofa', price: '\$299.00')
              ],
            ),
          );
        },
      ),
    );
  }
}

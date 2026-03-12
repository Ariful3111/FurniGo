import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_quick_action.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_ai_design.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_header.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_helper.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_new_arrival.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_our_products.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_product_placement.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_rent.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_sell.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_shop.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        width: MediaQuery.widthOf(context),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkColor : AppColors.whiteColor,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          cacheExtent: 1200,
          children: [
            RepaintBoundary(child: HomeHeader()),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: DashboardQuickAction(text: 'Categories'),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHelper().categoryTitle(
                    title: 'Shop by Room',
                    onTap: () {},
                    isDark: isDark,
                  ),
                  SizedBox(height: 16.h),
                  HomeShop(),
                  SizedBox(height: 40.h),
                  HomeHelper().categoryTitle(
                    title: 'New Arrival',
                    onTap: () {},
                    isDark: isDark,
                  ),
                  SizedBox(height: 16.h),
                  HomeNewArrival(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            RepaintBoundary(child: HomeProductPlacement()),
            SizedBox(height: 20.h),
            RepaintBoundary(child: HomeOurProducts()),
            SizedBox(height: 40.h),
            HomeSell(),
            SizedBox(height: 40.h),
            HomeRent(),
            SizedBox(height: 20.h),
            RepaintBoundary(child: HomeAiDesign()),
          ],
        ),
      ),
    );
  }
}

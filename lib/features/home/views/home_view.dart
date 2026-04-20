import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_ai_design.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_header.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_helper.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_new_arrival.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_our_products.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_product_placement.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_rent.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_sell.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_shop.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/global_search_suggestion_box.dart';
import 'package:zb_dezign/shared/widgets/custom_quick_action/custom_quick_action.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.heightOf(context),
            width: MediaQuery.widthOf(context),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkColor : AppColors.whiteColor,
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                HomeHeader(),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomQuickAction(text: 'Categories'),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeHelper.categoryTitle(
                        title: 'Shop by Room',
                        onTap: () {},
                        isDark: isDark,
                      ),
                      SizedBox(height: 16.h),
                      HomeShop(),
                      SizedBox(height: 40.h),
                      HomeHelper.categoryTitle(
                        title: 'New Arrival',
                        onTap: () {
                          Get.toNamed(AppRoutes.shopView);
                        },
                        isDark: isDark,
                      ),
                      SizedBox(height: 16.h),
                      HomeNewArrival(),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
                HomeProductPlacement(),
                SizedBox(height: 20.h),
                HomeOurProducts(),
                SizedBox(height: 40.h),
                HomeSell(),
                SizedBox(height: 40.h),
                HomeRent(),
                SizedBox(height: 20.h),
                HomeAiDesign(),
              ],
            ),
          ),
          Positioned(
            top: 330.h,
            left: 16.w,
            right: 16.w,
            child: const GlobalSearchSuggestionBox(),
          ),
        ],
      ),
    );
  }
}

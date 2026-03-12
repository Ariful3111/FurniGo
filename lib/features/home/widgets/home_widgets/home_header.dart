import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_appbar.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_helper.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_search_filter.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360.h,
      width: MediaQuery.widthOf(context),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        image: DecorationImage(
          image: AssetImage(ImagesPath.home),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.low,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),
          HomeAppbar(),
          SizedBox(height: 40.h),
          CustomPrimaryText(
            text: 'Buy, Sell & Rent with Confidence'.toUpperCase(),
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteColor,
            shadow: [HomeHelper().boxShadow()],
          ),
          SizedBox(height: 4.h),
          CustomPrimaryText(
            text:
                'Shop new pieces, sell what you don\'t need, or rent flexibly\nfor home or business.',
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryBorderColor,
            shadow: [HomeHelper().boxShadow()],
          ),
          SizedBox(height: 28.h),
          HomeSearchFilter(),
        ],
      ),
    );
  }
}

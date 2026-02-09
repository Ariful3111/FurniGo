import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/rent_request/widgets/action_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:badges/badges.dart' as badges;

class CustomAppbar extends StatelessWidget {
  final String title;
  final VoidCallback onDrawerTap;
  const CustomAppbar({super.key, required this.title, required this.onDrawerTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onDrawerTap,
          child: Image.asset(IconsPath.drawer, height: 24.h, width: 24.w)),
        SizedBox(width: 8.w),
        CustomPrimaryText(text: title),
        Spacer(),
        ActionButton(icon: IconsPath.favorite, onTap: () {}),
        SizedBox(width: 8.w),
        badges.Badge(
          badgeStyle: badges.BadgeStyle(
            badgeGradient: badges.BadgeGradient.linear(
              begin: Alignment.center,
              end: Alignment.center,
              colors: [ Color(0xFFEF3929), Color(0xFFEF3929)],
            ),
          ),
          position: badges.BadgePosition.custom(start: 13, top: 5),
          child: ActionButton(icon: IconsPath.notification, onTap: () {},),
        ),
        SizedBox(width: 8.w),
      ],
    );
    // SliverAppBar(
    //   backgroundColor: Colors.transparent,
    //   titleSpacing: 0,
    //   automaticallyImplyLeading: false,
    //   title: Row(
    //     children: [
    //       Image.asset(IconsPath.drawer, height: 24.h, width: 24.w),
    //       SizedBox(width: 8.w),
    //       CustomPrimaryText(text: 'Rent'),
    //     ],
    //   ),
    //   actions: [
    //     ActionButton(icon: IconsPath.favorite, onTap: () {}),
    //     SizedBox(width: 8.w),
    //     badges.Badge(
    //       badgeStyle: badges.BadgeStyle(
    //         badgeGradient: badges.BadgeGradient.linear(
    //           begin: Alignment.center,
    //           end: Alignment.center,
    //           colors: [AppColors.primaryColor, AppColors.primaryColor],
    //         ),
    //       ),
    //       position: badges.BadgePosition.topStart(start: 25, top: -8),
    //       badgeContent: CustomPrimaryText(
    //         text: '1',
    //         fontSize: 8.sp,
    //         color: AppColors.whiteColor,
    //       ),
    //       child: ActionButton(icon: IconsPath.cart, onTap: () {}),
    //     ),
    //     SizedBox(width: 8.w),
    //   ],
    // );
  }
}

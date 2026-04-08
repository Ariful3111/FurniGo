import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/shop/widgets/shop_category_sort.dart';
import 'package:zb_dezign/features/shop/widgets/shop_header.dart';
import 'package:zb_dezign/features/shop/widgets/shop_product.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: isDark
            ? [AppColors.darkColor, AppColors.darkColor]
            : [AppColors.whiteColor, AppColors.whiteColor],
      ),
      child: ListView(
        children: [
          CustomAppbar(
            title: 'Shop Now',
            onDrawerTap: () {
              Navigator.pop(context);
            },
            icon: IconsPath.back,
          ),
          SizedBox(height: 16.h),
          ShopHeader(),
          SizedBox(height: 20.h),
          ShopCategorySort(),
          SizedBox(height: 20.h),
          ShopProduct(),
        ],
      ),
    );
  }
}

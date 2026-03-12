import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_sell_rent_decoration.dart';

class HomeRent extends StatelessWidget {
  const HomeRent({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeSellRentDecoration(
      crossAxisAlignment: CrossAxisAlignment.end,
      title: 'Flexible Furniture Rentals for Every Space',
      sub:
          'Smart furniture rental solutions tailored to adapt to your lifestyle and space.',
      buttonTitle: 'Request a Rent',
      onTap: () {
        Get.toNamed(AppRoutes.rentRequestView);
      },
      buttonWidth: 165.w,
      titleTextAlign: TextAlign.right,
      subTextAlign: TextAlign.right,
      image: ImagesPath.rent,
    );
  }
}

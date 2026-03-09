import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_sell_rent_decoration.dart';

class HomeSell extends StatelessWidget {
  const HomeSell({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeSellRentDecoration(
      crossAxisAlignment: CrossAxisAlignment.start,
      title: 'Sell. Quote. Get Paid.',
      sub: 'Sell quality pieces with smart pricing and hassle-free pickup.',
      buttonTitle: 'Sell Now',
      onTap: () {}, buttonWidth: 122.w, image: ImagesPath.sell,
    );
  }
}

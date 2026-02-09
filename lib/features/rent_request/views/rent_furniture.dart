import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/features/rent_request/widgets/page_count.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_furniture_widgets/rent_furniture_widgets.dart';

class RentFurniture extends StatelessWidget {
  const RentFurniture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SharedContainer(child: PageCount(text: 'Furniture Requirements')),
        SizedBox(height: 20.h),
        RentFurnitureWidgets(),
      ],
    );
  }
}

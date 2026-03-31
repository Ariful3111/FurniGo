import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_period_widgets/rent_period_discount.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_period_widgets/rent_period_optional.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_period_widgets/rent_period_type.dart';

class RentPeriod extends StatelessWidget {
  const RentPeriod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RentPeriodDiscount(),
        SizedBox(height: 20.h),
        RentPeriodType(),
        SizedBox(height: 20.h),
        RentPeriodOptional(),
      ],
    );
  }
}

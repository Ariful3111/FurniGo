import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/features/rent_request/widgets/page_count.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_appliance_widgets/rent_appliance_widgets.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class RentAppliance extends StatelessWidget {
  const RentAppliance({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SharedContainer(child: PageCount(text: 'Appliance')),
        SizedBox(height: 20.h),
        RentApplianceWidgets(),
      ],
    );
  }
}

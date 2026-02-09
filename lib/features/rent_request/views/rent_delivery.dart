import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/widgets/page_count.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_delivery_widgets/rent_delivery_access.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_delivery_widgets/rent_delivery_date.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_delivery_widgets/rent_delivery_details.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_delivery_widgets/rent_delivery_field.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentDelivery extends StatelessWidget {
  const RentDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: PageCount(text: 'Delivery & Setup')),
          SizedBox(height: 20.h),
          propertyDivider(),
          SizedBox(height: 24.h),
          CustomPrimaryText(
            text: 'Delivery & Setup',
            fontWeight: FontWeight.w600,
            color: AppColors.darkColor,
          ),
          SizedBox(height: 26.h),
          CustomPrimaryText(
            text: 'Delivery address *',
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            color: AppColors.darkColor,
          ),
          SizedBox(height: 16.h),
          RentDeliveryField(),
          SizedBox(height: 26.h),
          CustomPrimaryText(
            text: 'Preferred Time of Service',
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: AppColors.titleTextColor,
          ),
          SizedBox(height: 4.h),
          CustomPrimaryText(
            text:
                'Please provide the dates and times you are available for us to respond.',
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            color: AppColors.titleTextColor,
          ),
          SizedBox(height: 12.h),
          RentDeliveryDate(),
          SizedBox(height: 26.h),
          RentDeliveryDetails(),
          SizedBox(height: 26.h),
          CustomPrimaryText(
            text: 'Access Detail',
            fontSize: 16.sp,
            color: AppColors.titleTextColor,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 16.h),
          RentDeliveryAccess(),
        ],
      ),
    );
  }
}

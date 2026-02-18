import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class PendingProperty extends StatelessWidget {
  const PendingProperty({super.key});

  @override
  Widget build(BuildContext context) {
    List type = [
      {'title': 'Property Type', 'value': 'Residential'},
      {'title': 'Property Use', 'value': 'Apartment'},
    ];
    var propertyAddress = [
      {
        'title': 'Property Address',
        'value': '25 Collins Street, Melbourne VIC 3000, Australia',
      },
      {'title': 'Property Size', 'value': '1235 sqm'},
      {
        'title': 'Space Breakdown',
        'value':
            'Reception / Waiting Area(2), Meeting / Conference Rooms (2), Private Offices (1), Utility Room(1), Staff Break Area (2)',
      },
    ];
    var propertyFloorPlan = [
      {'title': 'Office Floor', 'value': 'Length (1 sqm)*Width (1 sqm)'},
      {'title': 'Private Offices', 'value': 'Length (1 sqm)*Width (1 sqm)'},
      {'title': 'Kitchen', 'value': 'Length (1 sqm)*Width (1 sqm)'},
    ];
    return Column(
      children: [
        propertyDetails(data: type, title: 'Property Type', context: context),
        SizedBox(height: 20.h),
        propertyDetails(
          data: propertyAddress,
          title: 'Property details',
          context: context,
        ),
        SizedBox(height: 20.h),
        propertyDetails(
          data: propertyFloorPlan,
          title: 'Floorplan & dimensions',
          context: context,
        ),
      ],
    );
  }

  Widget propertyDetails({
    required List data,
    required String title,
    required BuildContext context,
  }) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: isDark ? AppColors.whiteColor : AppColors.darkTextColor,
        ),
        SizedBox(height: 20.h),
        DetailsRowModel( data: data),
        SizedBox(height: 20.h),
        Divider(
          color: isDark ? AppColors.darkBorderColor : AppColors.borderColor,
        ),
      ],
    );
  }
}

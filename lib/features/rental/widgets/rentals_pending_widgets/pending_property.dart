import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class PendingProperty extends GetWidget<RentalDetailsController> {
  const PendingProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final details = controller.rentalDetails.value;

    if (details == null) {
      return const SizedBox.shrink();
    }

    // Property Type section
    final propertyTypeData = [
      {'title': 'Property Type', 'value': details.propertyType ?? ''},
      {'title': 'Property Use', 'value': details.propertyUse ?? ''},
    ];

    // Property Address section
    final propertyAddressData = [
      {'title': 'Property Address', 'value': details.address ?? ''},
      {'title': 'Property Size', 'value': '${details.sizeSqm ?? 0} sqm'},
    ];

    // Space Breakdown section
    String spaceBreakdownValue = '';
    if (details.spaceBreakdown?.rooms != null &&
        details.spaceBreakdown!.rooms!.isNotEmpty) {
      spaceBreakdownValue = details.spaceBreakdown!.rooms!
          .map((room) => '${room.name} (${room.count})')
          .join(', ');
    }

    final propertyDetailsData = [...propertyAddressData];
    if (spaceBreakdownValue.isNotEmpty) {
      propertyDetailsData.add({
        'title': 'Space Breakdown',
        'value': spaceBreakdownValue,
      });
    }

    // Room Dimensions section
    List<Map<String, String>> floorPlanData = [];
    if (details.roomDimensions != null && details.roomDimensions!.isNotEmpty) {
      for (var dimension in details.roomDimensions!) {
        floorPlanData.add({
          'title': dimension.roomName ?? '',
          'value':
              'Length: ${dimension.length ?? ''}m × Width: ${dimension.width ?? ''}m',
        });
      }
    }

    return Column(
      children: [
        propertyDetails(
          data: propertyTypeData,
          title: 'Property Type',
          context: context,
        ),
        SizedBox(height: 20.h),
        propertyDetails(
          data: propertyDetailsData,
          title: 'Property details',
          context: context,
        ),
        if (floorPlanData.isNotEmpty) ...[
          SizedBox(height: 20.h),
          propertyDetails(
            data: floorPlanData,
            title: 'Floorplan & dimensions',
            context: context,
          ),
        ],
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
        DetailsRowModel(data: data),
        SizedBox(height: 20.h),
        Divider(
          color: isDark ? AppColors.darkBorderColor : AppColors.borderColor,
        ),
      ],
    );
  }
}

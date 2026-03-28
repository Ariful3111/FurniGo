import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rental/controllers/rental_details_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/details_row_model.dart';

class PendingProperty extends StatelessWidget {
  const PendingProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RentalDetailsController>();
    final rentalDetails = controller.rentalDetails.value;

    if (rentalDetails == null) {
      return const SizedBox.shrink();
    }

    final propertyType = rentalDetails.propertyType ?? 'N/A';
    final propertyUse = rentalDetails.propertyUse ?? 'N/A';
    final address = rentalDetails.address ?? 'N/A';
    final sizeSqm = rentalDetails.sizeSqm ?? 0;

    final spaceBreakdown = rentalDetails.spaceBreakdown;
    final rooms = spaceBreakdown?.rooms ?? [];

    final roomDimensions = rentalDetails.roomDimensions ?? [];

    final type = [
      {'title': 'Property Type', 'value': propertyType},
      {'title': 'Property Use', 'value': propertyUse},
    ];

    final propertyAddress = [
      {'title': 'Property Address', 'value': address},
      {'title': 'Property Size', 'value': '$sizeSqm sqm'},
      {
        'title': 'Space Breakdown',
        'value': rooms.map((room) => '${room.name} (${room.count})').join(', '),
      },
    ];

    final propertyFloorPlan = roomDimensions
        .map(
          (dimension) => {
            'title': dimension.roomName ?? 'Room',
            'value':
                'Length: ${dimension.length ?? 'N/A'}m * Width: ${dimension.width ?? 'N/A'}m',
          },
        )
        .toList();

    return Column(
      children: [
        propertyDetails(data: type, title: 'Property Type', context: context),
        SizedBox(height: 20.h),
        propertyDetails(
          data: propertyAddress,
          title: 'Property details',
          context: context,
        ),
        if (propertyFloorPlan.isNotEmpty) ...[
          SizedBox(height: 20.h),
          propertyDetails(
            data: propertyFloorPlan,
            title: 'Floorplan & dimensions',
            context: context,
          ),
        ],
      ],
    );
  }

  Widget propertyDetails({
    required List<Map<String, String>> data,
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_property_details_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/page_count.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_add_button.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_property_widgets/property_details_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_property_widgets/property_details_field.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentPropertyDetailsView extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const RentPropertyDetailsView({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    RentPropertyDetailsController rentPropertyDetailsController = Get.find();
    return SharedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: PageCount(text: 'Property Details')),
          SizedBox(height: 20.h),
          CustomDivider(),
          SizedBox(height: 24.h),
          CustomPrimaryText(
            text: 'Property Details',
            fontWeight: FontWeight.w600,
            color: AppColors.darkColor,
          ),
          SizedBox(height: 20.h),
          PropertyDetailsField(formKey: formKey,),
          SizedBox(height: 20.h),
          CustomPrimaryText(
            text: 'Space Breakdown',
            fontSize: 16.sp,
            color: AppColors.darkTextColor,
          ),
          SizedBox(height: 16.h),
          ...List.generate(
            rentPropertyDetailsController.spaceBreakdown.length,
            (index) {
              return Obx(() {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom:
                        rentPropertyDetailsController.spaceBreakdown.length -
                                1 ==
                            index
                        ? 0.h
                        : 24.h,
                  ),
                  child: PropertyDetailsContainer(
                    isChecked: rentPropertyDetailsController.isChecked[index],
                    onChange: (value) {
                      rentPropertyDetailsController.isChecked[index] = value!;
                    },
                    title: rentPropertyDetailsController.spaceBreakdown[index],
                    onAdd: () {
                      rentPropertyDetailsController.counts[index]++;
                    },
                    onRemoved: () {
                      if (rentPropertyDetailsController.counts[index] > 0) {
                        rentPropertyDetailsController.counts[index]--;
                      }
                    },
                    count: rentPropertyDetailsController.counts[index]
                        .toString(),
                    isOther:
                        rentPropertyDetailsController.spaceBreakdown[index] ==
                        'other',
                    otherController:
                        rentPropertyDetailsController.otherFieldController,
                    readOnly: rentPropertyDetailsController.isChecked[index],
                  ),
                );
              });
            },
          ),
          SizedBox(height: 20.h),
          PropertyAddButton(text: 'Add Space', onTap: () {}),
        ],
      ),
    );
  }
}

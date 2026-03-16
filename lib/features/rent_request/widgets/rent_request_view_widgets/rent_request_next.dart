import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_request_controller.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_property_type_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_submit_dialog.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class RentRequestNext extends GetWidget<RentRequestController> {
  const RentRequestNext({super.key});

  @override
  Widget build(BuildContext context) {
    RentPropertyTypeController propertyTypeController = Get.find();
    return Obx(() {
      final isLast =
          controller.currentIndex.value < controller.rentWidgets.length - 1;
      return controller.currentIndex.value == controller.rentWidgets.length - 1
          ?RentHelper().myButton(
              color: AppColors.acceptButtonColor,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => RentSubmitDialog(),
                );
              },
              child: CustomPrimaryText(
                text: 'Submit Request',
                fontSize: 14.sp,
                color: AppColors.whiteColor,
              ),
            )
          : RentHelper().myButton(
              color: AppColors.primaryColor,
              onTap: () {
                if (controller.currentIndex.value == 0) {
                  if (controller.formKey.currentState!.validate()) {
                    controller.currentIndex.value++;
                  }
                } else if (controller.currentIndex.value == 1) {
                  if (propertyTypeController
                      .selectedPropertyType
                      .value
                      .isEmpty) {
                    ErrorSnackbar.show(
                      description: 'Please select Property Type',
                    );
                  } else if (propertyTypeController
                      .selectedPropertyUse
                      .value
                      .isEmpty) {
                    ErrorSnackbar.show(
                      description: 'Please select Property Use',
                    );
                  } else {
                    controller.currentIndex.value++;
                  }
                } else if (controller.currentIndex.value == 2) {
                  if (controller.formKey.currentState!.validate()) {
                    controller.currentIndex.value++;
                  }
                } else if (isLast) {
                  controller.rentController.animateTo(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                    controller.rentController.position.minScrollExtent,
                  );
                  controller.currentIndex.value++;
                }
              },
              child: Row(
                children: [
                  CustomPrimaryText(
                    text: 'Next',
                    fontSize: 14.sp,
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(width: 6.w),
                  Icon(
                    Icons.arrow_forward,
                    size: 12.r,
                    color: AppColors.whiteColor,
                  ),
                ],
              ),
            );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_business_identification_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_business_widgets/rent_business_identification_header.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_business_widgets/rent_business_next.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_helper.dart';
import 'package:zb_dezign/features/rent_request/widgets/step_count.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentBusinessIdentification extends StatelessWidget {
  const RentBusinessIdentification({super.key});

  @override
  Widget build(BuildContext context) {
    RentBusinessIdentificationController controller = Get.find();
    return CustomContainer(
      child: ListView(
        controller: controller.rentController,
        children: [
          SizedBox(height: 20.h,),
          CustomAppbar(title: 'Rent', onDrawerTap: () {}),
          SizedBox(height: 32.h),
          RentBusinessIdentificationHeader(),
          SizedBox(height: 16.h),
          Obx(() => controller.rentWidgets[controller.currentIndex.value]),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              myButton(
                border: Border.all(color: AppColors.buttonBorderColor, width: 1.r),
                onTap: () {
                  if (controller.currentIndex.value > 0) {
                    controller.rentController.animateTo(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                    controller.rentController.position.minScrollExtent,
                  );
                    controller.currentIndex.value--;
                  }
                },
                child: CustomPrimaryText(
                  text: 'Previous',
                  fontSize: 12.sp,
                  color: AppColors.labelColor,
                ),
              ),
              Obx(
                () => controller.currentIndex.value > 0
                    ? StepCount()
                    : SizedBox.shrink(),
              ),
              RentBusinessNext(),
            ],
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

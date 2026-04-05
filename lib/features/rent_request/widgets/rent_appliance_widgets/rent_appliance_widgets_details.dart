import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_appliance_controller.dart';
import 'package:zb_dezign/features/rent_request/models/rent_appliance_model.dart';
import 'package:zb_dezign/features/rent_request/widgets/add_item_dialog.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_add_button.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_details_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentApplianceWidgetsDetails extends GetWidget<RentApplianceController> {
  final RentApplianceModel model;
  const RentApplianceWidgetsDetails({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
        bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          CustomPrimaryText(
            text: 'Selected Appliance:',
            fontSize: 14.sp,
            color: isDark? AppColors.whiteColor: AppColors.darkColor,
          ),
          SizedBox(height: 12.h),
          ...List.generate(model.applianceItems.length, (index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: model.applianceItems.length - 1 == index ? 0.h : 13.h,
              ),
              child: PropertyDetailsContainer(
                subTitle: 'Quantity',
                isChecked: model.isChecked[index],
                onChange: (value) {
                  model.isChecked[index] = value!;
                },
                title: model.applianceItems[index],
                onAdd: () {
                  model.counts[index]++;
                },
                onRemoved: () {
                  if (model.counts[index] > 0) {
                    model.counts[index]--;
                  }
                },
                count: model.counts[index].toString(),
                readOnly: model.isChecked[index],
                onClose: () {
                  controller.removeApplianceItemFromModel(model, index);
                },
              ),
            );
          }),
          SizedBox(height: 16.h),
          PropertyAddButton(
            text: 'Add More',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AddItemDialog(
                  onTap: () {
                    final text = controller.itemController.text.trim();
                    if (text.isEmpty) {
                      return;
                    }
                    controller.addApplianceItemToModel(model, text);
                    controller.itemController.clear();
                    Navigator.pop(context);
                  },
                  controller: controller.itemController,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

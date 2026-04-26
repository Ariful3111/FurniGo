import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_furniture_controller.dart';
import 'package:zb_dezign/features/rent_request/models/rent_furniture_model.dart';
import 'package:zb_dezign/features/rent_request/widgets/add_item_dialog.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_add_button.dart';
import 'package:zb_dezign/features/rent_request/widgets/property_details_container.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_furniture_widgets/rent_furniture_preference.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_dialog_animation.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentFurnitureDetails extends GetWidget<RentFurnitureController> {
  final RentFurnitureModel model;
  const RentFurnitureDetails({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(model.furnitureItems.length, (index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: model.furnitureItems.length - 1 == index ? 0.h : 13.h,
              ),
              child: PropertyDetailsContainer(
                subTitle: 'Quantity',
                isChecked: model.isChecked[index],
                onChange: (value) {
                  model.isChecked[index] = value!;
                },
                title: model.furnitureItems[index],
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
                  controller.removeFurnitureItemFromModel(model, index);
                },
              ),
            );
          }),
          SizedBox(height: 16.h),
          PropertyAddButton(
            text: 'Add More',
            onTap: () {
              CustomDialogAnimation().showAnimatedDialog(
                context: context,
                dialog: AddItemDialog(
                  controller: controller.itemController,
                  onTap: () {
                    final text = controller.itemController.text.trim();
                    if (text.isEmpty) {
                      return;
                    }
                    controller.addFurnitureItemToModel(model, text);
                    controller.itemController.clear();
                    Navigator.pop(context);
                  },
                ),
                isDark: isDark,
              );
            },
          ),
          SizedBox(height: 20.h),
          CustomPrimaryText(
            text: 'Preference:',
            fontSize: 14.sp,
            color: isDark ? AppColors.whiteColor : AppColors.darkColor,
          ),
          SizedBox(height: 12.h),
          RentFurniturePreference(model: model),
        ],
      ),
    );
  }
}

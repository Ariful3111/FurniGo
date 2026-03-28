import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_photos_controller.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_helper.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_photos_widgets/proof_of_purchase_field.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_photos_widgets/proof_of_purchase_header.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProofOfPurchase extends StatelessWidget {
  const ProofOfPurchase({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellFlowPhotosController>(
      init: SellFlowPhotosController(),
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SharedContainer(
              padding: EdgeInsets.all(16.r),
              border: Border.all(width: 1, color: AppColors.primaryBorderColor),
              radius: 16.r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProofOfPurchaseHeader(),
                  Obx(
                    () => AnimatedSize(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: controller.isExpanded.value
                          ? ProofOfPurchaseField()
                          : SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            SellFlowHelper().warningBox(
              title: 'Why upload receipts?',
              subtitle:
                  'Receipts help us verify authenticity, brand, and original value, which can result in a higher quote.',
            ),
          ],
        );
      },
    );
  }
}

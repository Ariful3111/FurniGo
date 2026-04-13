import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_add_payment_dialog_card.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_add_payment_dialog_form.dart';
import 'package:zb_dezign/shared/widgets/custom_dialog/custom_add_payment_dialog_header.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CustomAddPaymentDialog extends StatelessWidget {
  final TextEditingController cardController;
  final TextEditingController expiryDateController;
  final TextEditingController cvvController;
  final VoidCallback onTap;
  const CustomAddPaymentDialog({
    super.key,
    required this.cardController,
    required this.expiryDateController,
    required this.cvvController, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SharedContainer(
        height: 450.h,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAddPaymentDialogHeader(),
              SizedBox(height: 20.h),
              CustomAddPaymentDialogForm(
                cardController: cardController,
                expiryDateController: expiryDateController,
                cvvController: cvvController,
              ),
              SizedBox(height: 20.h),
              CustomAddPaymentDialogCard(),
              SizedBox(height: 20.h),
              CustomPrimaryButton(text: 'Save', onPressed:onTap),
            ],
          ),
        ),
      ),
    );
  }
}

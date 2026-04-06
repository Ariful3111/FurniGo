import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/cart/widgets/checkout_view_widgets/checkout_address.dart';
import 'package:zb_dezign/features/cart/widgets/checkout_view_widgets/checkout_form.dart';
import 'package:zb_dezign/features/cart/widgets/checkout_view_widgets/checkout_order_summery.dart';
import 'package:zb_dezign/features/cart/widgets/checkout_view_widgets/checkout_pay_button.dart';
import 'package:zb_dezign/features/cart/widgets/checkout_view_widgets/checkout_payment.dart';
import 'package:zb_dezign/features/cart/widgets/checkout_view_widgets/checkout_shipping.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: isDark
            ? [AppColors.darkColor, AppColors.darkColor]
            : [AppColors.whiteColor, AppColors.whiteColor],
      ),
      child: ListView(
        children: [
          CustomAppbar(
            title: 'Checkout',
            onDrawerTap: () {
              Navigator.pop(context);
            },
            icon: IconsPath.back,
          ),
          SizedBox(height: 24.h),
          CustomPrimaryText(
            text: 'Delivery Address',
            fontWeight: FontWeight.w600,
            color: AppColors.buttonTextColor,
          ),
          SizedBox(height: 24.h),
          //CheckoutForm(),
          CheckoutAddress(),
          SizedBox(height: 24.h),
          CheckoutShipping(),
          SizedBox(height: 20.h),
          CheckoutPayment(),
          SizedBox(height: 20.h,),
          CheckoutOrderSummery(),
          SizedBox(height: 20.h,),
          CheckoutPayButton(),
          SizedBox(height: 40.h,)
        ],
      ),
    );
  }
}

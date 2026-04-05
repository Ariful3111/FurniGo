import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_cart.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_description.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_offer.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_rating.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_rent.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_review.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_room.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_tab.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_view_header.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/product_details_view_image.dart';
import 'package:zb_dezign/features/product_details.dart/widgets/product_details_view_widgets/related_products.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppColors.darkColor : AppColors.whiteColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            controller: controller.productScrollController,
            children: [
              ProductDetailsViewHeader(),
              SizedBox(height: 12.h),
              ProductDetailsViewImage(),
              SizedBox(height: 16.h),
              ProductDetailsDescription(),
              SizedBox(height: 12.h),
              ProductDetailsTab(),
              SizedBox(height: 12.h),
              ProductDetailsOffer(),
              SizedBox(height: 12.h),
              ProductDetailsRent(),
              SizedBox(height: 20.h),
              ProductDetailsRoom(),
              SizedBox(height: 40.h),
              ProductDetailsRating(),
              SizedBox(height: 12.h),
              ProductDetailsReview(),
              SizedBox(height: 40.h),
              RelatedProductsSection(),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Obx(() {
              return AnimatedSlide(
                duration: Duration(milliseconds: 300),
                offset: controller.isCartVisible.value
                    ? Offset(0, 0)
                    : Offset(0, 1.2),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: controller.isCartVisible.value ? 1 : 0,
                  child: ProductDetailsCart(),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

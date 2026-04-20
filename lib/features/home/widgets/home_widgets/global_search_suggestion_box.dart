import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/home/controller/global_search_controller.dart';
import 'package:zb_dezign/features/home/models/products_model.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class GlobalSearchSuggestionBox extends GetWidget<GlobalSearchController> {
  final Function(Product)? onProductTap;

  const GlobalSearchSuggestionBox({super.key, this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Only show if search field is not empty and has content
      if (!controller.showSuggestions.value) {
        return const SizedBox.shrink();
      }

      return Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          margin: EdgeInsets.only(top: 8.h),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withValues(alpha: 0.25),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Loading indicator
              if (controller.isLoading.value)
                _buildLoadingState()
              // Show results if available
              else if (controller.searchResults.value != null &&
                  controller.searchResults.value!.data.isNotEmpty)
                _buildSearchResults(controller.searchResults.value!.data)
              // Show empty state
              else if (controller.searchText.value.isNotEmpty &&
                  !controller.isLoading.value)
                _buildEmptyState()
              else
                const SizedBox.shrink(),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildLoadingState() {
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: Center(
        child: SizedBox(
          width: 24.w,
          height: 24.h,
          child: CircularProgressIndicator(
            strokeWidth: 2.r,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.labelColor),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults(List<Product> products) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 400.h),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        itemCount: products.length > 10 ? 10 : products.length,
        separatorBuilder: (context, index) =>
            Divider(height: 1.h, thickness: 1, color: AppColors.borderColor),
        itemBuilder: (context, index) {
          final product = products[index];
          return _buildProductItem(product);
        },
      ),
    );
  }

  Widget _buildProductItem(Product product) {
    return InkWell(
      onTap: () {
        if (onProductTap != null) {
          onProductTap!(product);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            // Product Image
            _buildProductImage(product),
            SizedBox(width: 12.w),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomPrimaryText(
                    text: product.name ?? '',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkColor,
                    maxLine: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  CustomPrimaryText(
                    text: product.categoryName ?? '',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.labelColor,
                  ),
                  SizedBox(height: 4.h),
                  CustomPrimaryText(
                    text: '\$${(product.finalPrice ?? 0).toStringAsFixed(2)}',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkColor,
                  ),
                ],
              ),
            ),
            // Favorite Icon
            if (product.isFavourite)
              Icon(Icons.favorite, color: Colors.red, size: 18.sp),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(Product product) {
    // Get the primary image or first image
    String? imageUrl;
    if (product.media?.isNotEmpty == true) {
      final primaryMedia = product.media?.firstWhere(
        (media) => media.isPrimary ?? false,
        orElse: () => product.media!.first,
      );
      imageUrl = primaryMedia?.url;
    }

    return Container(
      width: 60.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.fieldBorderColorLight,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: imageUrl != null
            ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return _buildPlaceholderIcon();
                },
              )
            : _buildPlaceholderIcon(),
      ),
    );
  }

  Widget _buildPlaceholderIcon() {
    return Center(
      child: Icon(
        Icons.chair_outlined,
        size: 28.sp,
        color: AppColors.labelColor,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search_off_outlined,
              size: 48.sp,
              color: AppColors.labelColor,
            ),
            SizedBox(height: 12.h),
            CustomPrimaryText(
              text: 'No products found',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.darkColor,
            ),
            SizedBox(height: 4.h),
            CustomPrimaryText(
              text: 'Try a different search term',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.labelColor,
            ),
          ],
        ),
      ),
    );
  }
}

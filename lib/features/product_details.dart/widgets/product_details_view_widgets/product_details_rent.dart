import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProductDetailsRent extends StatelessWidget {
  const ProductDetailsRent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Visualize before you rent or buy',
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.darkTextColor,
          ),
          SizedBox(height: 12.h),
          SharedContainer(
            padding: EdgeInsets.zero,
            height: 370.h,
            width: MediaQuery.widthOf(context),
            image: DecorationImage(
              image: AssetImage(ImagesPath.product),
              fit: BoxFit.cover,
            ),
            child: Stack(
              children: [
                _buildTopRightButton(),

                _buildBottomControls(),

                _buildColorOptions(),

                _buildSideArrows(),

                _buildFooterText(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopRightButton() {
    return Positioned(
      top: 20.h,
      right: 20.w,
      child: _circleButton(
        size: 40,
        color: Colors.white.withValues(alpha: 0.1),
        icon: IconsPath.favorite,
        iconColor: AppColors.whiteColor,
        onTap: () {},
      ),
    );
  }

  Widget _buildBottomControls() {
    return Positioned(
      bottom: 20.h,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _circleButton(
            icon: IconsPath.delete,
            onTap: () {},
            iconColor: AppColors.darkColor,
          ),
          SizedBox(width: 20.w),
          _circleButton(
            size: 48,
            color: AppColors.secondaryColor,
            icon: IconsPath.add,
            iconColor: Colors.white,
            onTap: () {},
          ),
          SizedBox(width: 20.w),
          _circleButton(icon: IconsPath.fabric, onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildColorOptions() {
    final colors = [
      const Color(0xFFA69686),
      const Color(0xFFE59421),
      const Color(0xFFB22E28),
      const Color(0xFF9F8E7D),
    ];

    return Positioned(
      top: 150.h,
      left: 80.w,
      child: Row(
        children: List.generate(colors.length, (index) {
          return Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: _colorDot(color: colors[index], isSelected: index == 0),
          );
        }),
      ),
    );
  }

  Widget _buildSideArrows() {
    return Positioned(
      bottom: 100.h,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _circleButton(
              color: AppColors.borderColor,
              icon: IconsPath.swap,
              onTap: () {},
            ),
            _circleButton(
              color: AppColors.borderColor,
              icon: IconsPath.scan,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterText() {
    return Positioned(
      bottom: 8.h,
      left: 12.w,
      child: CustomPrimaryText(
        text: 'AI room design',
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
      ),
    );
  }

  Widget _circleButton({
    double size = 40,
    Color color = Colors.white,
    required String icon,
    Border? border,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.w,
        height: size.w,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: border ?? Border.all(color: AppColors.whiteColor),
        ),
        child: Center(
          child: Image.asset(icon, height: 20.h, width: 20.w, color: iconColor),
        ),
      ),
    );
  }

  Widget _colorDot({required Color color, bool isSelected = false}) {
    return Container(
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: AppColors.whiteColor) : null,
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 6.w,
                height: 6.w,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : null,
    );
  }
}

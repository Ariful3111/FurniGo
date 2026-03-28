import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  final PreferredSizeWidget? appbar;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? drawer;
  final Widget? bottomNav;
  final bool transparentScaffold;
  const CustomContainer({
    super.key,
    required this.child,
    this.gradient,
    this.appbar,
    this.padding,
    this.margin,
    this.drawer,
    this.bottomNav,
    this.transparentScaffold = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final container = Container(
      margin: margin,
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
      height: MediaQuery.heightOf(context),
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        gradient: isDark
            ? gradient ??
                  LinearGradient(
                    colors: [AppColors.darkColor, AppColors.darkTextColor],
                  )
            : gradient ?? AppColors.primaryBG,
      ),
      child: SafeArea(child: child),
    );

    if (transparentScaffold) {
      return container;
    }

    return Scaffold(
      appBar: appbar,
      drawer: drawer,
      bottomNavigationBar: bottomNav,
      backgroundColor: Colors.transparent,
      body: container,
    );
  }
}

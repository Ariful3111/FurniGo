import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/glass_button.dart';

class AiProductPlacementRegenerateButton extends StatelessWidget {
  const AiProductPlacementRegenerateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                    children: [
                      GlassButton(
                        height: 36.h,
                        width: 90.w,
                        radius: 50.r,
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              IconsPath.export,
                              width: 16.w,
                              height: 16.h,
                            ),
                            SizedBox(width: 4.w),
                            CustomPrimaryText(
                              text: 'Export',
                              fontSize: 12.sp,
                              color: AppColors.whiteColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      GlassButton(
                        height: 36.h,
                        width: 80.w,
                        radius: 50.r,
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              IconsPath.save,
                              width: 16.w,
                              height: 16.h,
                            ),
                            SizedBox(width: 4.w),
                            CustomPrimaryText(
                              text: 'Save',
                              fontSize: 12.sp,
                              color: AppColors.whiteColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
  }
}
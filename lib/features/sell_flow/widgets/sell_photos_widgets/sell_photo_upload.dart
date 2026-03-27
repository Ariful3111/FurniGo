import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SellPhotoUpload extends StatelessWidget {
  final String title;
  final XFile? image;
  final VoidCallback onTap;
  const SellPhotoUpload({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomPrimaryText(
          text: title,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: SharedContainer(
            height: 110,
              radius: 8.r,
              padding: EdgeInsets.zero,
              border: Border.all(color: AppColors.borderColor),
            child: image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(image!.path),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconsPath.camera, height: 20.h, width: 20.w),
                        SizedBox(height: 4),
                        CustomPrimaryText(
                          text: "Click to upload",
                          fontSize: 10,
                          color: AppColors.secondaryTextColor,
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

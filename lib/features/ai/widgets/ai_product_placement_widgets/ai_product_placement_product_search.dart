import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';

class AiProductPlacementProductSearch {
  Widget aiPlacementField({required TextEditingController controller}) {
    return SizedBox(
      width: 130.w,
      height: 30.h,
      child: TextFormField(
        controller: controller,
        
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4.r),
          suffixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
          suffixIcon: Image.asset(
            IconsPath.aiSearch,
            width: 20.w,
            height: 20.h,
          ),
        ),
      ),
    );
  }
}

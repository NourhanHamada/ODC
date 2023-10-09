import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

class CustomBottomSheet extends StatelessWidget {
  String description;
  String name;
  CustomBottomSheet({super.key, required this.description, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeCubit.get(context).isDark?darkBackground:white,
      padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 40.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0.h),
          Center(
            child: Container(
              width: 150.h,
              height: 4.h,
              decoration: BoxDecoration(
                color: grey400,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                  color: grey400,
                  width: 2.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 13.0.h),
          CustomText(
            text: name,
            fontSize: textFont20.sp,
            textAlign: TextAlign.start,
            color: mainColor,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 16.0.h),
          CustomText(
            text: description,
            fontSize: textFont14.sp,
            textAlign: TextAlign.start,
            color: grey800,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

class MyCoursesCard extends StatelessWidget {
  const MyCoursesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
        side: BorderSide(
          color: (ThemeCubit.get(context).isDark) ? darkButton : grey100,
          width: 2.0,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: (ThemeCubit.get(context).isDark) ? darkButton : grey100,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: (ThemeCubit.get(context).isDark) ? darkButton : grey100,
            width: 2.0,
          ),
        ),
        width: context.screenWidth / 1.8,
        height: 126.h,
        child: Padding(
          padding: EdgeInsets.only(
              top: 16.h, bottom: 16.h, left: 13.13.w, right: 9.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'UI/UX',
                fontSize: textFont16.sp,
                textAlign: TextAlign.center,
                color: (ThemeCubit.get(context).isDark) ? grey300 : grey800,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                text: 'Fundamentals',
                fontSize: textFont16.sp,
                textAlign: TextAlign.center,
                color: (ThemeCubit.get(context).isDark) ? grey300 : grey800,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 11.h),
              CustomText(
                text: 'Overall progress 15%',
                fontSize: 10.sp,
                textAlign: TextAlign.center,
                color: (ThemeCubit.get(context).isDark) ? grey300 : grey800,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 4.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: const LinearProgressIndicator(
                  value: 0.15,
                  backgroundColor: grey600,
                  valueColor: AlwaysStoppedAnimation<Color>(mainColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

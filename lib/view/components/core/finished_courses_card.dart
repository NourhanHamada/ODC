import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:odc_offline/view/components/core/buttons/main_button.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view/screens/dashboard/finished_course_details.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

class FinishedCoursesCard extends StatelessWidget {
  const FinishedCoursesCard({super.key});

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
          height: 247.h,
          width: 193.w,
          child: Padding(
              padding: EdgeInsets.only(top: 16.h, right: 16.h, left: 16.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        courseImage,
                        width: 199.0.w,
                        height: 107.0.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomText(
                      text: 'Web Development',
                      fontSize: textFont16.sp,
                      textAlign: TextAlign.center,
                      color:
                          (ThemeCubit.get(context).isDark) ? grey300 : grey800,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: 16.h),
                    MainButton(
                        title: 'View Details',
                        onTap: () {
                          context.push(FinishedCourseDetailsScreen());
                        }),
                  ]))),
    );
  }
}

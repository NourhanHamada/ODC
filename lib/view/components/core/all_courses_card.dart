import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/components/core/buttons/main_button.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view/screens/course_screens/course_details_screen.dart';
import 'package:odc_offline/view_model/cubit/home/home_cubit.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

class AllCoursesCard extends StatelessWidget {
  int index;
  AllCoursesCard({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit=HomeCubit.get(context);
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
        // height: 247.h,
        width: context.screenWidth / 1.8,
        child: Padding(
          padding: EdgeInsets.only(top: 16.h, right: 16.h, left: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                text: homeCubit.allCoursesList[index]['name'],
                fontSize: textFont16,
                textAlign: TextAlign.center,
                color: (ThemeCubit.get(context).isDark) ? grey300 : black,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 4.h),
              Row(children: [
                CustomText(
                  text: homeCubit.allCoursesList[index]['courseStatus'],
                  fontSize: textFont14,
                  textAlign: TextAlign.center,
                  color: mainColor,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: 8.w),
                SvgPicture.asset(
                  clockIcon,
                  // height: 16.h,
                  // width: 16.w,
                  colorFilter: ColorFilter.mode(
                      ThemeCubit.get(context).isDark
                          ? grey300
                          : grey600,
                      BlendMode.srcIn),
                  // color: (ThemeCubit.get(context).isDark) ? grey300 : grey600,
                ),
                SizedBox(width: 4.w),
                CustomText(
                  text: '14 days',
                  fontSize: textFont14,
                  textAlign: TextAlign.center,
                  color: (ThemeCubit.get(context).isDark) ? grey300 : black,
                  fontWeight: FontWeight.w400,
                ),
              ]),
              SizedBox(height: 8.h),
              MainButton(
                title: 'Enroll Now',
                onTap: () {
                  context.push(CourseDetailsScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

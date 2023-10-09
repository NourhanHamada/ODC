import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of(context, listen: true);
    return GestureDetector(
      onTap: (){
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: BorderSide(
            color: themeCubit.isDark ? darkButton : grey100,
            width: 2.0,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: themeCubit.isDark ? darkButton : grey100,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: themeCubit.isDark ? darkButton : grey100,
              width: 2.0,
            ),
          ),
          width: context.screenWidth / 1.8,
          // height: 120,
          child: Padding(
            padding: EdgeInsets.only(
                top: 33.5.h, bottom: 33.5.h,
                left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    activityImage,
                    width: 159.0.w,
                    height: 107.0.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.h),
                CustomText(
                  text: 'Coding Diploma',
                  fontSize: textFont16,
                  textAlign: TextAlign.center,
                  color: themeCubit.isDark ? grey300 : grey800,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    CustomText(
                      text: 'Online',
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
                      colorFilter: ColorFilter.mode(themeCubit.isDark ? grey300 : grey800 , BlendMode.srcIn),
                      // color: (ThemeCubit.get(context).isDark) ? grey300 : grey800,
                    ),
                    SizedBox(width: 4.w),
                    CustomText(
                      text: '22-24 Hrs',
                      fontSize: textFont14,
                      textAlign: TextAlign.center,
                      color: themeCubit.isDark ? grey300 : grey800,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

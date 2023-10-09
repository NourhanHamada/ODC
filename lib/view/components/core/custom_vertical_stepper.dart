// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

class CustomVerticalStepper extends StatelessWidget {
  int index;

  CustomVerticalStepper({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.circle,
          size: 8.h,
          color: (index>=0)?mainColor:ThemeCubit.get(context).isDark
                  ? grey800
                  : grey300,
        ),
        Container(
          width: 1.w,
          color: (index >= 1)
              ? mainColor
              :  ThemeCubit.get(context).isDark ? grey800 : grey300,
          height: 13.h,
        ),
        Icon(
          Icons.circle,
          size: 8.h,
          color: (index >= 1)
              ? mainColor
              : ThemeCubit.get(context).isDark
                  ? grey800
                  : grey300,
        ),
        Container(
          width: 1.w,
          color:  (index >= 2)
              ? mainColor
              : ThemeCubit.get(context).isDark ? grey800 : grey300,
          height: 13.h,
        ),
        Icon(
          Icons.circle,
          size: 8.h,
          color: (index >= 2)
              ? mainColor
              : ThemeCubit.get(context).isDark
                  ? grey800
                  : grey300,
        ),
        Container(
          width: 1.w,
          color:  (index >= 3)
              ? mainColor
              : ThemeCubit.get(context).isDark ? grey800 : grey300,
          height: 13.h,
        ),
        Icon(
          Icons.circle,
          size: 8.h,
          color: (index >= 3)
              ? mainColor
              : ThemeCubit.get(context).isDark
                  ? grey800
                  : grey300,
        ),
      ],
    );
  }
}

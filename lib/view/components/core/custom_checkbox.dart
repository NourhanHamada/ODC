// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;

  const CustomCheckbox({
    Key? key,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.0.w,
      height: 20.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: ThemeCubit.get(context).isDark ? darkButton : grey300,
      ),
      child: Icon(
        isChecked ? Icons.check : Icons.check_box_outline_blank,
        color: isChecked ? mainColor : Colors.transparent,
        size: 17.h,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/color_manager.dart';
import '../custom_text.dart';
import 'custom_button.dart';

//ignore: must_be_immutable
class MainButton extends StatelessWidget {
  MainButton({
    super.key,
    required this.title,
    required this.onTap,
    this.width,
    this.color,
  });

  final String title;
  final void Function()? onTap;
  double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      color: color ?? mainColor,
      onClick: onTap,
      width: width,
      title: CustomText(
        color: whiteColor,
        fontSize: width == 141.w ? 12 : 16,
        fontWeight: FontWeight.w600,
        text: title,
      ),
    );
  }
}

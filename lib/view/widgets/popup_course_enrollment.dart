import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import '../../view_model/cubit/theme/theme_cubit.dart';
import '../components/core/custom_text.dart';
import '../constant/assets.dart';
import '../constant/color_manager.dart';

class PopupCourseEnrollment extends StatelessWidget {
  const PopupCourseEnrollment({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    return AlertDialog(
      backgroundColor: themeCubit.isDark ? darkBackground : grey200,
      content: SizedBox(
          height: context.screenWidth / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                done,
                colorFilter: const ColorFilter.mode(
                  greenColor2,
                  BlendMode.srcIn,
                ),
              ),
              CustomText(
                textAlign: TextAlign.center,
                text: 'You\'ve Successfully Entered \n OTP code',
                color: themeCubit.isDark ? white : grey700,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ],
          )),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

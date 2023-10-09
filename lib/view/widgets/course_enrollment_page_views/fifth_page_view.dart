import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../view_model/cubit/theme/theme_cubit.dart';
import '../../components/core/custom_text.dart';
import '../../constant/assets.dart';
import '../../constant/color_manager.dart';

class FifthPageView extends StatelessWidget {
  const FifthPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 32.h,
            ),
            SvgPicture.asset(techIllustration),
            SizedBox(
              height: 48.h,
            ),
            CustomText(
              text: 'Check Mailbox',
              color: ThemeCubit.get(context).isDark ? white : black,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              width: 320.sp,
              child: CustomText(
                textAlign: TextAlign.center,
                text:
                    'An Email with the Exam Details Was Sent to you, Please check your Mail to start',
                color: grey600,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

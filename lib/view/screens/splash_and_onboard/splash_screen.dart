import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/components/core/scaffold_custom/scaffold_custom.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view_model/cubit/auth/login/login_cubit.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';
import '../../components/core/custom_text.dart';
import '../../constant/assets.dart';
import '../../constant/color_manager.dart';
import '../../constant/fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = BlocProvider.of(context, listen: true);
    return ScaffoldCustom(
      body: SizedBox(
        height: context.screenHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            //big circle
            Transform.scale(
              scale: 1.5.sp,
              child: Container(
                height: 657.h,
                width: 657.w,
                decoration: BoxDecoration(
                    color: ThemeCubit.get(context).isDark
                        ? darkBackground
                        : grey100,
                    shape: BoxShape.circle,
                    boxShadow: [
                      //inner shadow
                      BoxShadow(
                          offset: const Offset(10.05, 10.05),
                          blurRadius: 26.12,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),

                      BoxShadow(
                          offset: const Offset(10.05, -10.05),
                          blurRadius: 20.09,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),
                      BoxShadow(
                          offset: const Offset(-10.05, 10.05),
                          blurRadius: 20.09,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),

                      //drop shadow
                      BoxShadow(
                          offset: const Offset(-2.01, -2.01),
                          blurRadius: 4.02,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),
                      BoxShadow(
                          offset: const Offset(2.01, 2.01),
                          blurRadius: 4.02,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),
                    ]),
              ),
            ),

            //medium circle
            Transform.scale(
              scale: 1.2.sp,
              child: Container(
                height: 657.h,
                width: 657.w,
                decoration: BoxDecoration(
                    color: ThemeCubit.get(context).isDark
                        ? darkBackground
                        : grey100,
                    shape: BoxShape.circle,
                    boxShadow: [
                      //inner shadow
                      BoxShadow(
                          offset: const Offset(10.05, 10.05),
                          blurRadius: 26.12,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),
                      BoxShadow(
                          offset: const Offset(-10.05, -10.05),
                          blurRadius: 20.09,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),
                      BoxShadow(
                          offset: const Offset(10.05, -10.05),
                          blurRadius: 20.09,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),
                      BoxShadow(
                          offset: const Offset(-10.05, 10.05),
                          blurRadius: 20.09,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),

                      //drop shadow
                      BoxShadow(
                          offset: const Offset(-2.01, -2.01),
                          blurRadius: 4.02,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),
                      BoxShadow(
                          offset: const Offset(2.01, 2.01),
                          blurRadius: 4.02,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),
                    ]),
              ),
            ),

            //small circle
            Transform.scale(
              scale: 1.2.sp,
              child: Container(
                height: 350.0.h,
                width: 350.0.w,
                decoration: BoxDecoration(
                    color: ThemeCubit.get(context).isDark
                        ? darkBackground
                        : grey100,
                    shape: BoxShape.circle,
                    boxShadow: [
                      //inner shadow
                      BoxShadow(
                          offset: const Offset(7.8, 7.8),
                          blurRadius: 20.28,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),
                      BoxShadow(
                          offset: const Offset(-7.8, -7.8),
                          blurRadius: 15.6,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),
                      BoxShadow(
                          offset: const Offset(7.8, -7.8),
                          blurRadius: 15.6,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),
                      BoxShadow(
                          offset: const Offset(-7.8, 7.8),
                          blurRadius: 15.6,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),

                      //drop shadow
                      BoxShadow(
                          offset: const Offset(-1.56, -1.56),
                          blurRadius: 3.12,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),
                      BoxShadow(
                          offset: const Offset(1.56, 1.56),
                          blurRadius: 3.12,
                          color: ThemeCubit.get(context).isDark
                              ? darkShadow
                              : grey200),
                    ]),
              ),
            ),

            // progress right
            SizedBox(
              width: 290.w,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.bottomRight,
                      colors: [
                        primaryColor,
                        primaryColor.withOpacity(0.2),
                        primaryColor.withOpacity(0.1),
                        primaryColor.withOpacity(0.1),
                      ]).createShader(rect);
                },
                child: DashedCircularProgressBar.aspectRatio(
                  aspectRatio: 0.5,
                  progress: 49.93,
                  startAngle: 0,
                  sweepAngle: -360,
                  corners: StrokeCap.square,
                  animationCurve: Curves.linear,
                  animationDuration: const Duration(milliseconds: 4000),
                  foregroundStrokeWidth: 3.5,
                  backgroundStrokeWidth: 0,
                  circleCenterAlignment: Alignment.center,
                  foregroundColor: Colors.white,
                  backgroundColor: transparent,
                  animation: true,
                  onAnimationEnd: () {
                    loginCubit.getSeenData(context);
                    loginCubit.getUserDate();
                  },
                ),
              ),
            ),

            //progress left
            SizedBox(
              width: 290.w,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        primaryColor,
                        primaryColor.withOpacity(0.2),
                        primaryColor.withOpacity(0.1),
                        primaryColor.withOpacity(0.1),
                      ]).createShader(rect);
                },
                child: const DashedCircularProgressBar.aspectRatio(
                  aspectRatio: 0.5,
                  // width / height
                  progress: 49.90,
                  startAngle: 0,
                  sweepAngle: 358.5,
                  corners: StrokeCap.square,
                  animationCurve: Curves.linear,
                  animationDuration: Duration(milliseconds: 4000),
                  foregroundStrokeWidth: 3.5,
                  backgroundStrokeWidth: 0,
                  circleCenterAlignment: Alignment.center,
                  foregroundColor: Colors.white,
                  backgroundColor: transparent,
                  animation: true,
                ),
              ),
            ),

            Center(
              child: ThemeCubit.get(context).isDark
                  ? SvgPicture.asset(logo)
                  : Image.asset(
                      blackLogo,
                      width: 150.w,
                    ),
            ),

            //From + Software House
            Positioned(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //from
                  CustomText(
                    text: "From",
                    color: grey600,
                    fontWeight: FontWeight.w500,
                  ),

                  //Software House
                  CustomText(
                    text: "Software House",
                    color: primaryColor,
                    fontSize: btnFont16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

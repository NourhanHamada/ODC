import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../view_model/cubit/theme/theme_cubit.dart';
import '../constant/assets.dart';
import '../constant/color_manager.dart';

class ThemeModeAnimation extends StatefulWidget {
  const ThemeModeAnimation({super.key,});


  @override
  State<ThemeModeAnimation> createState() => _ThemeModeAnimationState();
}

class _ThemeModeAnimationState extends State<ThemeModeAnimation> {

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of(context, listen: true);
    return  GestureDetector(
      onTap: () {
        ThemeCubit.get(context).changeAppTheme();
        ThemeCubit.get(context).cashAppTheme(ThemeCubit.get(context).isDark);
      },
      child: Stack(
        children: [
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 4),
            width: 65,
            height: 35,
            decoration: BoxDecoration(
              color: themeCubit.isDark == false
                  ? darkBackground
                  : white,
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            child: Align(
              alignment: themeCubit.isDark == false
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: SvgPicture.asset(
                themeCubit.isDark == false ? moon2 : sun2,
                width: 26,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            left: themeCubit.isDark ? 35 : 8,
            top: 7,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                  color: mainColor, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../view_model/cubit/theme/theme_cubit.dart';
import '../components/core/custom_text.dart';
import '../constant/assets.dart';
import '../constant/color_manager.dart';

class ProfileScreenItems extends StatefulWidget {
  ProfileScreenItems({
    super.key,
    required this.prefixIcon,
    this.suffixIcon,
    required this.title,
    required this.onTap,
    this.isDelete,
  });

  final Widget prefixIcon;
  Widget? suffixIcon;
  final String title;
  final Function() onTap;
  final bool? isDelete;

  @override
  State<ProfileScreenItems> createState() => _ProfileScreenItemsState();
}

class _ProfileScreenItemsState extends State<ProfileScreenItems> {
  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = ThemeCubit.get(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: widget.onTap,
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (BuildContext context, state) {
          return  Container(
            decoration: BoxDecoration(
              color: themeCubit.isDark ? darkButton : grey200,
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: widget.prefixIcon,
                      ),
                      SizedBox(
                        width: 8.h,
                      ),
                      CustomText(
                        text: widget.title,
                        color: themeCubit.isDark ? white : grey900,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  Container(
                    child: widget.suffixIcon ?? SvgPicture.asset(arrowRight),
                  ),
                ],
              ),
            ),
          );
        },
        ),
      ),
    );
  }
}

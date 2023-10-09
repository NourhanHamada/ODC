import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';
import '../../constant/color_manager.dart';
import '../../constant/fonts.dart';
import 'custom_text.dart';

//used to make appbar in most of project
//ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);
  String title;
  Function? onPressed;
  bool showLeading;
  List<Widget> actions;
  Color colorAppBar;
  Color? colorTxtAppBar;
  Widget? leading;

  CustomAppBar({
    super.key,
    this.showLeading = true,
    this.title = " ",
    this.onPressed,
    this.colorAppBar = transparent,
    this.colorTxtAppBar = whiteColor,
    this.actions = const [],
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeCubit, ThemeState>(
        builder: (context, state) {
          var themeCubit = ThemeCubit.get(context);
          return AppBar(
            leading: leading ??
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: SvgPicture.asset(
                    arrowBack,
                  ),
                ),
            elevation: 0,
            backgroundColor: (themeCubit.isDark) ? darkBackground : colorAppBar,
            centerTitle: true,
            title: Padding(
              padding: EdgeInsets.only(top: 0.h),
              child: CustomText(
                text: title.tr().toString(),
                color: mainColor,
                fontSize: textFont16,
              ),
            ),
            actions: actions,
          );
        },
        listener: (context, state) {});
  }
}

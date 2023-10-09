import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view_model/cubit/notifications/notifications_cubit.dart';
import 'package:odc_offline/view_model/cubit/notifications/notifications_state.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

class CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  final Widget child;
  final bool showSeparator;

  CustomPopupMenuItem({
    super.key,
    required this.child,
    required T value,
    bool enabled = true,
    this.showSeparator = false,
  }) : super(
          value: value,
          enabled: enabled,
          child: SizedBox(
            height: 36.0.h,
            width: 141.w,
            child: child,
          ),
        );

  @override
  double get height => 36.0.h;

  double get width => 141.0.w;
}

class CustomPopupMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        final cubit = NotificationsCubit.get(context);
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8.0.r),
            topRight: Radius.circular(8.0.r),
          ),
          child: PopupMenuButton<String>(
            color: ThemeCubit.get(context).isDark ? buttonColor : white,
            padding: const EdgeInsets.all(0),
            elevation: 0,
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry<String>> items = [];
              for (int i = 0; i < cubit.menuItems.length; i++) {
                items.add(
                  CustomPopupMenuItem<String>(
                    value: cubit.menuItems[i],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: cubit.menuItems[i],
                              color: ThemeCubit.get(context).isDark
                                  ? grey300
                                  : grey900,
                              fontWeight: FontWeight.w400,
                              fontSize: textFont14.sp,
                            ),
                          ],
                        ),
                        if (i < cubit.menuItems.length - 1)
                          Container(
                            height: 0.5.h,
                            color: ThemeCubit.get(context).isDark
                                ? grey500
                                : grey900,
                          ),
                      ],
                    ),
                  ),
                );
              }
              return items;
            },
            onOpened: () {
              cubit.changeMenuButtonIconDown();
            },
            onSelected: (String value) {
              cubit.changeMenuButtonValue(value);
              cubit.changeMenuButtonIconUp();
            },
            onCanceled: () {
              cubit.changeMenuButtonIconUp();
            },
            offset: Offset(0, 36.0.h),
            child: Container(
              color: ThemeCubit.get(context).isDark ? buttonColor : white,
              width: 141.w,
              height: 36.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    CustomText(
                      text: cubit.menuButtonValue,
                      color: ThemeCubit.get(context).isDark ? grey300 : grey900,
                      fontWeight: FontWeight.w400,
                      fontSize: textFont14.sp,
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      cubit.menuButtonIcon,
                      height: 16.h,
                      width: 16.w,
                      color: ThemeCubit.get(context).isDark ? grey300 : grey900,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

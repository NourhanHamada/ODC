import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

class NotificationCard extends StatelessWidget {
  String type;
  bool isRead;
  NotificationCard({super.key, required this.type, required this.isRead});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: (ThemeCubit.get(context).isDark && isRead)
              ? darkButton
              : (ThemeCubit.get(context).isDark && !isRead)
                  ? grey900
                  : (!ThemeCubit.get(context).isDark && !isRead)
                      ? grey300
                      : white,
        ),
      ),
      child: Container(
          decoration: BoxDecoration(
            color: (ThemeCubit.get(context).isDark && isRead)
                ? darkButton
                : (ThemeCubit.get(context).isDark && !isRead)
                    ? grey900
                    : (!ThemeCubit.get(context).isDark && !isRead)
                        ? grey300
                        : white,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: (ThemeCubit.get(context).isDark && isRead)
                  ? darkButton
                  : (ThemeCubit.get(context).isDark && !isRead)
                      ? grey900
                      : (!ThemeCubit.get(context).isDark && !isRead)
                          ? grey300
                          : white,
            ),
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16.r,
                          backgroundColor: (ThemeCubit.get(context).isDark)
                              ? darkBackground
                              : grey100,
                          child: SvgPicture.asset(
                            (type == 'reminder')
                                ? calenderIcon
                                : (type == 'event')
                                    ? eventIcon
                                    : fireWorkIcon,
                            height: 16.h,
                            width: 16.w,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        CustomText(
                          text: (type == 'reminder')
                              ? 'Reminder'
                              : (type == 'event')
                                  ? 'Event'
                                  : 'Congratulations',
                          fontSize: textFont14.sp,
                          textAlign: TextAlign.center,
                          color: (ThemeCubit.get(context).isDark)
                              ? grey500
                              : grey900,
                          fontWeight: FontWeight.w500,
                        ),
                        Spacer(),
                        CustomText(
                          text: '24min ago',
                          fontSize: textFont12.sp,
                          textAlign: TextAlign.center,
                          color: (ThemeCubit.get(context).isDark)
                              ? grey500
                              : grey600,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomText(
                      text:
                          "You still have 3Hrs to apply for the course until the Course is Locked",
                      fontSize: textFont14.sp,
                      textAlign: TextAlign.start,
                      color:
                          (ThemeCubit.get(context).isDark) ? grey300 : grey800,
                      fontWeight: FontWeight.w400,
                    ),
                  ]))),
    );
  }
}

List notificationsList = [
  NotificationCard(
    type: 'reminder',
    isRead: true,
  ),
  NotificationCard(
    type: 'congratulations',
    isRead: false,
  ),
  NotificationCard(
    type: 'event',
    isRead: true,
  ),
  NotificationCard(
    type: 'congratulations',
    isRead: true,
  ),
  NotificationCard(
    type: 'reminder',
    isRead: false,
  ),
  NotificationCard(
    type: 'event',
    isRead: false,
  ),
  NotificationCard(
    type: 'congratulations',
    isRead: false,
  ),
  NotificationCard(
    type: 'reminder',
    isRead: true,
  ),
  NotificationCard(
    type: 'congratulations',
    isRead: true,
  ),
  NotificationCard(
    type: 'event',
    isRead: true,
  ),
  NotificationCard(
    type: 'reminder',
    isRead: true,
  ),
];

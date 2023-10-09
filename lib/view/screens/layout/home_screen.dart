import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/components/core/activity_card.dart';
import 'package:odc_offline/view/components/core/all_courses_card.dart';
import 'package:odc_offline/view/components/core/carouse_slider.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/components/core/my_courses_card.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/data.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view/screens/notifications/notification_screen.dart';
import 'package:odc_offline/view_model/cubit/home/home_cubit.dart';
import 'package:odc_offline/view_model/cubit/home/home_state.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ThemeCubit themeCubit = BlocProvider.of(context, listen: true);
    HomeCubit homeCubit = HomeCubit.get(context);

    return BlocConsumer<HomeCubit, HomeState>(
        builder: (context, state) => SingleChildScrollView(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    CustomText(
                      text: "Good Morning, ",
                      color: mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: textFont16.sp,
                      //height: 24.h,
                    ),
                    CustomText(
                      text: userFirstName,
                      color:
                          (ThemeCubit.get(context).isDark) ? grey300 : grey600,
                      fontWeight: FontWeight.w600,
                      fontSize: textFont16.sp,
                      //height: 24.h,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        context.push(const NotificationsScreen());
                      },
                      icon: SvgPicture.asset(
                        width: 32.h,
                        height: 32.h,
                        (ThemeCubit.get(context).isDark)
                            ? notificationsDarkIcon
                            : notificationsLightIcon,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  child: CustomText(
                    text: 'Divisions',
                    fontSize: textFont14,
                    textAlign: TextAlign.center,
                    color: (ThemeCubit.get(context).isDark) ? grey300 : black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                homeCubit.divisionsList.isNotEmpty
                    ? const DefaultCarouselSlider()
                    : const Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                        ),
                      ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    CustomText(
                      text: 'My Courses',
                      fontSize: textFont14,
                      textAlign: TextAlign.center,
                      color: (ThemeCubit.get(context).isDark) ? grey300 : black,
                      fontWeight: FontWeight.w500,
                    ),
                    const Spacer(),
                    (homeCubit.userCoursesList.isNotEmpty)
                        ? TextButton(
                            onPressed: () {},
                            child: CustomText(
                              text: 'View All',
                              fontSize: textFont14,
                              textAlign: TextAlign.center,
                              color: (ThemeCubit.get(context).isDark)
                                  ? grey300
                                  : black,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : const SizedBox(
                            width: 0,
                          )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                (homeCubit.userCoursesList.isEmpty)
                    ? Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                          side: BorderSide(
                            color: (ThemeCubit.get(context).isDark)
                                ? darkButton
                                : grey100,
                            width: 2.0,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: (ThemeCubit.get(context).isDark)
                                ? darkButton
                                : grey100,
                            borderRadius: BorderRadius.circular(24.0),
                            border: Border.all(
                              color: (ThemeCubit.get(context).isDark)
                                  ? darkButton
                                  : grey100,
                              width: 2.0,
                            ),
                          ),
                          height: 158,
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: "Here you’ll have all of the Courses ",
                                  fontSize: textFont12.sp,
                                  textAlign: TextAlign.center,
                                  color: (ThemeCubit.get(context).isDark)
                                      ? grey300
                                      : grey600,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomText(
                                  text: "you’ve applied to",
                                  fontSize: textFont12.sp,
                                  textAlign: TextAlign.center,
                                  color: (ThemeCubit.get(context).isDark)
                                      ? grey300
                                      : grey600,
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        addCoursesIcon,
                                        height: 16.h,
                                        width: 16.w,
                                      ),
                                      SizedBox(
                                        height: 4.w,
                                      ),
                                      CustomText(
                                        text: "add Courses",
                                        fontSize: textFont12.sp,
                                        textAlign: TextAlign.center,
                                        color: mainColor,
                                        fontWeight: FontWeight.w500,
                                        textDecoration:
                                            TextDecoration.underline,
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      )
                    : SizedBox(
                        height: 146.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeCubit.userCoursesList.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            width: 16.w,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return const MyCoursesCard();
                          },
                        ),
                      ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    CustomText(
                      text: 'All Courses',
                      fontSize: textFont14,
                      textAlign: TextAlign.center,
                      color: (ThemeCubit.get(context).isDark) ? grey300 : black,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: CustomText(
                        text: 'View All',
                        fontSize: textFont14,
                        textAlign: TextAlign.center,
                        color:
                            (ThemeCubit.get(context).isDark) ? grey300 : black,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 279.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeCubit.allCoursesList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      width: 16.w,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return AllCoursesCard(
                        index: index,
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    CustomText(
                      text: 'upcoming Activities',
                      fontSize: textFont14,
                      textAlign: TextAlign.center,
                      color: (ThemeCubit.get(context).isDark) ? grey300 : black,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: CustomText(
                        text: 'View All',
                        fontSize: textFont14,
                        textAlign: TextAlign.center,
                        color:
                            (ThemeCubit.get(context).isDark) ? grey300 : black,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                SizedBox(
                  height: 256.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      width: 16.w,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return const ActivityCard();
                    },
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    CustomText(
                      text: 'Recommended Courses',
                      fontSize: textFont14,
                      textAlign: TextAlign.center,
                      color: (ThemeCubit.get(context).isDark) ? grey300 : black,
                      fontWeight: FontWeight.w400,
                    ),
                    const Spacer(),
                    (true)
                        ? TextButton(
                            onPressed: () {},
                            child: CustomText(
                              text: 'View All',
                              fontSize: textFont14,
                              textAlign: TextAlign.center,
                              color: (ThemeCubit.get(context).isDark)
                                  ? grey300
                                  : black,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                (false)
                    ? Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                          side: BorderSide(
                            color: (ThemeCubit.get(context).isDark)
                                ? darkButton
                                : grey100,
                            width: 2.0,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: (ThemeCubit.get(context).isDark)
                                ? darkButton
                                : grey100,
                            borderRadius: BorderRadius.circular(24.0),
                            border: Border.all(
                              color: (ThemeCubit.get(context).isDark)
                                  ? darkButton
                                  : grey100,
                              width: 2.0,
                            ),
                          ),
                          height: 158,
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: "Here you’ll have ",
                                  fontSize: textFont12.sp,
                                  textAlign: TextAlign.center,
                                  color: (ThemeCubit.get(context).isDark)
                                      ? grey300
                                      : grey600,
                                  fontWeight: FontWeight.w400,
                                ),
                                CustomText(
                                  text: "Recommended Courses",
                                  fontSize: textFont12.sp,
                                  textAlign: TextAlign.center,
                                  color: (ThemeCubit.get(context).isDark)
                                      ? grey300
                                      : grey600,
                                  fontWeight: FontWeight.w400,
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        addCoursesIcon,
                                        height: 16.h,
                                        width: 16.w,
                                      ),
                                      SizedBox(
                                        height: 4.w,
                                      ),
                                      CustomText(
                                        text: "Create Yours",
                                        fontSize: textFont12.sp,
                                        textAlign: TextAlign.center,
                                        color: mainColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      )
                    : SizedBox(
                        height: 279.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeCubit.allCoursesList.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            width: 16.w,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return AllCoursesCard(
                              index: index,
                            );
                          },
                        ),
                      ),
              ],
            )),
        listener: (context, state) {});
  }
}

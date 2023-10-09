import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/components/core/buttons/main_button.dart';
import 'package:odc_offline/view/components/core/custom_appbar.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/components/core/scaffold_custom/scaffold_custom.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

class FinishedCourseDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
        appBarCustom: CustomAppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              width: 8.w,
              height: 16.h,
              backIcon,
              fit: BoxFit.contain,
            ),
          ),
          colorAppBar: white,
          onPressed: () {},
          title: 'Course Details',
          colorTxtAppBar: mainColor,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: ThemeCubit.get(context).isDark
                          ? darkBackground
                          : white,
                      borderRadius: BorderRadius.circular(12.0.r),
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ThemeCubit.get(context).isDark
                                ? darkBackground
                                : white,
                            borderRadius: BorderRadius.circular(12.0.r),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(top: 40),
                                  height: 92.h,
                                  decoration: BoxDecoration(
                                    color: ThemeCubit.get(context).isDark
                                        ? grey900
                                        : lightOrange,
                                    borderRadius: BorderRadius.circular(12.0.r),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 48.h,
                                      ),
                                      Center(
                                        child: CustomText(
                                          text: 'Web Development',
                                          fontSize: textFont16,
                                          textAlign: TextAlign.center,
                                          color:
                                              (ThemeCubit.get(context).isDark)
                                                  ? grey300
                                                  : grey900,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  )),
                              Card(
                                  elevation: 1, // Adjust the elevation value
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0.r),
                                  ),
                                  color: ThemeCubit.get(context).isDark
                                      ? darkButton
                                      : white,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 32.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CustomText(
                                              text: 'Certificate ID',
                                              fontSize: textFont14,
                                              textAlign: TextAlign.start,
                                              color: (ThemeCubit.get(context)
                                                      .isDark)
                                                  ? grey300
                                                  : grey800,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            const Spacer(),
                                            InkWell(
                                              onTap: () {},
                                              child: SvgPicture.asset(
                                                shareIcon,
                                                height: 24.h,
                                                width: 24.w,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        CustomText(
                                          text: '0000000000000000',
                                          fontSize: textFont14,
                                          textAlign: TextAlign.start,
                                          color: grey600,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        Divider(
                                          color:
                                              (ThemeCubit.get(context).isDark)
                                                  ? grey300
                                                  : grey400,
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        CustomText(
                                          text: 'Course Duration',
                                          fontSize: textFont14,
                                          textAlign: TextAlign.start,
                                          color:
                                              (ThemeCubit.get(context).isDark)
                                                  ? grey300
                                                  : grey800,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        CustomText(
                                          text: '3Hrs 35min',
                                          fontSize: textFont14,
                                          textAlign: TextAlign.start,
                                          color: grey600,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        Divider(
                                          color:
                                              (ThemeCubit.get(context).isDark)
                                                  ? grey300
                                                  : grey400,
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        CustomText(
                                          text: 'Recipient Name',
                                          fontSize: textFont14,
                                          textAlign: TextAlign.start,
                                          color:
                                              (ThemeCubit.get(context).isDark)
                                                  ? grey300
                                                  : grey800,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        CustomText(
                                          text: 'Sarah Mohamed',
                                          fontSize: textFont14,
                                          textAlign: TextAlign.start,
                                          color: grey600,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        Divider(
                                          color:
                                              (ThemeCubit.get(context).isDark)
                                                  ? grey300
                                                  : grey400,
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        CustomText(
                                          text: 'Course Status',
                                          fontSize: textFont14,
                                          textAlign: TextAlign.start,
                                          color:
                                              (ThemeCubit.get(context).isDark)
                                                  ? grey300
                                                  : grey800,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        CustomText(
                                          text: 'Offline',
                                          fontSize: textFont14,
                                          textAlign: TextAlign.start,
                                          color: grey600,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  MainButton(title: 'View Course', onTap: () {})
                ],
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    child: CircleAvatar(
                      radius: 41.0.r,
                      backgroundColor: mainColor,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(courseImage),
                        radius: 40.0.r,
                      ),
                    ),
                  )),
            ]),
          ],
        )));
  }
}

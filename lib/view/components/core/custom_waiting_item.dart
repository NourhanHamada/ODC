import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/components/core/custom_vertical_stepper.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view_model/cubit/dashboard/dashboard_state.dart';
import 'package:odc_offline/view_model/cubit/dashboard/dashborad_cubit.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

class CustomWaitingItem extends StatelessWidget {
  int waitingItemIndex;
  int verticaStepperIndex;

  CustomWaitingItem(
      {super.key,
      required this.waitingItemIndex,
      required this.verticaStepperIndex,
      });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
        builder: (context, state) =>
            Container(
              decoration: BoxDecoration(
                color: ThemeCubit.get(context).isDark
                    ? darkButton
                    : grey100, // Container background color
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      DashboardCubit.get(context).expand(waitingItemIndex);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: ThemeCubit.get(context).isDark
                              ? grey900
                              : grey300,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 16.h, horizontal: 4),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16.0),
                                  child: Image.asset(
                                    courseImage,
                                    width: 82.0.w,
                                    height: 56.0.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CustomText(
                                          text: 'UX Principals',
                                          fontSize: textFont16,
                                          textAlign: TextAlign.start,
                                          color:
                                              (ThemeCubit.get(context).isDark)
                                                  ? grey300
                                                  : grey800,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          width: 109.w,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            DashboardCubit.get(context)
                                                .expand(waitingItemIndex);
                                          },
                                          child: DashboardCubit.get(context)
                                                      .waitingListExpandedUnExpanded[
                                                  waitingItemIndex]
                                              ? SvgPicture.asset(
                                                  arrowUpIcon,
                                                  height: 16.h,
                                                  width: 16.w,
                                                  color: ThemeCubit.get(context)
                                                          .isDark
                                                      ? grey300
                                                      : grey800,
                                                )
                                              : SvgPicture.asset(
                                                  arrowDownIcon,
                                                  height: 16.h,
                                                  width: 16.w,
                                                  color: ThemeCubit.get(context)
                                                          .isDark
                                                      ? grey300
                                                      : grey800,
                                                ),
                                        )
                                      ],
                                    ),
                                    CustomText(
                                      text:
                                          "65% left to complete your Enrolment",
                                      fontSize: 10.sp,
                                      textAlign: TextAlign.start,
                                      color: (ThemeCubit.get(context).isDark)
                                          ? grey300
                                          : grey600,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    SizedBox(
                                      width: 160.w,
                                      height: 5.h, // Set the desired height
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: const LinearProgressIndicator(
                                          value: 0.15,
                                          backgroundColor: grey400,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  mainColor),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ))),
                  ),
                  Offstage(
                    offstage: !DashboardCubit.get(context)
                        .waitingListExpandedUnExpanded[waitingItemIndex],
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: ThemeCubit.get(context).isDark
                            ? darkButton
                            : grey100, // Container background color
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0.r),
                          bottomRight: Radius.circular(16.0.r),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 13.h,
                          ),
                          CustomText(
                            text: "Course Steps",
                            fontSize: 14.sp,
                            textAlign: TextAlign.start,
                            color: (ThemeCubit.get(context).isDark)
                                ? grey300
                                : grey800,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Row(
                            children: [
                              CustomVerticalStepper(
                                index: verticaStepperIndex,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Filling Form",
                                    fontSize: 12.sp,
                                    textAlign: TextAlign.start,
                                    color: (ThemeCubit.get(context).isDark)
                                        ? grey400
                                        : grey600,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  CustomText(
                                    text: "Consent",
                                    fontSize: 12.sp,
                                    textAlign: TextAlign.start,
                                    color: (ThemeCubit.get(context).isDark)
                                        ? grey400
                                        : grey600,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  CustomText(
                                    text: "Taking Exam",
                                    fontSize: 12.sp,
                                    textAlign: TextAlign.start,
                                    color: (ThemeCubit.get(context).isDark)
                                        ? grey400
                                        : grey600,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  CustomText(
                                    text: "HR Interview",
                                    fontSize: 12.sp,
                                    textAlign: TextAlign.start,
                                    color: (ThemeCubit.get(context).isDark)
                                        ? grey400
                                        : grey600,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 11.h,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
        listener: (context, state) {});
  }
}

List<CustomWaitingItem> dummyWaitingItems = [
  CustomWaitingItem(
    verticaStepperIndex: 2,
    waitingItemIndex: 0,
  ),
  CustomWaitingItem(
    verticaStepperIndex: 0,
    waitingItemIndex: 1,
  ),
  CustomWaitingItem(
    verticaStepperIndex: 2,
    waitingItemIndex: 2,
  ),
  CustomWaitingItem(
    verticaStepperIndex: 1,
    waitingItemIndex: 3,
  ),
  CustomWaitingItem(
    verticaStepperIndex: 1,
    waitingItemIndex: 4,
  ),
];

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/components/core/custom_waiting_item.dart';
import 'package:odc_offline/view/components/core/finished_courses_card.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              ThemeCubit.get(context).isDark ? darkBackground : grey100,
          centerTitle: true,
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
          title: CustomText(
            text: "Dashboard",
            color: mainColor,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          color: ThemeCubit.get(context).isDark ? darkBackground : white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                  // height: 150.h,
                  decoration: BoxDecoration(
                    color: ThemeCubit.get(context).isDark
                        ? grey900
                        : grey100, // Set the background color of the container
                    borderRadius:
                        BorderRadius.circular(12), // Set the border radius
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "Credential ID",
                          color: ThemeCubit.get(context).isDark
                              ? grey300
                              : grey800,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomText(
                          text:
                              "Type your credential ID to reach your course or certificate quickly",
                          color: ThemeCubit.get(context).isDark
                              ? grey300
                              : grey600,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Container(
                          height: 34.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ThemeCubit.get(context).isDark
                                ? buttonColor
                                : grey300,
                          ),
                          padding:
                              EdgeInsets.only(left: 8.w), // Left padding only
                          child: Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type Credential ID',
                                hintStyle: GoogleFonts.poppins(
                                  decorationThickness: 1.5,
                                  fontSize: 12.sp,
                                  color: grey600,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              SizedBox(
                height: 16.h,
              ),
              Row(children: [
                CustomText(
                  text: 'Finished Courses',
                  fontSize: textFont14,
                  textAlign: TextAlign.center,
                  color: (ThemeCubit.get(context).isDark) ? grey300 : grey800,
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
                CustomText(
                  text: 'View All',
                  fontSize: textFont14,
                  textAlign: TextAlign.center,
                  color: (ThemeCubit.get(context).isDark) ? grey300 : grey800,
                  fontWeight: FontWeight.w500,
                ),
              ]),
              SizedBox(
                height: 279.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 16.w,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return const FinishedCoursesCard();
                  },
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomText(
                text: 'Waiting List',
                fontSize: textFont14,
                textAlign: TextAlign.start,
                color: (ThemeCubit.get(context).isDark) ? grey300 : grey800,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 8.h,
              ),
              ListView.separated(
                shrinkWrap:
                    true, // Allow the list to take only the space it needs
                physics:
                    const NeverScrollableScrollPhysics(), // Disable scroll for inner list
                itemBuilder: (context, index) => dummyWaitingItems[index],
                separatorBuilder: (context, index) =>
                    SizedBox(height: 8.h), // Add vertical spacing
                itemCount: dummyWaitingItems.length,
              ),
            ],
          ),
        )));
  }
}



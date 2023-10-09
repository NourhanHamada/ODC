import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_offline/view/components/core/buttons/custom_button.dart';
import 'package:odc_offline/view/components/core/custom_bottom_sheet.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view_model/cubit/auth/login/login_cubit.dart';
import 'package:odc_offline/view_model/cubit/home/home_cubit.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

class DefaultCarouselSlider extends StatefulWidget {
  const DefaultCarouselSlider({super.key});

  @override
  _DefaultCarouselSliderState createState() => _DefaultCarouselSliderState();
}

class _DefaultCarouselSliderState extends State<DefaultCarouselSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 180.h,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 2500),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: HomeCubit.get(context)
                  .divisionsList
                  .asMap()
                  .entries
                  .map((entry) {
                int index = entry.key;

                String description =
                    HomeCubit.get(context).divisionsList[index]['description'];
                String name =
                    HomeCubit.get(context).divisionsList[index]['name'];
                String image =
                    HomeCubit.get(context).divisionsList[index]['imageUrl'];

                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.only(right: 24.w),
                      decoration: BoxDecoration(
                        color: (ThemeCubit.get(context).isDark)
                            ? grey900
                            : sliderColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.only(left: 24.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: name,
                                        color: (ThemeCubit.get(context).isDark)
                                            ? grey200
                                            : grey800,
                                        fontWeight: FontWeight.w600,
                                        fontSize: textFont14,
                                      ),
                                      CustomText(
                                        text: "Learn more about ",
                                        color: (ThemeCubit.get(context).isDark)
                                            ? grey200
                                            : grey800,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10.sp,
                                      ),
                                      CustomText(
                                        textAlign: TextAlign.start,
                                        text: name,
                                        color: (ThemeCubit.get(context).isDark)
                                            ? grey200
                                            : grey800,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 10.sp,
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      CustomButton(
                                        color: mainColor,
                                        onClick: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return CustomBottomSheet(
                                                description: description,
                                                name: name,
                                              );
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(24.0.r),
                                              ),
                                            ),
                                          );
                                        },
                                        width: 70.w,
                                        height: 27.h,
                                        title: CustomText(
                                          color: whiteColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          text: 'View more',
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                                Expanded(
                                  child: Image.network(
                                    image,
                                    width: 150,
                                    height: 100,
                                  ),
                                ),

                                // Expanded(
                                //   child:

                                //   SvgPicture.asset(
                                //     image,
                                //     height: 100.h,
                                //     width: 150.w,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: HomeCubit.get(context)
                        .divisionsList
                        .asMap()
                        .entries
                        .map((entry) {
                      return Container(
                        width: 8.0.w,
                        height: 8.0.h,
                        margin: EdgeInsets.symmetric(horizontal: 4.0.w),
                        decoration: BoxDecoration(
                          border: Border.all(color: mainColor),
                          shape: BoxShape.circle,
                          color: _currentIndex == entry.key
                              ? mainColor
                              : Colors.white,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

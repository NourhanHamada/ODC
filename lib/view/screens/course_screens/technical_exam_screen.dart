import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/components/core/buttons/main_button.dart';
import 'package:odc_offline/view/components/core/custom_appbar.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/components/core/scaffold_custom/scaffold_custom.dart';
import 'package:odc_offline/view/components/core/timer.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';
import '../../constant/color_manager.dart';

class TechnicalExamScreen extends StatefulWidget {
  const TechnicalExamScreen({super.key});

  @override
  State<TechnicalExamScreen> createState() => _TechnicalExamScreenState();
}

class _TechnicalExamScreenState extends State<TechnicalExamScreen>
    with TickerProviderStateMixin {
  List<int> numbers = List.generate(10, (i) => i);
  late AnimationController _controller;
  int duration = 600;
  final key = GlobalKey<FormState>();
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: duration));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of(context, listen: true);
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Technical Exam',
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: themeCubit.isDark ? darkButton : grey100,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Total Time: 10:00 mins',
                          color: themeCubit.isDark ? white : black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              time,
                              colorFilter: const ColorFilter.mode(
                                  mainColor, BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Countdown(
                              animation: StepTween(
                                begin: duration,
                                end: 0,
                              ).animate(_controller),
                              listenable: _controller,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: grey300,
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Wrap(
                            direction: Axis.horizontal,
                            children: numbers
                                .map((i) => GestureDetector(
                              onTap: (){
                                setState(() {
                                  pageController.jumpToPage(i);
                                  // pageController.animateToPage(i, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                                });
                              },
                                  child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        child: Container(
                                          width: 25,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    i == 0 ? mainColor : grey500,
                                              ),
                                              color: i == 0
                                                  ? mainColor
                                                  : Colors.transparent),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Center(
                                              child: CustomText(
                                                text: '${i+1}',
                                                color: i == 0 ? white : grey600,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                ))
                                .toList()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: context.screenHeight / 2.3,
              child: PageView.builder(
                key: key,
                controller: pageController,
                onPageChanged: (index){
                  currentIndex = index;
                },
                itemCount: numbers.length +3,
                itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: themeCubit.isDark ? darkButton : grey100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CustomText(
                          text:
                          'Lorem ipsum dolor sit amet connects Est et vitas sit leo at ?',
                          color: themeCubit.isDark ? white : black,
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: themeCubit.isDark ? darkBackground : white,
                                border: Border.all(color: mainColor)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: CustomText(
                                text: 'Lorem ipsum dolor sit amet.',
                                color: themeCubit.isDark ? white : grey600,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: themeCubit.isDark ? darkBackground : white,
                                border: Border.all(color: Colors.transparent)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: CustomText(
                                text: 'Lorem ipsum dolor sit amet.',
                                color: themeCubit.isDark ? white : grey600,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: themeCubit.isDark ? darkBackground : white,
                                border: Border.all(color: Colors.transparent)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: CustomText(
                                text: 'Lorem ipsum dolor sit amet.',
                                color: themeCubit.isDark ? white : grey600,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: themeCubit.isDark ? darkBackground : white,
                                border: Border.all(color: Colors.transparent)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: CustomText(
                                text: 'Lorem ipsum dolor sit amet.',
                                color: themeCubit.isDark ? white : grey600,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              },
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            MainButton(title: 'Continue', onTap: () {
              if(currentIndex <= numbers.length -2){
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                );
              }
              // if(currentIndex == numbers.length){
              //   pageController.keepPage;
              // }
            })
          ],
        ),
      ),
    );
  }
}

// It's static until i have data

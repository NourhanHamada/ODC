import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_offline/view/components/core/buttons/main_button.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/components/core/scaffold_custom/scaffold_custom.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view/screens/authentication/login_screen.dart';
import 'package:odc_offline/view_model/cubit/onboard/onboard_cubit.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../model/onboard/onboard_model.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    OnboardCubit onboardCubit =
        BlocProvider.of<OnboardCubit>(context, listen: true);

    return ScaffoldCustom(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: onboardCubit.isLastScreen
                        ? SizedBox(
                            height: 40.h,
                          )
                        : SizedBox(
                            height: 40.h,
                            child: TextButton(
                              onPressed: () {
                                context.push(const LoginScreen());
                              },
                              child: CustomText(
                                text: 'Skip',
                                color: ThemeCubit.get(context).isDark
                                    ? grey500
                                    : black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                  ),
                  SizedBox(
                    // height: 87.h,
                    height: context.screenHeight / 10,
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: BlocConsumer<OnboardCubit, OnboardState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return ConditionalBuilder(
                            condition: onboardCubit.done,
                            builder: (context) {
                              return PageView.builder(
                                controller: onboardCubit.pageController,
                                onPageChanged: (index) {
                                  onboardCubit.changeCurrentIndex(index);
                                  debugPrint('index ==> $index');
                                },
                                scrollBehavior: const CupertinoScrollBehavior(),
                                itemCount:
                                    OnboardCubit.onboardModel!.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  OnboardModel onboardModel =
                                      OnboardCubit.onboardModel!;
                                  return Column(
                                    children: [
                                      Image(
                                        image: NetworkImage(
                                          onboardModel.data![index].imageUrl
                                              .toString(),
                                        ),
                                        height: 160.h,
                                        errorBuilder: (BuildContext context,
                                            Object exception, stackTrace) {
                                          return const Expanded(
                                            child: Center(
                                              child: Icon(
                                                Icons.do_not_disturb,
                                                color: red,
                                                size: 32,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(
                                        height: 40.h,
                                      ),
                                      CustomText(
                                        text: onboardModel.data![index].title
                                            .toString(),
                                        color: ThemeCubit.get(context).isDark
                                            ? white
                                            : grey900,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24,
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      SizedBox(
                                        width: 270.w,
                                        height: 96.h,
                                        child: CustomText(
                                          textAlign: TextAlign.center,
                                          text: onboardModel
                                              .data![index].description
                                              .toString(),
                                          color: grey600,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator(
                              color: mainColor,
                            )),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    // height: 80.h,
                    height: context.screenHeight / 13,
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 56.h),
                      child: SmoothPageIndicator(
                        controller: onboardCubit.pageController,
                        count: OnboardCubit.pageCount,
                        onDotClicked: (index) {
                          onboardCubit.pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        effect: WormEffect(
                          activeDotColor: mainColor,
                          dotColor: ThemeCubit.get(context).isDark
                              ? grey900
                              : grey300,
                          dotWidth: 12,
                          dotHeight: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: MainButton(
                  title: onboardCubit.buttonText,
                  onTap: () {
                    onboardCubit.buttonText == 'Next'
                        ? onboardCubit.pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          )
                        : context.push(
                            const LoginScreen(),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../view_model/cubit/course_enrollment/course_enrollment_cubit.dart';
import '../../../view_model/cubit/theme/theme_cubit.dart';
import '../../components/core/buttons/main_button.dart';
import '../../components/core/component.dart';
import '../../components/core/custom_text.dart';
import '../../constant/color_manager.dart';
import '../../constant/data.dart';
import '../../constant/fonts.dart';
import 'package:odc_offline/view/components/core/timer.dart';
import '../popup_course_enrollment.dart';

class FourthPageView extends StatefulWidget {
  const FourthPageView({super.key});

  @override
  State<FourthPageView> createState() => _FourthPageViewState();
}

class _FourthPageViewState extends State<FourthPageView> {
  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    CourseEnrollmentCubit courseEnrollmentCubit =
        BlocProvider.of<CourseEnrollmentCubit>(context, listen: true);
    return BlocConsumer<CourseEnrollmentCubit, CourseEnrollmentState>(
      listener: (context, state) {
        if (state is VerifyOtpLoading) {
          showDialog(
            context: context,
            barrierColor: Colors.transparent,
            builder: (BuildContext context) {
              return const Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                  strokeWidth: 2,
                ),
              );
            },
          );
        }
        if (state is VerifyOtpSuccess) {
          context.pop();
          Future.delayed(const Duration(seconds: 3), () {
            context.pop();
            courseEnrollmentCubit.pageController.nextPage(
              duration: const Duration(microseconds: 1500),
              curve: Curves.easeInOut,
            );
          });
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const PopupCourseEnrollment();
            },
          ).then((value) {
            courseEnrollmentCubit.pageController.nextPage(
              duration: const Duration(microseconds: 1500),
              curve: Curves.easeInOut,
            );
            courseEnrollmentCubit.activeStep = 2;
          });
        }
        if (state is VerifyOtpFail) {
          context.pop();
          showToast(message: courseEnrollmentCubit.errorMessage, color: toastColor);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Get Your Code',
                        color: ThemeCubit.get(context).isDark ? white : black,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomText(
                        text: 'Please enter 4 digits code that',
                        color: ThemeCubit.get(context).isDark ? white : black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      CustomText(
                        text: 'was Sent to your email address',
                        color: ThemeCubit.get(context).isDark ? white : black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Form(
                        key: formKey2,
                        child: PinCodeTextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          autovalidateMode: AutovalidateMode.disabled,
                          autoDisposeControllers: false,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          appContext: context,
                          length: 4,
                          onChanged: (String value) {
                            if (value.length < 4) {}
                          },
                          pastedTextStyle: TextStyle(
                              color: grey600,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              fontFamily: 'poppins'),
                          textStyle: TextStyle(
                              color: grey600,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              fontFamily: 'poppins'),
                          obscureText: false,
                          animationType: AnimationType.fade,
                          validator: (v) {
                            if (v!.length < 4) {
                              return 'Please enter 4 characters';
                            }
                            return null;
                          },
                          errorTextSpace: 32,
                          errorAnimationDuration: 1200,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(8.r),
                            fieldHeight: 48.h,
                            fieldWidth: 48.w,
                            activeFillColor:
                                themeCubit.isDark ? darkButton : grey300,
                            inactiveFillColor:
                                themeCubit.isDark ? darkButton : grey300,
                            inactiveColor:
                                themeCubit.isDark ? darkButton : grey300,
                            activeColor:
                                themeCubit.isDark ? darkButton : grey300,
                            selectedColor:
                                themeCubit.isDark ? darkButton : grey300,
                            selectedFillColor:
                                themeCubit.isDark ? darkButton : grey300,
                            errorBorderColor: red,
                            fieldOuterPadding: const EdgeInsets.all(0),
                          ),
                          cursorColor: mainColor,
                          animationDuration: const Duration(milliseconds: 300),
                          enableActiveFill: true,
                          controller: courseEnrollmentCubit.codeController,
                          keyboardType: TextInputType.number,
                          onCompleted: (v) {
                            courseEnrollmentCubit.codeController.text =
                                v;
                            // Store the entered PIN code
                            // courseEnrollmentCubit.changePinCodeButtonColor(v);
                            setState(() {});
                          },
                          beforeTextPaste: (text) {
                            debugPrint("Allowing to paste $text");
                            return true;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            (courseEnrollmentCubit.codeController.text.length == 4)
                ? MainButton(
                    title: 'Continue',
                    onTap: () {
                      if (formKey2.currentState!.validate()) {
                        courseEnrollmentCubit.verifyCourseEnrollmentOTP(
                          otp: courseEnrollmentCubit.codeController.text,
                        );
                      }
                    },
                  )
                : GestureDetector(
                    onTap: () {
                      showToast(
                        message: "You must fill the form",
                        color: toastColor,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: grey800,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: double.infinity,
                      height: 48.h,
                      child: Center(
                          child: CustomText(
                        text: 'Continue',
                      )),
                    ),
                  ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 32.h,
                      ),
                      const Timer(),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomText(
                            text: 'Didn’t receive code? ',
                            color: grey600,
                            fontSize: textFont16,
                            fontWeight: FontWeight.w400,
                          ),
                          //todo: CONDITION!
                          (0 != 0)
                              ? CustomText(
                                  text: 'Resend',
                                  textDecoration: TextDecoration.underline,
                                  fontSize: textFont16,
                                  fontWeight: FontWeight.w600,
                                  color: themeCubit.isDark
                                      ? grey900
                                      : darkBackground,
                                )
                              : InkWell(
                                  // highlightColor: white,
                                  // splashColor: white,
                                  onTap: () {
                                    courseEnrollmentCubit
                                        .postCourseEnrollmentData(
                                      governorate: courseEnrollmentCubit
                                          .governorateController.text,
                                      country: courseEnrollmentCubit
                                          .countryController.text,
                                      birthdate: courseEnrollmentCubit
                                          .birthDateController.text,
                                      university: courseEnrollmentCubit
                                          .universityController.text,
                                      faculty: courseEnrollmentCubit
                                          .facultyController.text,
                                      major: courseEnrollmentCubit
                                          .majorController.text,
                                      gender: courseEnrollmentCubit
                                          .genderController.text
                                          .toUpperCase(),
                                      classStanding: courseEnrollmentCubit
                                          .classStandingController.text
                                          .toUpperCase(),
                                      statusOfGraduation: courseEnrollmentCubit
                                          .statusOfGraduationController.text
                                          .toUpperCase(),
                                      graduationYear: courseEnrollmentCubit
                                          .graduationYearController.text,
                                      insertedField: courseEnrollmentCubit
                                          .insertedFieldController.text
                                          .toUpperCase(),
                                      linkedIn: courseEnrollmentCubit
                                          .linkedinController.text,
                                      github: courseEnrollmentCubit
                                          .githubOrBehanceController.text,
                                    );
                                  },
                                  child: CustomText(
                                    textDecoration: TextDecoration.underline,
                                    decorationColor: mainColor,
                                    text: 'Resend',
                                    color: mainColor,
                                    fontSize: textFont16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

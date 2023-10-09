import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_offline/view/components/core/custom_appbar.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/components/core/scaffold_custom/scaffold_custom.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import '../../../view_model/cubit/course_enrollment/course_enrollment_cubit.dart';
import '../../../view_model/cubit/theme/theme_cubit.dart';
import '../../constant/color_manager.dart';
import '../../widgets/course_enrollment_page_view.dart';

class CourseEnrollmentScreen extends StatefulWidget {
  const CourseEnrollmentScreen({super.key});

  @override
  State<CourseEnrollmentScreen> createState() => _CourseEnrollmentScreenState();
}

class _CourseEnrollmentScreenState extends State<CourseEnrollmentScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    CourseEnrollmentCubit courseEnrollmentCubit =
        BlocProvider.of<CourseEnrollmentCubit>(context, listen: true);
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Course Enrollment',
        colorTxtAppBar: mainColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: courseEnrollmentCubit.currentIndex == 0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Join Course',
                        color: themeCubit.isDark ? white : black,
                        fontSize: 20,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      CustomText(
                        text: 'Some fields will be filled out automatically.',
                        color: grey600,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      CustomText(
                        text: 'Please, complete any remaining fields.',
                        color: grey600,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  )
                : null,
          ),
          EasyStepper(
            unreachedStepTextColor: themeCubit.isDark ? white : black,
            activeStepTextColor: themeCubit.isDark ? white : black,
            activeStep: courseEnrollmentCubit.activeStep,
            defaultLineColor: grey300,
            activeStepBorderColor: mainColor,
            defaultStepBorderType: BorderType.normal,
            activeStepIconColor: mainColor,
            unreachedStepBorderColor: grey300,
            lineLength: context.screenWidth / 8,
            stepShape: StepShape.circle,
            borderThickness: 4,
            stepRadius: 20,
            finishedStepBorderColor: mainColor,
            finishedStepTextColor: themeCubit.isDark ? white : black,
            finishedStepBackgroundColor: Colors.transparent,
            showLoadingAnimation: false,
            steps: [
              EasyStep(
                title: 'Fill Form',
                customStep: courseEnrollmentCubit.currentIndex >= 0 &&
                        courseEnrollmentCubit.currentIndex < 3
                    ? CustomText(
                        text: '1',
                        color: grey400,
                      )
                    : courseEnrollmentCubit.currentIndex >= 3
                        ? const Icon(
                            Icons.done,
                            color: mainColor,
                          )
                        : null,
              ),
              EasyStep(
                title: 'Consent',
                customStep: courseEnrollmentCubit.activeStep < 1
                    ? CustomText(
                        text: '2',
                        color: grey400,
                      )
                    : const Icon(
                        Icons.done,
                        color: mainColor,
                      ),
              ),
              EasyStep(
                title: 'Technical Exam',
                customStep: courseEnrollmentCubit.activeStep < 2
                    ? CustomText(
                        text: '3',
                        color: grey400,
                      )
                    : const Icon(
                        Icons.done,
                        color: mainColor,
                      ),
              ),
              EasyStep(
                  title: 'HR Interview',
                  customStep: courseEnrollmentCubit.activeStep < 3
                      ? CustomText(
                          text: '4',
                          color: grey400,
                        )
                      : const Icon(
                          Icons.done,
                          color: mainColor,
                        )),
            ],
            lineType: LineType.normal,
            finishedLineColor: mainColor,
            onStepReached: (index) {
              setState(() {
                courseEnrollmentCubit.activeStep = index;
              });
            },
          ),
          Expanded(
            child: Form(
              key: formKey,
              child: const CourseEnrollmentPageView(),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
      // bottomNavigationBar: const CustomBottomNavbar(),
    );
  }
}

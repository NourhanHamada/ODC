import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/components/core/buttons/main_button.dart';
import 'package:odc_offline/view/components/core/custom_appbar.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/components/core/scaffold_custom/scaffold_custom.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view/screens/course_screens/course_enrollment_screen.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

//ignore: must_be_immutable
class CourseDetailsScreen extends StatelessWidget {
  CourseDetailsScreen({super.key});

  List<String> icons = [
    student,
    offline,
    time,
  ];
  List<String> texts = [
    'For Beginners',
    'Offline',
    '14 Session',
  ];
  List<String> whatYouWillLearn = [
    'How to begin working as a UX Designer',
    'How to use Figma for Essential UX Design',
    'How to make fully interface prototypes',
    'How to work with a UX personas',
  ];
  List<String> prerequisites = [
    'A Knack for visual design',
    'An understanding of psychology of human-computer interaction',
    'Knowledge of web design combined with strong creative and technical skills',
  ];
  List<String> content = [
    'Introduction to Figma Essential',
    'Wireframing - Low Fidelity',
    'Type, Color & Icon Introduction',
    'Prototyping - Level 1',
    'Animation - Level 1',
  ];
  List<String> schedule = [
    'Tuesday & Saturday',
   '5 pm : 8 pm'
  ];
  List<String> scheduleIcons = [
    calendar,
    time
  ];

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of(context, listen: true);
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Course Details',
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: SvgPicture.asset(
            arrowBack,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    greyFilter,
                    BlendMode.color,
                  ),
                  child: Image.asset(
                    course,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      play,
                    ),
                    CustomText(
                      text: 'Preview this course',
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomText(
              text: 'Figma UI UX Design',
              color: themeCubit.isDark ? white : black,
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomText(
              text:
                  'Use Figma to get a job in UI Design, User Interface, UX Design & Web Design',
              color: themeCubit.isDark ? white : black,
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomText(
              text: '1 May - 23 May',
              color: themeCubit.isDark ? white : grey500,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              height: 90,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: icons.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        SvgPicture.asset(icons[index], color: themeCubit.isDark ? white : grey600,),
                        SizedBox(
                          width: 8.w,
                        ),
                        CustomText(
                          text: texts[index],
                          color: themeCubit.isDark ? white : black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomText(
              text: 'What you\'ll learn',
              color: themeCubit.isDark ? white : black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 4.h,
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: whatYouWillLearn.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        SvgPicture.asset(lightBulb),
                        SizedBox(
                          width: 8.w,
                        ),
                        CustomText(
                          text: whatYouWillLearn[index],
                          color: themeCubit.isDark ? white : black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomText(
              text: 'Prerequisites',
              color: themeCubit.isDark ? white : black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 4.h,
            ),
            SizedBox(
              height: 130.h,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: prerequisites.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(correct),
                        SizedBox(
                          width: 8.w,
                        ),
                        SizedBox(
                          width: context.screenWidth /1.4,
                          child: CustomText(
                            text: prerequisites[index],
                            color: themeCubit.isDark ? white : black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomText(
              text: 'Content',
              color: themeCubit.isDark ? white : black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 4.h,
            ),
            SizedBox(
              height: 155.h,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: content.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomText(text: '•', color: themeCubit.isDark ? white : black, fontSize: 14,),
                        SizedBox(
                          width: 8.w,
                        ),
                        SizedBox(
                          width: context.screenWidth /1.4,
                          child: CustomText(
                            text: content[index],
                            color: themeCubit.isDark ? white : black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomText(
              text: 'Schedule',
              color: themeCubit.isDark ? white : black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 60,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: schedule.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(scheduleIcons[index]),
                        SizedBox(
                          width: 8.w,
                        ),
                        SizedBox(
                          width: context.screenWidth /1.4,
                          child: CustomText(
                            text: schedule[index],
                            color: themeCubit.isDark ? white : black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            MainButton(title: 'Continue to Enroll', onTap: (){
              context.push(CourseEnrollmentScreen());
            })
          ],
        ),
      ),
    );
  }
}

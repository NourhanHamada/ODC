import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_offline/view/widgets/course_enrollment_page_views/fifth_page_view.dart';
import 'package:odc_offline/view/widgets/course_enrollment_page_views/first_page_view.dart';
import 'package:odc_offline/view/widgets/course_enrollment_page_views/fourth_page_view.dart';
import 'package:odc_offline/view/widgets/course_enrollment_page_views/second_page_view.dart';
import 'package:odc_offline/view/widgets/course_enrollment_page_views/third_page_view.dart';
import '../../view_model/cubit/course_enrollment/course_enrollment_cubit.dart';

class CourseEnrollmentPageView extends StatefulWidget {
  const CourseEnrollmentPageView({super.key});

  @override
  State<CourseEnrollmentPageView> createState() =>
      _CourseEnrollmentPageViewState();
}

class _CourseEnrollmentPageViewState extends State<CourseEnrollmentPageView> {

  @override
  Widget build(BuildContext context) {
    CourseEnrollmentCubit courseEnrollmentCubit =
        BlocProvider.of<CourseEnrollmentCubit>(context, listen: true);
    return PageView(
      controller: courseEnrollmentCubit.pageController,
      onPageChanged: courseEnrollmentCubit.changePageIndex,
      children: [
        const FirstPageView(),
        SecondPageView(),
        ThirdPageView(),
        const FourthPageView(),
        const FifthPageView(),
      ],
    );
  }
}

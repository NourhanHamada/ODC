import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../view_model/cubit/course_enrollment/course_enrollment_cubit.dart';
import '../../components/core/buttons/main_button.dart';
import '../../components/core/textfields/custom_text_form_filed.dart';
import '../../constant/assets.dart';

class FirstPageView extends StatelessWidget {
  const FirstPageView({super.key});

  @override
  Widget build(BuildContext context) {
    CourseEnrollmentCubit courseEnrollmentCubit =
    BlocProvider.of<CourseEnrollmentCubit>(context, listen: true);
    return Column(
      children: [
        Form(
          key: courseEnrollmentCubit.firstFormKey,
          child: Expanded(
            child: ListView(
              children: [
                TextFormFieldsCustom(
                  // enabled: false,
                  //enableInteractive: false,
                  controller: courseEnrollmentCubit.firstNameController,
                  hintText: 'First name',
                  prefixIcon: SvgPicture.asset(
                    person,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormFieldsCustom(
                  enabled: false,
                  //enableInteractive: false,
                  controller: courseEnrollmentCubit.lastNameController,
                  hintText: 'Mohammed',
                  prefixIcon: SvgPicture.asset(
                    person,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormFieldsCustom(
                  enabled: false,
                  //enableInteractive: false,
                  controller: courseEnrollmentCubit.emailController,
                  hintText: 'saramohammed@gmail.com',
                  prefixIcon: SvgPicture.asset(
                    email,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormFieldsCustom(
                  enabled: false,
                  //enableInteractive: false,
                  controller: courseEnrollmentCubit.phoneController,
                  hintText: '01002395697',
                  prefixIcon: SvgPicture.asset(
                    phone,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormFieldsCustom(
                  enabled: false,
                  //enableInteractive: false,
                  controller: courseEnrollmentCubit.idController,
                  hintText: '01293049569784',
                  prefixIcon: SvgPicture.asset(
                    id,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
          ),
        ),
        MainButton(
          title: 'Continue',
          onTap: () {
            courseEnrollmentCubit.pageController.nextPage(
                duration: const Duration(microseconds: 1000),
                curve: Curves.easeInOut);
          },
        ),
      ],
    );
  }
}

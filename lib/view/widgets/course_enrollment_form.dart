import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import '../../view_model/cubit/course_enrollment/course_enrollment_cubit.dart';
import '../../view_model/cubit/theme/theme_cubit.dart';
import '../components/core/textfields/custom_text_form_filed.dart';
import '../constant/assets.dart';

class CourseEnrollmentForm extends StatelessWidget {
  CourseEnrollmentForm({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CourseEnrollmentCubit courseEnrollmentCubit =
        BlocProvider.of<CourseEnrollmentCubit>(context, listen: true);
    return Form(
      key: formKey,
      child: PageView(
        controller: courseEnrollmentCubit.pageController,
        onPageChanged: courseEnrollmentCubit.changePageIndex,
        children: [
          Column(
            children: [
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'First Name',
                prefixIcon: SvgPicture.asset(
                  person,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'Last Name',
                prefixIcon: SvgPicture.asset(
                  person,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'Email',
                prefixIcon: SvgPicture.asset(
                  email,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'Phone Number',
                prefixIcon: SvgPicture.asset(
                  email,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'National ID',
                prefixIcon: SvgPicture.asset(
                  id,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
          Column(
            children: [
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'Governorate',
                prefixIcon: SvgPicture.asset(
                  person,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'Country',
                prefixIcon: SvgPicture.asset(
                  person,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'Birth Date',
                prefixIcon: SvgPicture.asset(
                  email,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'University',
                prefixIcon: SvgPicture.asset(
                  email,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'Faculty',
                prefixIcon: SvgPicture.asset(
                  id,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'Major',
                prefixIcon: SvgPicture.asset(
                  email,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'Gender',
                prefixIcon: SvgPicture.asset(
                  id,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
          Column(
            children: [
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'Class Standing',
                prefixIcon: SvgPicture.asset(
                  person,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'Status of Graduation',
                prefixIcon: SvgPicture.asset(
                  person,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'Graduation Year',
                prefixIcon: SvgPicture.asset(
                  email,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'Inserted Field',
                prefixIcon: SvgPicture.asset(
                  email,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'LinkedIn Link',
                prefixIcon: SvgPicture.asset(
                  id,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormFieldsCustom(
                //enableInteractive: false,
                hintText: 'Behance/Github Link',
                prefixIcon: SvgPicture.asset(
                  id,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: 'Get Your Code',
                color: ThemeCubit.get(context).isDark ? white : black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

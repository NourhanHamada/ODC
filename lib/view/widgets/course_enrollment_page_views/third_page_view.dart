import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import '../../../view_model/cubit/course_enrollment/course_enrollment_cubit.dart';
import '../../../view_model/cubit/theme/theme_cubit.dart';
import '../../components/core/buttons/main_button.dart';
import '../../components/core/component.dart';
import '../../components/core/custom_text.dart';
import '../../components/core/textfields/custom_text_form_filed.dart';
import '../../constant/assets.dart';
import '../../constant/color_manager.dart';
import '../../constant/data.dart';

//ignore: must_be_immutable
class ThirdPageView extends StatefulWidget {
  const ThirdPageView({super.key});

  @override
  State<ThirdPageView> createState() => _ThirdPageViewState();
}

class _ThirdPageViewState extends State<ThirdPageView> {
  List<String> classStandingList = [
    'Freshman',
    'Sophomore',
    'Junior',
    'Senior',
    'Graduated',
  ];

  List<String> statusOfGraduationList = [
    'Graduate',
    'UnderGraduate',
  ];

  List<String> insertedFieldList = [
    'Engineering',
    'ComputerScience',
    'AppDeveloper',
    'ProductDesigner',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    CourseEnrollmentCubit courseEnrollmentCubit =
        BlocProvider.of<CourseEnrollmentCubit>(context, listen: true);
    return BlocConsumer<CourseEnrollmentCubit, CourseEnrollmentState>(
      listener: (context, state) {
        if (state is CourseEnrollmentLoading) {
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
        if (state is CourseEnrollmentFail) {
          Future.delayed(const Duration(seconds: 1), () {
            context.pop();
            //todo: TO BE Changed!
            showToast(message: 'Invalid Form', color: toastColor);
          });
        }
        if (state is CourseEnrollmentSuccess &&
            courseEnrollmentCubit.thirdFormKey.currentState!.validate()) {
          context.pop();
          courseEnrollmentCubit.pageController.nextPage(
              duration: const Duration(microseconds: 1000),
              curve: Curves.easeInOut);
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Form(
              key: courseEnrollmentCubit.thirdFormKey,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ListView(
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButtonFormField2<String>(
                          value: courseEnrollmentCubit
                                  .classStandingController.text.isNotEmpty
                              ? courseEnrollmentCubit
                                  .classStandingController.text
                              : null,
                          decoration: InputDecoration(
                            prefixIcon: SvgPicture.asset(
                              classStanding,
                              fit: BoxFit.scaleDown,
                            ),
                            fillColor: ThemeCubit.get(context).isDark
                                ? toastColor
                                : grey200,
                            filled: true,
                            isDense: true,
                            errorStyle: const TextStyle(
                                color: orangeRed,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    // color: Colors.red,
                                    color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    // color: Colors.red,
                                    color: Colors.transparent),
                                borderRadius: BorderRadius.circular(10)),
                            // Add more decoration..
                          ),
                          hint: Text(
                            userClassStanding == ''
                                ? 'Class standing'
                                : userClassStanding,
                            style: const TextStyle(
                              fontSize: 15,
                              color: grey600,
                            ),
                          ),
                          style: TextStyle(
                              color:
                                  themeCubit.isDark ? white : darkBackground),
                          items: classStandingList
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please select Class Standing.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            courseEnrollmentCubit.classStandingController.text =
                                value!.toString();
                          },
                          onSaved: (value) {
                            // selectedValue = value.toString();
                            userClassStanding = value!.toString();
                          },
                          buttonStyleData: const ButtonStyleData(
                              // padding: EdgeInsets.only(right: 8),
                              ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: grey600,
                            ),
                            iconSize: 24,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: context.screenHeight / 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color:
                                  themeCubit.isDark ? darkBackground : grey100,
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.only(left: 8),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      DropdownButtonFormField2<String>(
                        value: courseEnrollmentCubit
                                .statusOfGraduationController.text.isNotEmpty
                            ? courseEnrollmentCubit
                                .statusOfGraduationController.text
                            : null,
                        isExpanded: true,
                        decoration: InputDecoration(
                          prefixIcon: SvgPicture.asset(
                            faculty,
                            fit: BoxFit.scaleDown,
                          ),
                          fillColor: ThemeCubit.get(context).isDark
                              ? toastColor
                              : grey200,
                          filled: true,
                          isDense: true,
                          errorStyle: const TextStyle(
                              color: orangeRed,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  // color: Colors.red,
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  // color: Colors.red,
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10)),
                          // Add more decoration..
                        ),
                        hint: Text(
                          userStatusOfGraduation == ''
                              ? 'Status of Graduation'
                              : userStatusOfGraduation,
                          style: const TextStyle(
                            fontSize: 15,
                            color: grey600,
                          ),
                        ),
                        style: TextStyle(
                            color: themeCubit.isDark ? white : darkBackground),
                        items: statusOfGraduationList
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select Status of Graduation.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          courseEnrollmentCubit.statusOfGraduationController
                              .text = value!.toString();
                        },
                        onSaved: (value) {
                          // selectedValue = value.toString();
                          userStatusOfGraduation = value!.toString();
                        },
                        buttonStyleData: const ButtonStyleData(
                            // padding: EdgeInsets.only(right: 8),
                            ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: grey600,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: context.screenHeight / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: themeCubit.isDark ? darkBackground : grey100,
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.only(left: 8),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      TextFormFieldsCustom(
                        keyboardType: TextInputType.number,
                        inputFormatter: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],

                        onChanged: (value) {
                          // courseEnrollmentCubit.changeThirdButtonColor(value!);
                          // courseEnrollmentCubit.graduationYearController.text =
                          //     value;
                        },
                        //enableInteractive: false,
                        controller:
                            courseEnrollmentCubit.graduationYearController,
                        hintText: 'Graduation Year',
                        prefixIcon: SvgPicture.asset(
                          date,
                          fit: BoxFit.scaleDown,
                        ),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Graduation year must be not empty";
                          } else if (value.length < 4) {
                            return 'Please Enter your graduation Year';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      DropdownButtonFormField2<String>(
                        value: courseEnrollmentCubit
                                .insertedFieldController.text.isNotEmpty
                            ? courseEnrollmentCubit.insertedFieldController.text
                            : null,
                        isExpanded: true,
                        decoration: InputDecoration(
                          prefixIcon: SvgPicture.asset(
                            intersted,
                            fit: BoxFit.scaleDown,
                          ),
                          fillColor: ThemeCubit.get(context).isDark
                              ? toastColor
                              : grey200,
                          filled: true,
                          isDense: true,
                          errorStyle: const TextStyle(
                              color: orangeRed,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  // color: Colors.red,
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  // color: Colors.red,
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10)),
                          // Add more decoration..
                        ),
                        hint: Text(
                          userInsertedField == ''
                              ? 'Inserted Field'
                              : userInsertedField,
                          style: const TextStyle(
                            fontSize: 15,
                            color: grey600,
                          ),
                        ),
                        style: TextStyle(
                            color: themeCubit.isDark ? white : darkBackground),
                        items: insertedFieldList
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please select Inserted Field.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          courseEnrollmentCubit.insertedFieldController.text =
                              value!.toString();
                        },
                        onSaved: (value) {
                          // selectedValue = value.toString();
                          userInsertedField = value!.toString();
                        },
                        buttonStyleData: const ButtonStyleData(
                            // padding: EdgeInsets.only(right: 8),
                            ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: grey600,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: context.screenHeight / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: themeCubit.isDark ? darkBackground : grey100,
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.only(left: 8),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      TextFormFieldsCustom(
                        //enableInteractive: false,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "LinedIn link must be not Empty";
                          } else if (!RegExp(validationLink)
                              .hasMatch(value.trim())) {
                            return "LinkedIn link is not Valid";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          // courseEnrollmentCubit.changeThirdButtonColor(value!);
                          // courseEnrollmentCubit.linkedinController.text = value;
                        },
                        controller: courseEnrollmentCubit.linkedinController,
                        hintText: 'LinkedIn Link',
                        prefixIcon: SvgPicture.asset(
                          linkedin,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      TextFormFieldsCustom(
                        //enableInteractive: false,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Github/Behance link must be not Empty";
                          } else if (!RegExp(validationLink)
                              .hasMatch(value.trim())) {
                            return "Behance/Github link is not Valid";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {});
                        },
                        onEditingComplete: () {
                          setState(() {});
                        },
                        onChanged: (value) {
                          // courseEnrollmentCubit.changeThirdButtonColor(value!);
                          // courseEnrollmentCubit.githubOrBehanceController.text =
                          //     value;
                          setState(() {});
                        },
                        controller:
                            courseEnrollmentCubit.githubOrBehanceController,
                        hintText: 'Behance/Github Link',
                        prefixIcon: SvgPicture.asset(
                          link,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            (courseEnrollmentCubit.classStandingController.text.isEmpty ||
                    courseEnrollmentCubit
                        .statusOfGraduationController.text.isEmpty ||
                    courseEnrollmentCubit
                        .graduationYearController.text.isEmpty ||
                    courseEnrollmentCubit
                        .insertedFieldController.text.isEmpty ||
                    courseEnrollmentCubit.linkedinController.text.isEmpty ||
                    courseEnrollmentCubit
                        .githubOrBehanceController.text.isEmpty)
                ? GestureDetector(
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
                  )
                : MainButton(
                    title: 'Continue',
                    onTap: () {
                      courseEnrollmentCubit.cacheThirdFormData();
                      courseEnrollmentCubit.postCourseEnrollmentData(
                        governorate:
                            courseEnrollmentCubit.governorateController.text,
                        country: courseEnrollmentCubit.countryController.text,
                        birthdate:
                            courseEnrollmentCubit.birthDateController.text,
                        university:
                            courseEnrollmentCubit.universityController.text,
                        faculty: courseEnrollmentCubit.facultyController.text,
                        major: courseEnrollmentCubit.majorController.text,
                        gender: courseEnrollmentCubit.genderController.text
                            .toUpperCase(),
                        classStanding: courseEnrollmentCubit
                            .classStandingController.text
                            .toUpperCase(),
                        statusOfGraduation: courseEnrollmentCubit
                            .statusOfGraduationController.text
                            .toUpperCase(),
                        graduationYear:
                            courseEnrollmentCubit.graduationYearController.text,
                        insertedField: courseEnrollmentCubit
                            .insertedFieldController.text
                            .toUpperCase(),
                        linkedIn: courseEnrollmentCubit.linkedinController.text,
                        github: courseEnrollmentCubit
                            .githubOrBehanceController.text,
                      );
                    },
                  ),
          ],
        );
      },
    );
  }
}

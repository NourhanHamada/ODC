import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
class SecondPageView extends StatefulWidget {
   const SecondPageView({super.key});

  @override
  State<SecondPageView> createState() => _SecondPageViewState();
}

class _SecondPageViewState extends State<SecondPageView> {
  late DateTime selectedDate;
  late String dateFormatted;
  String governorate = 'Governorate';

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    CourseEnrollmentCubit courseEnrollmentCubit =
    BlocProvider.of<CourseEnrollmentCubit>(context, listen: true);
    Future<void> selectDate() async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(1996),
        firstDate: DateTime(1996),
        lastDate: DateTime(2005),
        builder: (context, child){
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.dark(
                    primary: mainColor,
                  onPrimary: white,
                  onSurface: mainColor
                ),
                dialogBackgroundColor: themeCubit.isDark ? darkButton : grey300,
              ),
              child: child!);
        }
      );
      if (picked != null) {
        selectedDate = picked;
        courseEnrollmentCubit.birthDateController.text =
        DateFormat('yyyy-MM-dd').format(selectedDate);
      }
    }
    return Column(
      children: [
        Form(
          key: courseEnrollmentCubit.secondFormKey,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ListView(
                children: [
                  DropdownButtonFormField2<String>(
                    isExpanded: true,
                    value: courseEnrollmentCubit.governorateController.text.isNotEmpty ? courseEnrollmentCubit.governorateController.text : null,
                    decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        location,
                        fit: BoxFit.scaleDown,
                      ),
                      fillColor:
                          ThemeCubit.get(context).isDark ? toastColor : grey200,
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
                      userGovernorate == '' ? 'Governorate' : userGovernorate,
                      style: const TextStyle(
                        fontSize: 15,
                        color: grey600,
                      ),
                    ),
                    style: TextStyle(
                        color: themeCubit.isDark ? white : darkBackground),
                    items: courseEnrollmentCubit.governorates
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
                        return 'Please select Governorate.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      courseEnrollmentCubit.governorateController.text =
                          value!.toString();
                    },
                    onSaved: (value) {
                      userGovernorate = value!.toString();
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
                      padding: EdgeInsets.zero,
                      scrollPadding: EdgeInsets.zero,
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
                  DropdownButtonFormField2<String>(
                    isExpanded: true,
                    value: courseEnrollmentCubit.countryController.text.isNotEmpty ? courseEnrollmentCubit.countryController.text : null,
                    decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        country,
                        fit: BoxFit.scaleDown,
                      ),
                      fillColor:
                      ThemeCubit.get(context).isDark ? toastColor : grey200,
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
                      userCountry == '' ? 'Country' : userCountry,
                      style: const TextStyle(
                        fontSize: 15,
                        color: grey600,
                      ),
                    ),
                    style: TextStyle(
                        color: themeCubit.isDark ? white : darkBackground),
                    items: courseEnrollmentCubit.countries
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
                        return 'Please select Governorate.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      courseEnrollmentCubit.countryController.text =
                          value!.toString();
                    },
                    onSaved: (value) {
                      userGovernorate = value!.toString();
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
                      padding: EdgeInsets.zero,
                      scrollPadding: EdgeInsets.zero,
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
                    onTap: () async {
                      selectDate();
                    },
                    //enableInteractive: false,
                    onChanged: (value) {
                      // courseEnrollmentCubit.changeSecondButtonColor(value!);
                      // courseEnrollmentCubit.birthDateController.text = value;
                    },
                    controller: courseEnrollmentCubit.birthDateController,
                    hintText: userBirthdate == '' ? 'Birth Date' : userBirthdate,
                    prefixIcon: SvgPicture.asset(
                      date,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  DropdownButtonFormField2<String>(
                    isExpanded: true,
                    value: courseEnrollmentCubit.universityController.text.isNotEmpty ? courseEnrollmentCubit.universityController.text : null,
                    // value: courseEnrollmentCubit.universityController.text.isNotEmpty ? courseEnrollmentCubit.universityController.text : null,
                    decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        university,
                        fit: BoxFit.scaleDown,
                      ),
                      fillColor:
                          ThemeCubit.get(context).isDark ? toastColor : grey200,
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
                      userUniversity == '' ?
                          'University' : userUniversity,
                      style: const TextStyle(
                        fontSize: 15,
                        color: grey600,
                      ),
                    ),
                    style: TextStyle(
                        color: themeCubit.isDark ? white : darkBackground),
                    items: courseEnrollmentCubit.universities
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
                        return 'Please select University.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      courseEnrollmentCubit.universityController.text =
                          value!.toString();
                      //Do something when selected item is changed.
                    },
                    onSaved: (value) {
                      // selectedValue = value.toString();
                      userGovernorate = value!.toString();
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
                  DropdownButtonFormField2<String>(
                    isExpanded: true,
                    value: courseEnrollmentCubit.facultyController.text.isNotEmpty ? courseEnrollmentCubit.facultyController.text : null,
                    decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        faculty,
                        fit: BoxFit.scaleDown,
                      ),
                      fillColor:
                          ThemeCubit.get(context).isDark ? toastColor : grey200,
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
                    hint:  Text(
                      userFaculty == '' ? 'Faculty' : userFaculty,
                      style: const TextStyle(
                        fontSize: 15,
                        color: grey600,
                      ),
                    ),
                    style: TextStyle(
                        color: themeCubit.isDark ? white : darkBackground),
                    items: courseEnrollmentCubit.faculties
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
                        return 'Please select Faculty.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      courseEnrollmentCubit.facultyController.text =
                          value!.toString();
                      //Do something when selected item is changed.
                    },
                    onSaved: (value) {
                      // selectedValue = value.toString();
                      userGovernorate = value!.toString();
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
                  DropdownButtonFormField2<String>(
                    isExpanded: true,
                    value: courseEnrollmentCubit.majorController.text.isNotEmpty ? courseEnrollmentCubit.majorController.text : null,
                    decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        major,
                        fit: BoxFit.scaleDown,
                      ),
                      fillColor:
                          ThemeCubit.get(context).isDark ? toastColor : grey200,
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
                    hint:  Text(
                      userMajor == '' ? 'Major' : userMajor,
                      style: const TextStyle(
                        fontSize: 15,
                        color: grey600,
                      ),
                    ),
                    style: TextStyle(
                        color: themeCubit.isDark ? white : darkBackground),
                    items: courseEnrollmentCubit.majors
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
                        return 'Please select Major.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      courseEnrollmentCubit.majorController.text =
                          value!.toString();
                      //Do something when selected item is changed.
                    },
                    onSaved: (value) {
                      // selectedValue = value.toString();
                      userGovernorate = value!.toString();
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
                  DropdownButtonFormField2<String>(
                    isExpanded: true,
                    value: courseEnrollmentCubit.genderController.text.isNotEmpty ? courseEnrollmentCubit.genderController.text : null,
                    decoration: InputDecoration(
                      prefixIcon: SvgPicture.asset(
                        gender,
                        fit: BoxFit.scaleDown,
                      ),
                      fillColor:
                          ThemeCubit.get(context).isDark ? toastColor : grey200,
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
                      userGender == '' ? 'Gender' : userGender,
                      style: const TextStyle(
                        fontSize: 15,
                        color: grey600,
                      ),
                    ),
                    style: TextStyle(
                        color: themeCubit.isDark ? white : darkBackground),
                    items: <String>['Male', 'Female']
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
                        return 'Please select Gender.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      courseEnrollmentCubit.genderController.text =
                          value!.toString();
                      setState(() {

                      });
                    },
                    onSaved: (value) {
                      userGovernorate = value!.toString();
                    },
                    buttonStyleData: const ButtonStyleData(
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
                ],
              ),
            ),
          ),
        ),
        (courseEnrollmentCubit.governorateController.text.isEmpty &&
                courseEnrollmentCubit.countryController.text.isEmpty)
            ? GestureDetector(
                onTap: () {
                  if (1 == 1) {
                    showToast(
                      message: "You must fill the form",
                      color: toastColor,
                    );
                  }
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
                  courseEnrollmentCubit.cacheSecondFormData();
                  if (courseEnrollmentCubit.secondFormKey.currentState!
                      .validate()) {
                    courseEnrollmentCubit.pageController.nextPage(
                        duration: const Duration(microseconds: 1000),
                        curve: Curves.easeInOut);
                  }
                },
              ),
      ],
    );
  }
}

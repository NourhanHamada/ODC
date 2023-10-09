import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../view_model/cubit/signup/signup_cubit.dart';
import '../components/core/textfields/custom_text_form_filed.dart';
import '../constant/assets.dart';
import '../constant/color_manager.dart';
import '../constant/data.dart';

class SignupForm extends StatelessWidget {
  SignupForm({super.key});

  final double sizedBoxHeight = 16.h;

  @override
  Widget build(BuildContext context) {
    SignupCubit signupCubit =
        BlocProvider.of<SignupCubit>(context, listen: true);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormFieldsCustom(
                focus: signupCubit.firstNameFocus,
                controller: signupCubit.firstNameController,
                // enableInteractive: true,
                hintText: "First Name",
                prefixIcon: SvgPicture.asset(
                  userIcon,
                  fit: BoxFit.scaleDown,
                  width: 20.w,
                  height: 20.h,
                ),
                validator: (val) {
                  if (val!.trim().isEmpty) {
                    return "First Name must be not Empty";
                  } else if (!RegExp(validationName).hasMatch(val.trim())) {
                    return "First Name is not Valid";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: TextFormFieldsCustom(
                focus: signupCubit.lastNameFocus,
                controller: signupCubit.lastNameController,
                // enableInteractive: true,
                hintText: "Last Name",
                prefixIcon: SvgPicture.asset(
                  userIcon,
                  fit: BoxFit.scaleDown,
                  width: 20.w,
                  height: 20.h,
                ),
                validator: (val) {
                  if (val!.trim().isEmpty) {
                    return "Last Name must be not Empty";
                  } else if (!RegExp(validationName).hasMatch(val.trim())) {
                    return "Last Name is not Valid";
                  }
                  return null;
                },
              ),
            )
          ],
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        TextFormFieldsCustom(
          focus: signupCubit.emailFocus,
          controller: signupCubit.emailController,
          keyboardType: TextInputType.emailAddress,
          // enableInteractive: true,
          validator: (value) {
            if (value!.trim().isEmpty) {
              return "email must be not Empty";
            } else if (!RegExp(validationEmail).hasMatch(value.trim())) {
              return "email is not Valid";
            }
            return null;
          },
          hintText: "Email",
          prefixIcon: SvgPicture.asset(
            email,
            fit: BoxFit.scaleDown,
            width: 20.w,
            height: 20.h,
          ),
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        TextFormFieldsCustom(
          inputFormatter: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          focus: signupCubit.phoneNumberFocus,
          controller: signupCubit.phoneNumberController,
          keyboardType: TextInputType.phone,
          // enableInteractive: true,
          hintText: "Phone Number",
          prefixIcon: Icon(
            Icons.phone_android,
            size: 20.w,
            color: grey600,
          ),
          validator: (val) {
            if (val!.trim().isEmpty) {
              return "Phone Number must be not Empty";
            } else if (!RegExp(validationPhone).hasMatch(val.trim())) {
              return "Phone Number is not Valid";
            }
            return null;
          },
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        TextFormFieldsCustom(
          inputFormatter: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          keyboardType: TextInputType.number,
          focus: signupCubit.nationalIdFocus,
          controller: signupCubit.nationalIdController,
          // enableInteractive: true,
          hintText: "National ID",
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(id),
          ),
          validator: (val) {
            if (val!.trim().isEmpty) {
              return "National ID must not be empty.";
            } else if (val.trim().length != 14) {
              return "Your National ID must have at least 14 number.";
            }
            return null;
          },
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        TextFormFieldsCustom(
          focus: signupCubit.passwordFocus,
          isPassword: !signupCubit.isPasswordVisible,
          suffix: signupCubit.isPasswordVisible,
          suffixOnPressed: () {
            signupCubit.changePasswordVisibility();
          },
          // enableInteractive: true,
          suffixToggle: signupCubit.isPasswordVisible,
          hintText: "Password",
          controller: signupCubit.passwordController,
          validator: (value) {
            if (value!.trim().isEmpty) {
              return "Password must be not Empty.";
            } else if (!value
                .trim()
                .contains(RegExp(validatePasswordUpperCase))) {
              return "Password must Contains UpperCase Letter.";
            } else if (!value.trim().contains(RegExp(validatePasswordDigits))) {
              return "Password must Contains Digit.";
            } else if (!value
                .trim()
                .contains(RegExp(validatePasswordLowerCase))) {
              return "Password must Contains LowerCase Letter.";
            } else if (!value
                .trim()
                .contains(RegExp(validatePasswordSpecialChar))) {
              return "Password must Contains Special Character.";
            } else if (value.trim().length < 8) {
              return "Password must be more 8 Letters.";
            } else if (!RegExp(validationPassword).hasMatch(value.trim())) {
              return "Password is not Valid.";
            }
            return null;
          },
          prefixIcon: SvgPicture.asset(
            lock,
            fit: BoxFit.scaleDown,
            width: 20.w,
            height: 20.h,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              signupCubit.changePasswordVisibility();
            },
            child: (signupCubit.isPasswordVisible)
                ? SvgPicture.asset(
                    showPassword,
                    fit: BoxFit.scaleDown,
                    width: 20.w,
                    height: 20.h,
                  )
                : SvgPicture.asset(
                    hidePassword,
                    fit: BoxFit.scaleDown,
                    width: 20.w,
                    height: 20.h,
                  ),
          ),
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        TextFormFieldsCustom(
          focus: signupCubit.confirmPasswordFocus,
          isPassword: !signupCubit.isConfirmPasswordVisible,
          suffixOnPressed: () {
            signupCubit.changeConfirmPasswordVisibility();
          },
          suffix: signupCubit.isConfirmPasswordVisible,
          controller: signupCubit.confirmPasswordController,
          // enableInteractive: true,
          hintText: "Confirm Password",
          prefixIcon: SvgPicture.asset(
            lock,
            fit: BoxFit.scaleDown,
            width: 20.w,
            height: 20.h,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              signupCubit.changeConfirmPasswordVisibility();
            },
            child: (signupCubit.isConfirmPasswordVisible)
                ? SvgPicture.asset(
                    showPassword,
                    fit: BoxFit.scaleDown,
                    width: 20.w,
                    height: 20.h,
                  )
                : SvgPicture.asset(
                    hidePassword,
                    fit: BoxFit.scaleDown,
                    width: 20.w,
                    height: 20.h,
                  ),
          ),
          validator: (val) {
            //confirm password validation
            if (val!.trim().isEmpty) {
              return "Password must be not Empty";
            } else if (val.trim() !=
                signupCubit.passwordController.text.trim()) {
              return "Password doesn't match";
            }
            return null;
          },
        ),
      ],
    );
  }
}

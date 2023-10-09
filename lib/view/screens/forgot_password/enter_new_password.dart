import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/components/core/buttons/custom_button.dart';
import 'package:odc_offline/view/components/core/component.dart';
import 'package:odc_offline/view/components/core/custom_appbar.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/components/core/scaffold_custom/scaffold_custom.dart';
import 'package:odc_offline/view/components/core/textfields/custom_text_form_filed.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view/screens/authentication/login_screen.dart';
import 'package:odc_offline/view_model/cubit/forget_password/forget_password_cubit.dart';
import 'package:odc_offline/view_model/cubit/forget_password/forget_password_state.dart';

class EnterNewPassword extends StatelessWidget {
  static final formKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  EnterNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
      var forgetPasswordCubit = ForgetPasswordCubit.get(context);
      return ScaffoldCustom(
          appBarCustom: CustomAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                width: 8.w,
                height: 16.h,
                backIcon,
                fit: BoxFit.contain,
              ),
            ),
            colorAppBar: white,
            onPressed: () {},
            title: 'Forgot Password',
            colorTxtAppBar: mainColor,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 72.h,
                  ),
                  Center(
                    child: CustomText(
                      text: "Enter New Password",
                      color: grey700,
                      fontWeight: FontWeight.w600,
                      //height: 24.h,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    width: 251.w,
                    child: CustomText(
                      text:
                          'Your new password must be different from previously used password',
                      fontSize: textFont14.sp,
                      textAlign: TextAlign.center,
                      color: grey600,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 56.h,
                  ),
                  TextFormFieldsCustom(
                    isPassword: forgetPasswordCubit.isPasswordNewPassword,
                    //enableInteractive: true,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    hintText: 'Password',
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 8.w,
                      ),
                      child: SvgPicture.asset(
                        width: 20.w,
                        height: 16.67.h,
                        lock,
                        fit: BoxFit.contain,
                      ),
                    ),
                    suffixIcon: InkWell(
                      child: !forgetPasswordCubit.isPasswordNewPassword
                          ? const Icon(
                              Icons.remove_red_eye_outlined,
                              color: grey600,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                              color: grey600,
                            ),
                      onTap: () {
                        forgetPasswordCubit.changeSuffixNewPassowd();
                      },
                    ),

                    controller: newPasswordController,

                    // validate
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "password must be not Empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFormFieldsCustom(
                    isPassword:
                        forgetPasswordCubit.isPasswordConfirmNewPassword,
                    //enableInteractive: true,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    hintText: 'Confirm Password',
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 8.w,
                      ),
                      child: SvgPicture.asset(
                        width: 20.w,
                        height: 16.67.h,
                        lock,
                        fit: BoxFit.contain,
                      ),
                    ),
                    suffixIcon: InkWell(
                      child: !forgetPasswordCubit.isPasswordConfirmNewPassword
                          ? const Icon(
                              Icons.remove_red_eye_outlined,
                              color: grey600,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                              color: grey600,
                            ),
                      onTap: () {
                        forgetPasswordCubit.changeSuffixConfirmNewPassword();
                      },
                    ),

                    controller: confirmNewPasswordController,
                    // validate
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "Password must be not Empty";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  // Row(
                  //   children: [
                  //     InkWell(
                  //       onTap: () {
                  //         forgetPasswordCubit.checkUnCheckBox();
                  //       },
                  //       child: CustomCheckbox(
                  //         isChecked: forgetPasswordCubit.isCheckedBox,
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: 8.w,
                  //     ),
                  //     CustomText(
                  //       text: 'Remember me',
                  //       fontSize: textFont14.sp,
                  //       textAlign: TextAlign.start,
                  //       color: grey600,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: 48.h,
                  ),
                  CustomButton(
                    onClick: () {
                      if (formKey.currentState!.validate()) {
                        ForgetPasswordCubit.get(context).resetNewPassword(
                            newPasswordController.text,
                            confirmNewPasswordController.text,
                            context);
                      }
                    },
                    title: CustomText(
                      text: 'Done',
                      fontSize: btnFont16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ));
    }, listener: (context, state) {
      if (state is ResetPasswordLoading) {
        ForgetPasswordCubit.get(context).enterNewPasswordIsLoading = true;
        ForgetPasswordCubit.get(context).confirmCodeIsLoading = false;
      } else if (state is ResetPasswordError) {
        ForgetPasswordCubit.get(context).enterNewPasswordIsLoading = false;
        ForgetPasswordCubit.get(context).confirmCodeIsLoading = false;
        showToast(
            message:
                ForgetPasswordCubit.get(context).resetNewPasswordStatusMessage);
      } else if (state is ResetPasswordSuccess) {
        ForgetPasswordCubit.get(context).confirmCodeIsLoading = false;
        ForgetPasswordCubit.get(context).enterNewPasswordIsLoading = false;
        showToast(message: 'Your password has been reset successfully');

        context.push(const LoginScreen());
      }
      if (ForgetPasswordCubit.get(context).enterNewPasswordIsLoading) {
        ForgetPasswordCubit.get(context).confirmCodeIsLoading = false;
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
    });
  }
}

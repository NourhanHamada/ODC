import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_offline/view/components/core/component.dart';
import 'package:odc_offline/view/components/core/custom_checkbox.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view/screens/authentication/login_screen.dart';
import 'package:odc_offline/view/widgets/signup_form.dart';
import 'package:odc_offline/view_model/cubit/signup/signup_state.dart';
import '../../../view_model/cubit/signup/signup_cubit.dart';
import '../../components/core/buttons/main_button.dart';
import '../../components/core/custom_text.dart';
import '../../components/core/scaffold_custom/scaffold_custom.dart';
import '../../constant/color_manager.dart';
import '../../widgets/popup_terms_dialog.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final double sizedBoxHeight = 16.h;

  @override
  Widget build(BuildContext context) {
    SignupCubit signupCubit =
    BlocProvider.of<SignupCubit>(context, listen: true);
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if(state is SignupDataLoading) {
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
        if(state is SignupDataSuccess) {
          context.push(const LoginScreen());
          showToast(message: 'Signed up successfully', color: toastColor);
        }
        if (state is SignupDataError) {
          context.pop();
          showToast(message: signupCubit.errorMessage, color: toastColor);
        }
      },
      builder: (context, state) {
        return ScaffoldCustom(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: CustomText(
                      text: 'Join US!',
                      fontSize: 28.sp,
                      color: mainColor,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: CustomText(
                      text: 'Start your Learning Journey',
                      fontSize: 14.sp,
                      color: grey600,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Form(
                    key: formKey,
                    child: SignupForm(),
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          signupCubit.changeIsAgreeTerms();
                        },
                        child: CustomCheckbox(
                          isChecked: signupCubit.isAgreeTerms,
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      CustomText(
                        text: 'I agree to ',
                        fontSize: 12.sp,
                        color: textColorFormField,
                        fontWeight: FontWeight.w500,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await signupCubit.getTermsAndConditionsData();


                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return PopupTermsDialog(
                                  htmlContent: signupCubit
                                      .termsAndConditionsHTML);
                            },
                          );
                        },
                        child: CustomText(
                          color: textColorFormField,
                          text: 'Terms, Conditions',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          textDecoration: TextDecoration.underline,
                        ),
                      ),
                      CustomText(
                        text: ' & ',
                        fontSize: 12.sp,
                        color: textColorFormField,
                        fontWeight: FontWeight.w500,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await signupCubit.getConsentData();
                          // todo: show terms and conditions dialog.

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return PopupTermsDialog(
                                htmlContent: signupCubit.consentHTML,);
                            },
                          );
                        },
                        child: CustomText(
                          color: textColorFormField,
                          text: 'Consent',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          textDecoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  SignupCubit
                      .get(context)
                      .isAgreeTerms
                      ? MainButton(
                    title: 'Sign Up',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        signupCubit.signUpData(
                          firstname: signupCubit.firstNameController.text,
                          lastName: signupCubit.lastNameController.text,
                          email: signupCubit.emailController.text,
                          phoneNumber: signupCubit.phoneNumberController.text,
                          nationalId: signupCubit.nationalIdController.text,
                          password: signupCubit.passwordController.text,
                          confirmPassword: signupCubit.confirmPasswordController
                              .text,
                        );
                        if (signupCubit.isAgreeTerms == false) {
                          showToast(
                            message: "You must agree to terms and conditions",
                            color: toastColor,
                          );
                        } else {
                          formKey.currentState!.save();
                          //todo: push to ??.
                          // context.push();
                          // showToast(message: "Validate Success", color: toastColor);
                          debugPrint('Validate Success');
                        }
                      }
                    },
                  )
                      : Material(
                      borderRadius: BorderRadius.circular(10),
                      color: grey800,
                      child: Container(
                        // lw b null hy3ml elly b3d "?", lw msh b null hy3ml elly b3d "?"
                        width: ScreenUtil().screenWidth,
                        height: 48.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: grey800)),
                        child: Center(
                          child: CustomText(
                            text: 'Sign Up',
                            color: grey100,
                            fontSize: 18.sp,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Already have an account? ',
                        color: textColorFormField,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      InkWell(
                        onTap: () {
                          context.push(const LoginScreen());
                        },
                        child: CustomText(
                          text: 'Login',
                          color: mainColor,
                          textDecoration: TextDecoration.underline,
                          fontSize: 14.sp,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
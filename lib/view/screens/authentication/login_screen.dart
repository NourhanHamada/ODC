import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/components/core/scaffold_custom/scaffold_custom.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view/screens/authentication/signup_screen.dart';
import 'package:odc_offline/view/screens/layout/layout.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';
import '../../../view_model/cubit/auth/login/login_cubit.dart';
import '../../components/core/buttons/main_button.dart';
import '../../components/core/component.dart';
import '../../components/core/custom_checkbox.dart';
import '../../components/core/textfields/custom_text_form_filed.dart';
import '../../constant/assets.dart';
import '../../constant/data.dart';
import '../../constant/fonts.dart';
import '../forgot_password/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool autoPlayEmail = false;
  bool autoPlayPassword = false;

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = BlocProvider.of<LoginCubit>(context, listen: true);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginLoading) {
          loginCubit.isLoading = true;
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return const Center(
          //       child: CircularProgressIndicator(
          //         color: mainColor,
          //         strokeWidth: 2,
          //       ),
          //     );
          //   },
          // );
        }
        if (state is LoginDataSuccess) {
          loginCubit.isLoading = false;
          context.push(const Layout());
          loginCubit.cacheIfLogin(true);
        }
        if (state is LoginDataError) {
          context.pop();
            loginCubit.isLoading = false;
          //   print(loginCubit.isLoading);
          showToast(
              message: loginCubit.errorMessage,
              color: toastColor,
          );
        }
        if(loginCubit.isLoading){
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
      },
      builder: (context, state) {
        return ScaffoldCustom(
            body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Welcome!',
                    color: mainColor,
                    fontSize: 28,
                  ),
                  CustomText(
                    text: 'Log in to continue',
                    color: ThemeCubit.get(context).isDark ? grey300 : grey600,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 88.h,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        ShakeWidget(
                          duration: const Duration(seconds: 2),
                          shakeConstant: ShakeHorizontalConstant2(),
                          autoPlay: autoPlayEmail,
                          child: TextFormFieldsCustom(
                            onSaved: (value) {
                              value = LoginCubit.emailController.text;
                            },
                            onEditingComplete: () {
                              debugPrint('Done editing');
                            },
                            onChanged: (value){
                              print(value.toString());
                            },
                            controller: LoginCubit.emailController,
                            hintText: "Email",
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SvgPicture.asset(email),
                            ),
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "email must be not Empty";
                              } else if (!RegExp(validationEmail)
                                  .hasMatch(value.trim())) {
                                return "email is not Valid";
                              }
                              return null;
                            },
                            // enableInteractive: false,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        TextFormFieldsCustom(
                          onEditingComplete: (){
                            setState(() {
                            });
                          },
                          onChanged: (value) {
                            // loginCubit.passwordChanged(value!);

                              // LoginCubit.passwordController.text = value!;
                              loginCubit.formDone();
                              print('LALALL');
                            print(value.toString());
                            setState(() {

                            });
                          },
                          onSaved: (value) {
                            value = LoginCubit.passwordController.text;
                            setState(() {
                              LoginCubit.passwordController.text = value!;
                            });
                          },
                          controller: LoginCubit.passwordController,
                          // enableInteractive: false,
                          hintText: "Password",
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          isPassword: loginCubit.isPasswordVisible,
                          suffixIcon: loginCubit.isPasswordVisible
                              ? Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      loginCubit.togglePasswordVisibility();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(hidePassword),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      loginCubit.togglePasswordVisibility();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(showPassword),
                                    ),
                                  ),
                                ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SvgPicture.asset(lock),
                          ),
                          suffix: true,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "Password must be not Empty.";
                            } else if (!value.trim().contains(
                                RegExp(validatePasswordUpperCase))) {
                              return "Password must Contains UpperCase Letter.";
                            } else if (!value
                                .trim()
                                .contains(RegExp(validatePasswordDigits))) {
                              return "Password must Contains Digit.";
                            } else if (!value.trim().contains(
                                RegExp(validatePasswordLowerCase))) {
                              return "Password must Contains LowerCase Letter.";
                            } else if (!value.trim().contains(
                                RegExp(validatePasswordSpecialChar))) {
                              return "Password must Contains Special Character.";
                            } else if (value.trim().length < 8) {
                              return "Password must be more 8 Letters.";
                            } else if (!RegExp(validationPassword)
                                .hasMatch(value.trim())) {
                              return "Password is not Valid.";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              loginCubit.checkUnCheckBox(
                                password: LoginCubit.passwordController.text,
                                email: LoginCubit.emailController.text,
                              );
                            },
                            child: CustomCheckbox(
                              isChecked: loginCubit.isCheckedBox,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          CustomText(
                            text: 'Remember me',
                            fontSize: textFont12,
                            textAlign: TextAlign.start,
                            color: grey600,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          context.push(ForgotPassword());
                        },
                        child: CustomText(
                          text: 'Forgot password?',
                          textDecoration: TextDecoration.underline,
                          color: ThemeCubit.get(context).isDark
                              ? grey300
                              : grey700,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 58.h,
                  ),
                  (LoginCubit.emailController.text.isNotEmpty &&
                          LoginCubit.passwordController.text.isNotEmpty)
                  ? MainButton(
                    title: 'Log in',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        loginCubit.loginData(
                          LoginCubit.emailController.text,
                          LoginCubit.passwordController.text,
                          context,
                        );
                        // setState(() {
                        //   autoPlayEmail = false;
                        //   autoPlayPassword = false;
                        // });
                      } else {
                        // setState(() {
                        //   // autoPlayEmail = true;
                        //   // autoPlayPassword = true;
                        //   debugPrint(autoPlayEmail.toString());
                        //   Future.delayed(const Duration(milliseconds: 1500),
                        //       () {
                        //     setState(() {
                        //       autoPlayEmail = false;
                        //       autoPlayPassword = false;
                        //     });
                        //   });
                        // });
                      }
                    },
                  )
                      : GestureDetector(
                          onTap: () {
                            if (LoginCubit.emailController.text == '' &&
                                LoginCubit.passwordController.text == '') {
                              debugPrint('EMPTY!!!!!!!');
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
                              text: 'Log in',
                            )),
                          ),
                        ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Don\'t have an Account? ',
                        color: ThemeCubit.get(context).isDark ? white : grey600,
                        fontSize: textFont14,
                        fontWeight: FontWeight.w500,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(SignUpScreen());
                        },
                        child: CustomText(
                          text: 'Sign up',
                          color: mainColor,
                          textDecoration: TextDecoration.underline,
                          fontSize: textFont14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}

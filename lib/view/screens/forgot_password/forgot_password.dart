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
import 'package:odc_offline/view/constant/data.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view/screens/forgot_password/get_code.dart';
import 'package:odc_offline/view_model/cubit/forget_password/forget_password_cubit.dart';
import 'package:odc_offline/view_model/cubit/forget_password/forget_password_state.dart';

// ignore: must_be_immutable
class ForgotPassword extends StatelessWidget {
  static final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  ForgotPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
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
                      text: "Mail Address Here",
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
                          'Enter the email address associated with your account',
                      fontSize: textFont14.sp,
                      textAlign: TextAlign.center,
                      color: grey600,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  TextFormFieldsCustom(
                    // enableInteractive: true,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    hintText: 'Email',
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 8.w,
                      ),
                      child: SvgPicture.asset(
                        width: 20.w,
                        height: 14.76.h,
                        email,
                        fit: BoxFit.contain,
                      ),
                    ),

                    controller: emailController,
                    // validate
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return "email must be not Empty";
                      } else if (!RegExp(validationEmail)
                          .hasMatch(value.trim())) {
                        return "email is not Valid";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButton(
                    onClick: () {
                      if (formKey.currentState!.validate()) {
                        ForgetPasswordCubit.get(context)
                            .forgotPassword(emailController.text, context);
                      }
                    },
                    title: CustomText(
                      text: 'Send',
                      fontSize: btnFont16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )),
        ),
      );
    }, listener: (context, state) {
      if (state is ForgotPasswordDataLoading) {
        ForgetPasswordCubit.get(context).forgotPasswordIsLoading = true;
      }
      else if (state is ForgotPasswordDataError) {
        ForgetPasswordCubit.get(context).forgotPasswordIsLoading = false;
        showToast(
            message:
                ForgetPasswordCubit.get(context).forgotPasswordStatusMessage);
      }
      else if (state is ForgotPasswordDataSuccess) {
        ForgetPasswordCubit.get(context).forgotPasswordIsLoading = false;

        context.push(GetCode());
      }
    if (ForgetPasswordCubit.get(context).forgotPasswordIsLoading) {
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/components/core/buttons/custom_button.dart';
import 'package:odc_offline/view/components/core/component.dart';
import 'package:odc_offline/view/components/core/custom_appbar.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/components/core/scaffold_custom/scaffold_custom.dart';
import 'package:odc_offline/view/components/core/timer.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view/screens/forgot_password/enter_new_password.dart';
import 'package:odc_offline/view_model/cubit/forget_password/forget_password_cubit.dart';
import 'package:odc_offline/view_model/cubit/forget_password/forget_password_state.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class GetCode extends StatelessWidget {
  static final formKey = GlobalKey<FormState>();
  TextEditingController codeController = TextEditingController();

  GetCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit,ForgetPasswordState>(
      builder: (context,state){
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 72.h,
            ),
            Center(
              child: CustomText(
                text: "Get Your Code",
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
                    'Please  enter the 4 digital code that sent to your email address',
                fontSize: textFont14.sp,
                textAlign: TextAlign.center,
                color: grey600,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 56.h,
            ),
            PinCodeTextField(
              autovalidateMode: AutovalidateMode.disabled,
              //focusNode: pinCodeFocusNode,
              autoFocus: true,
              onChanged: (value) {},
              appContext: context,
              pastedTextStyle: TextStyle(
                  color: grey600,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  fontFamily: 'poppins'),
              textStyle: TextStyle(
                  color: grey600,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  fontFamily: 'poppins'),
              length: 4,
              obscureText: false,
              obscuringCharacter: '#',
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              validator: (v) {
                if (v!.length < 4) {
                  return 'Please enter 4 characters';
                } else {}
                return null;
              },
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8.r),
                  fieldHeight: 48.h,
                  fieldWidth: 48.w,
                  activeFillColor:
                      ThemeCubit.get(context).isDark ? darkButton : grey300,
                  inactiveFillColor:
                      ThemeCubit.get(context).isDark ? darkButton : grey300,
                  inactiveColor:
                      ThemeCubit.get(context).isDark ? darkButton : grey300,
                  activeColor:
                      ThemeCubit.get(context).isDark ? darkButton : grey300,
                  selectedColor:
                      ThemeCubit.get(context).isDark ? darkButton : grey300,
                  selectedFillColor:
                      ThemeCubit.get(context).isDark ? darkButton : grey300,
                  fieldOuterPadding: const EdgeInsets.all(0)),
              cursorColor: white,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              controller: codeController,
              keyboardType: TextInputType.number,
              boxShadows: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ],
              onCompleted: (v) {
                codeController.text = v; // Store the entered PIN code
              },
              beforeTextPaste: (text) {
                debugPrint("Allowing to paste $text");
                return true;
              },
            ),
            SizedBox(
              height: 48.h,
            ),
            CustomButton(
              onClick: () {
                if (formKey.currentState!.validate()) {
                  print("@@@@@@@@@@@@@@ ${codeController.text}");
                  ForgetPasswordCubit.get(context)
                      .confirmCodeData(codeController.text, context);
                }
              },
              title: CustomText(
                text: 'Verify',
                fontSize: btnFont16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            Timer(),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                  text: 'Didn’t receive code ?',
                  color: grey600,
                  fontSize: textFont16,
                  fontWeight: FontWeight.w400,
                ),
                InkWell(
                  highlightColor: white,
                  splashColor: white,
                  onTap: () {},
                  child: CustomText(
                    textDecoration: TextDecoration.underline,
                    decorationColor: mainColor,
                    text: ' Resend',
                    color: mainColor,
                    fontSize: textFont16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
      }, listener: (context,state){
              if (state is ConfirmCodeLoading) {
        ForgetPasswordCubit.get(context).confirmCodeIsLoading = true;
         ForgetPasswordCubit.get(context).forgotPasswordIsLoading = false;
      }
      else if (state is ConfirmCodeError) {
         ForgetPasswordCubit.get(context).forgotPasswordIsLoading = false;
        ForgetPasswordCubit.get(context).confirmCodeIsLoading = false;
        showToast(
            message:
                ForgetPasswordCubit.get(context).confirmCodeStatusMessage);
      }
      else if (state is ConfirmCodeSuccess) {
         ForgetPasswordCubit.get(context).confirmCodeIsLoading = false;
        ForgetPasswordCubit.get(context).forgotPasswordIsLoading = false;

        context.push(EnterNewPassword());
      }
       if (ForgetPasswordCubit.get(context).confirmCodeIsLoading) {
         ForgetPasswordCubit.get(context).forgotPasswordIsLoading = false;
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

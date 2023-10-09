import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:odc_offline/model/auth/forget/confirm_code_model.dart';
import 'package:odc_offline/model/auth/forget/forget_password_model.dart';
import 'package:odc_offline/view_model/cubit/forget_password/forget_password_state.dart';
import 'package:odc_offline/view_model/database/network/dio_helper.dart';
import 'package:odc_offline/view_model/database/network/end_points.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitialState());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  // IconData suffixNewPassowd = Icons.remove_red_eye_outlined;
  // IconData suffixConfirmNewPassword = Icons.remove_red_eye_outlined;
  bool isPasswordNewPassword = true;
  bool isPasswordConfirmNewPassword = true;

  bool forgotPasswordIsLoading = false;
  bool confirmCodeIsLoading = false;
  bool enterNewPasswordIsLoading = false;

  // bool isCheckedBox = false;

  void changeSuffixNewPassowd() {
    isPasswordNewPassword = !isPasswordNewPassword;

    emit(ChangeNewPasswordVisibilityState());
  }

  void changeSuffixConfirmNewPassword() {
    isPasswordConfirmNewPassword = !isPasswordConfirmNewPassword;
    emit(ChangeConfirmNewPasswordVisibilityState());
  }

  late ForgotPasswordModel forgotPasswordModel;

  String forgotPasswordStatusMessage = '';

  forgotPassword(String email, BuildContext context) async {
    print(email);
    emit(ForgotPasswordDataLoading());
    var data = {
      'email': email,
    };

    await DioHelper.postData(url: baseUrlAuth + forgetPassword, data: data)
        .then((value) {
      forgotPasswordModel = ForgotPasswordModel.fromJson(value.data);
      emit(ForgotPasswordDataSuccess(forgotPasswordModel));
      print(value.statusCode);
      print(value.statusMessage);
    }).catchError((error) {
      if (error.response != null) {
        forgotPasswordStatusMessage = error.response.statusMessage;
        debugPrint(forgotPasswordStatusMessage);
        emit(ForgotPasswordDataError(forgotPasswordStatusMessage));
      } else {
        debugPrint(error.toString());
        emit(ForgotPasswordDataError(error.toString()));
      }
    });
  }

  late ConfirmCodeModel confirmCodeModel;
  late String confirmCodeToken;
  String confirmCodeStatusMessage = '';

  confirmCodeData(String code, BuildContext context) async {
    emit(ConfirmCodeLoading());
    var data = {
      'code': code,
    };

    await DioHelper.postData(url: baseUrlAuth + confirmCode, data: data)
        .then((value) {
      confirmCodeModel = ConfirmCodeModel.fromJson(value.data);
      emit(ConfirmCodeSuccess(confirmCodeModel));
      print(value.statusCode);
      print(value.statusMessage);
      print("data ${value.data}");
      if (value.data != null && value.data is Map) {
        Map<String, dynamic> responseData = value.data;
        if (responseData.containsKey('data') && responseData['data'] is Map) {
          Map<String, dynamic> dataMap = responseData['data'];
          if (dataMap.containsKey('token')) {
            String token = dataMap['token'];
            print('Token----------------------------------->> : $token');
            confirmCodeToken = token;
          }
        }
      }
    }).catchError((error) {
      if (error.response != null) {
        confirmCodeStatusMessage = error.response.statusMessage;
        debugPrint(confirmCodeStatusMessage);
        emit(ConfirmCodeError(confirmCodeStatusMessage));
      } else {
        debugPrint(error.toString());
        emit(ConfirmCodeError(error.toString()));
      }

      debugPrint(error.toString());
      emit(ConfirmCodeError(error.toString()));
    });
  }

  String resetNewPasswordStatusMessage = '';

  resetNewPassword(String newPassword, String newPasswordConfirm,
      BuildContext context) async {
    try {
      emit(ResetPasswordLoading());
      var data = {
        "newPassword": newPassword,
        "newPasswordConfirm": newPasswordConfirm,
        "token": confirmCodeToken
      };
      var response = await http.post(
        Uri.parse(baseUrl + baseUrlAuth + resetPassword),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $confirmCodeToken',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        emit(ResetPasswordSuccess());
        debugPrint("sucesssssss");
      } else {
        final responseBody = jsonDecode(response.body);
        if (responseBody.containsKey('message') &&
            responseBody['message'] is List) {
          //resetNewPasswordStatusMessage = responseBody['message'].join('\n');
          resetNewPasswordStatusMessage = responseBody['message'][0];
        } else {
          resetNewPasswordStatusMessage =
              'An error occurred while resetting password.';
        }

        debugPrint("Error: ${response.statusCode}");
        emit(ResetPasswordError(response.body));
      }
    } catch (error) {
      debugPrint(error.toString());
      emit(ResetPasswordError(error.toString()));
    }
  }
}

import 'package:odc_offline/model/auth/forget/confirm_code_model.dart';
import 'package:odc_offline/model/auth/forget/forget_password_model.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitialState extends ForgetPasswordState {}

class ForgotPasswordLoading extends ForgetPasswordState {}

class ChangeNewPasswordVisibilityState extends ForgetPasswordState {}

class ChangeConfirmNewPasswordVisibilityState extends ForgetPasswordState {}

class ClearPinTextFieldState extends ForgetPasswordState {}

class ForgotPasswordDataLoading extends ForgetPasswordState {}

class ForgotPasswordDataSuccess extends ForgetPasswordState {
  final ForgotPasswordModel forgotPasswordModel;
  ForgotPasswordDataSuccess(this.forgotPasswordModel);
}

class ForgotPasswordDataError extends ForgetPasswordState {
  String error;
  ForgotPasswordDataError(this.error);
}

class ConfirmCodeLoading extends ForgetPasswordState {}

class ConfirmCodeSuccess extends ForgetPasswordState {
  final ConfirmCodeModel confirmCodeModel;
  ConfirmCodeSuccess(this.confirmCodeModel);
}

class ConfirmCodeError extends ForgetPasswordState {
  String error;
  ConfirmCodeError(this.error);
}

class ResetPasswordLoading extends ForgetPasswordState {}

class ResetPasswordSuccess extends ForgetPasswordState {
  // final ResetPasswordModel resetPasswordModel;
  // ResetPasswordSuccess(this.resetPasswordModel);
  ResetPasswordSuccess();
}

class ResetPasswordError extends ForgetPasswordState {
  String error;
  ResetPasswordError(this.error);
}

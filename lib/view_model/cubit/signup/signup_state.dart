import 'package:odc_offline/model/signup_model.dart';

abstract class SignupState  {}

class InitSignupState extends SignupState {}

class OnTextChangeFirstName extends SignupState {}
class OnTextChangeLastName extends SignupState {}
class OnTextChangePhoneNumber extends SignupState {}
class OnTextChangeNationalId extends SignupState {}
class OnTextChangeEmail extends SignupState {}
class OnTextChangePassword extends SignupState {}
class OnTextChangeConfirmPassword extends SignupState {}


class VerifyPhoneSignupLoading extends SignupState {}
class VerifyPhoneSignupSuccess extends SignupState {}
class VerifyPhoneSignupError extends SignupState {}


class VerifyOtpSignupLoading extends SignupState {}
class VerifyOtpSignupSuccess extends SignupState {}
class VerifyOtpSignupError extends SignupState {}

class SignupLoadingState extends SignupState {}
class SignupSuccessState extends SignupState {}
class SignupErrorState extends SignupState {}

class ClearPersonSignup extends SignupState {}
class ClearCompanySignup extends SignupState {}

class ChangeCheckBox extends SignupState {}


class PasswordChangeState extends SignupState  {}
class ConfirmPasswordChangeState extends SignupState  {}
class CheckBoxChangeState extends SignupState  {}

class MainServiceLoading extends SignupState {}
class MainServiceSuccess extends SignupState {}
class MainServiceError extends SignupState {}

class SaveMainService extends SignupState {}

class ItemListCity extends SignupState {}

class FormValidation extends SignupState {}

class SetDataState extends SignupState {}

class SignupDataLoading extends SignupState {}
class SignupDataSuccess extends SignupState {
  final SignupModel signupModel;

  SignupDataSuccess(this.signupModel);
}
class SignupDataError extends SignupState {
  String error;
  SignupDataError(this.error);
}


class GetTermsAndConditionsLoadingState extends SignupState {}

class GetTermsAndConditionsSuccessState extends SignupState {}

class GetTermsAndConditionsErrorState extends SignupState {
  String error;
  GetTermsAndConditionsErrorState(this.error);
}



class GetTermsDataLoading extends SignupState {}

class GetTermsDataSuccess extends SignupState {}

class GetTermsDataError extends SignupState {
  String error;
  GetTermsDataError(this.error);
}

class GetConsentDataLoading extends SignupState {}

class GetConsentDataSuccess extends SignupState {}

class GetConsentDataError extends SignupState {
  String error;
  GetConsentDataError(this.error);
}


class PostTermsDataLoading extends SignupState {}
class PostTermsDataSuccess extends SignupState {}
class PostTermsDataError extends SignupState {
  String error;
  PostTermsDataError(this.error);
}


class PostConsentDataLoading extends SignupState {}
class PostConsentDataSuccess extends SignupState {}
class PostConsentDataError extends SignupState {
  String error;
  PostConsentDataError(this.error);
}

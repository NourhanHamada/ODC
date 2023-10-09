// ignore_for_file: must_be_immutable

part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}


class LoginSuccess extends LoginState {
  LoginModel loginModel;
  LoginSuccess({required this.loginModel});
}

class LoginError extends LoginState {}

class PasswordShow extends LoginState {}

class TextFieldValid extends LoginState {}

class TextFieldInvalid extends LoginState {
  final String? error;

  TextFieldInvalid({required this.error});
}

class LoginDataLoading extends LoginState{}

class LoginDataSuccess extends LoginState {
  final LoginModel loginModel;
  LoginDataSuccess(this.loginModel);

}


class LoginDataError extends LoginState {
  String error;
  LoginDataError(this.error);}


class ChangeCheckBoxState extends LoginState {
  var value, email, password;
  ChangeCheckBoxState({this.value, this.password, this.email, });
}


class CacheIfSeenState extends LoginState{
  bool isSeen;

  CacheIfSeenState(this.isSeen);
}
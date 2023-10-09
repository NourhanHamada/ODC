part of 'create_password_cubit.dart';

@immutable
abstract class CreatePasswordState {}

class CreatePasswordInitial extends CreatePasswordState {}

class CreatePasswordSuccessful extends CreatePasswordState {}

class CreatePasswordFail extends CreatePasswordState {}

// class CreateEightChar extends CreatePasswordState {}
//
// class CreateUpperCase extends CreatePasswordState {}
//
// class CreateLowerCase extends CreatePasswordState {}
//
// class CreateSpecialChar extends CreatePasswordState {}

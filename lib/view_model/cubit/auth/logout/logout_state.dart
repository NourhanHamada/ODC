part of 'logout_cubit.dart';

@immutable
abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoadingState extends LogoutState {}

class LogoutSuccessfulState extends LogoutState {}

class LogoutFailState extends LogoutState {}

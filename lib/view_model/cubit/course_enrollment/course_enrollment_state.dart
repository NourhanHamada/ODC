part of 'course_enrollment_cubit.dart';

@immutable
abstract class CourseEnrollmentState {}

class CourseEnrollmentInitial extends CourseEnrollmentState {}

class CourseEnrollmentChangePageIndex extends CourseEnrollmentState {}

class CourseEnrollmentChangButtonColor extends CourseEnrollmentState {}

class CourseEnrollmentLoading extends CourseEnrollmentState {}

class CourseEnrollmentSuccess extends CourseEnrollmentState {}

class CourseEnrollmentFail extends CourseEnrollmentState {}

class VerifyOtpLoading extends CourseEnrollmentState {}

class VerifyOtpSuccess extends CourseEnrollmentState {}

class VerifyOtpFail extends CourseEnrollmentState {}

class GetFacultiesLoading extends CourseEnrollmentState {}

class GetFacultiesSuccess extends CourseEnrollmentState {}

class GetFacultiesFail extends CourseEnrollmentState {}

class SelectDate extends CourseEnrollmentState {}

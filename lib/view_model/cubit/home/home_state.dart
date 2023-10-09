abstract class HomeState {}

class HomeInitialState extends HomeState {}

class GetDivisionsLoadingState extends HomeState {}

class GetDivisionsSuccessState extends HomeState {}

class GetDivisionsErrorState extends HomeState {
  String error;
  GetDivisionsErrorState(this.error);
}


class GetUserCoursesLoadingState extends HomeState {}

class GetUserCoursesSuccessState extends HomeState {}

class GetUserCoursesErrorState extends HomeState {
  String error;
  GetUserCoursesErrorState(this.error);
}


class GetAllCoursesLoadingState extends HomeState {}

class GetAllCoursesSuccessState extends HomeState {}

class GetAllCoursesErrorState extends HomeState {
  String error;
  GetAllCoursesErrorState(this.error);
}

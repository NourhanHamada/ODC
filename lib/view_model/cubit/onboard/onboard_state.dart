part of 'onboard_cubit.dart';

@immutable
abstract class OnboardState {}

class OnboardInitial extends OnboardState {}

class ChangeCurrentIndexState extends OnboardState {}

class SeenOnboard extends OnboardState {}

class OnboardDataLoading extends OnboardState {}

class OnboardDataSuccess extends OnboardState {
  final List<OnboardModel> onboardList;

  OnboardDataSuccess(this.onboardList);
  @override
  List<Object?> get props => [onboardList];
}

class OnboardDataFail extends OnboardState {}

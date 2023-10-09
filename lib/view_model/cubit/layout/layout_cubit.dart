import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_offline/view/screens/layout/dashboard_screen.dart';
import 'package:odc_offline/view/screens/layout/learning_screen.dart';
import 'package:odc_offline/view/screens/layout/profile_screen.dart';
import '../../../view/screens/layout/home_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);

  var currentIndex = 0;

  List<Widget> screens = const [
    HomeScreen(),
    LearningScreen(),
    DashboardScreen(),
    ProfileScreen(),
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}

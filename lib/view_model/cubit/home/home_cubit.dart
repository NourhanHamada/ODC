
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_offline/view/constant/data.dart';
import 'package:odc_offline/view_model/cubit/home/home_state.dart';
import 'package:odc_offline/view_model/database/network/dio_helper.dart';
import 'package:odc_offline/view_model/database/network/end_points.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List divisionsList = [];
  List allCoursesList = [];
  List userCoursesList = [];

  getDivisionsData() async {
  
    emit(GetDivisionsLoadingState());
    await DioHelper.getData(url: divisions, token: accessToken).then((value) {
      emit(GetDivisionsSuccessState());
      divisionsList = value.data['data'];
      debugPrint("__________________________________)))))))))))))))");
      print(divisionsList);
    }).catchError((String error) {
      emit(GetDivisionsErrorState(error.toString()));
    });
  }

  getAllCoursesData() async {
    emit(GetAllCoursesLoadingState());
    debugPrint("all courses)))))))))))))))");
    debugPrint(accessToken);
    await DioHelper.getData(url: allCourses, token: accessToken).then((value) {
      emit(GetAllCoursesSuccessState());
    

      allCoursesList = value.data['data'];
      print(allCoursesList);
    }).catchError((error, stackTrace) {
      debugPrint('Error occurred: $error');
      emit(GetAllCoursesErrorState(error.toString()));
    });

  }

  getUserCoursesData() async {
    emit(GetUserCoursesLoadingState());
    debugPrint("user courses)))))))))))))))");
    print(accessToken);
    await DioHelper.getData(url: userCourses, token: accessToken).then((value) {
      emit(GetUserCoursesSuccessState());
      

     userCoursesList =value.data['data'];

      debugPrint("__________________________________)))))))))))))))");
      print(userCoursesList);
    }).catchError((error, stackTrace) {
      debugPrint('Error occurred: $error');
      emit(GetUserCoursesErrorState(error.toString()));
    });
  }
}

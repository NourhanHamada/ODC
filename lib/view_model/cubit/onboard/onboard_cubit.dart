import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_offline/model/onboard/onboard_model.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit(this.context) : super(OnboardInitial());

  OnboardCubit get(context) => BlocProvider.of(context);

  static int currentIndex = 0;
  final PageController pageController = PageController();

  // static List<String> illustrations = [
  //   illustration1,
  //   illustration2,
  //   illustration3,
  // ];
  // List<String> titles = [
  //   'Learning paths',
  //   'Assessments',
  //   'Development',
  // ];
  // List<String> subTitles = [
  //   'allow users to tailor their learning experience to their individual needs and goals',
  //   'Make quizzes and assignments to  courses and learning resources that are most relevant to the user\'s interests and goals.',
  //   'Our app offers a variety of courses to help you develop new skills and grow professionally',
  // ];
  static int pageCount = 0;
  String buttonText = currentIndex == pageCount - 1 ? 'Get Started' : 'Next';
  bool isLastScreen = false;
  final BuildContext context;

  void changeCurrentIndex(int index) {
    if (index == pageCount - 1) {
      buttonText = 'Get started';
      isLastScreen = true;
    } else {
      buttonText = 'Next';
      isLastScreen = false;
    }

    // if (index != pageCount - 1) {
    //   buttonText = 'Next';
    // } else if (index == pageCount - 1) {
    //   buttonText = 'Get started';
    // }
    // if (index == pageCount - 1) {
    //   isFirstPage = false;
    // } else {
    //   isFirstPage = true;
    // }
    emit(ChangeCurrentIndexState());
  }

  static List<OnboardModel> onboardList = [];

  static OnboardModel? onboardModel;
  bool done = false;

  Future<void> getOnboardData() async {
    emit(OnboardDataLoading());
    try {
      await DioHelper.getData(url: onboard).then((value) {
        print(value.data);
        onboardModel = OnboardModel.fromJson(value.data);

        // debugPrint(test!.data![0].title.toString());
        done = true;
        pageCount = onboardModel!.data!.length;
        debugPrint('page count =========>  ${pageCount.toString()}');
        print(onboardModel!.data);
        emit(OnboardDataSuccess(onboardList));
        // debugPrint('SUCCESS');
      }).catchError((onError) {
        done = false;
        debugPrint(onError.toString());
      });
    } catch (error) {
      done = false;
      debugPrint(error.toString());
      emit(OnboardDataFail());
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_offline/view_model/database/network/dio_helper.dart';
import 'package:odc_offline/view_model/database/network/end_points.dart';
import '../../../view/constant/color_manager.dart';
import '../../../view/constant/data.dart';
import '../../database/local/cache_helper.dart';

part 'course_enrollment_state.dart';

class CourseEnrollmentCubit extends Cubit<CourseEnrollmentState> {
  CourseEnrollmentCubit() : super(CourseEnrollmentInitial());

  CourseEnrollmentCubit get(context) => BlocProvider.of(context);

  final PageController pageController = PageController();
  final firstFormKey = GlobalKey<FormState>();
  final secondFormKey = GlobalKey<FormState>();
  final thirdFormKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController firstNameController =
      TextEditingController(text: userFirstName);
  final TextEditingController lastNameController =
      TextEditingController(text: userLastName);
  final TextEditingController emailController =
      TextEditingController(text: userEmail);
  final TextEditingController phoneController =
      TextEditingController(text: userPhoneNumber);
  final TextEditingController idController =
      TextEditingController(text: userNationalId);
  final TextEditingController governorateController =
      TextEditingController(text: userGovernorate);
  final TextEditingController countryController =
      TextEditingController(text: userCountry);
  final TextEditingController birthDateController =
      TextEditingController(text: userBirthdate);
  final TextEditingController universityController =
      TextEditingController(text: userUniversity);
  final TextEditingController facultyController =
      TextEditingController(text: userFaculty);
  final TextEditingController majorController =
      TextEditingController(text: userMajor);
  final TextEditingController genderController =
      TextEditingController(text: userGender);
  final TextEditingController classStandingController =
      TextEditingController(text: userClassStanding);
  final TextEditingController statusOfGraduationController =
      TextEditingController(text: userStatusOfGraduation);
  final TextEditingController graduationYearController =
      TextEditingController(text: userGraduationYear);
  final TextEditingController insertedFieldController =
      TextEditingController(text: userInsertedField);
  final TextEditingController linkedinController =
      TextEditingController(text: userLinkedIn);
  final TextEditingController githubOrBehanceController =
      TextEditingController(text: userGithub);
  bool isFormFilled = false;
  int currentIndex = 0;
  int activeStep = 0;

  changePageIndex(int index) {
    currentIndex = index;
    emit(CourseEnrollmentChangePageIndex());
  }

  Color secondButtonColor = grey800;

  changeSecondButtonColor(String value) {
    if (governorateController.text != '' &&
        countryController.text != '' &&
        birthDateController.text != '' &&
        universityController.text != '' &&
        facultyController.text != '' &&
        majorController.text != '' &&
        genderController.text != '') {
      secondButtonColor = mainColor;
    }
    emit(CourseEnrollmentChangButtonColor());
  }

  Color thirdButtonColor = grey800;

  changeThirdButtonColor(String value) {
    if (classStandingController.text != '' &&
        statusOfGraduationController.text != '' &&
        graduationYearController.text != '' &&
        insertedFieldController.text != '' &&
        linkedinController.text != '' &&
        githubOrBehanceController.text != '') {
      thirdButtonColor = mainColor;
    }
    emit(CourseEnrollmentChangButtonColor());
  }

  Color pinCodeButtonColor = grey800;

  changePinCodeButtonColor(String value) {
    if (codeController.text.length == 4) {
      pinCodeButtonColor = mainColor;
    }
    emit(CourseEnrollmentChangButtonColor());
  }

  int courseId = 25;

  late String formErrorMessage;
  Future<void> postCourseEnrollmentData({
    required String governorate,
    required String country,
    required String birthdate,
    required String university,
    required String faculty,
    required String major,
    required String gender,
    required String classStanding,
    required String statusOfGraduation,
    required String graduationYear,
    required String insertedField,
    required String linkedIn,
    required String github,
  }) async {
    emit(CourseEnrollmentLoading());
    var data = {
      "courseId": courseId,
      "country": country,
      "governate": governorate,
      "birthdate": birthdate,
      "university": university,
      "faculty": faculty,
      "major": major,
      "gender": gender,
      "class_standing": classStanding,
      "graduation_status": statusOfGraduation,
      "graduation_year": graduationYear,
      "interested_field": insertedField,
      "linkedin": linkedIn,
      "github_behance": github,
    };
    await DioHelper.postData(
      url: courseEnrollmentFormEndPoint,
      data: data,
      token: accessToken,
    ).then((value) {
      debugPrint(value.data.toString());
      emit(CourseEnrollmentSuccess());
    }).catchError((onError) {
      // formErrorMessage = onError.response.data['message'].toString();
      // print(formErrorMessage);
      debugPrint(onError.response.toString());
      emit(CourseEnrollmentFail());
    });
  }

  late String errorMessage;
  Future<void> verifyCourseEnrollmentOTP({
    required String otp,
  }) async {
    emit(VerifyOtpLoading());
    var data = {
      "examOtp": otp,
      "courseId": courseId,
    };
    await DioHelper.postData(
      url: courseEnrollmentVerifyOTPEndPoint,
      data: data,
      token: accessToken,
    ).then((value) {
      if (value.data['statusCode'] == 200) {
        debugPrint('-----------------');
        debugPrint(value.data['statusCode']);
        debugPrint(value.data['message']);
        debugPrint('-----------------');
        // var statusCode = value.data['statusCode'];
        var message = value.data['message'];
        debugPrint('==================');
        // debugPrint(statusCode);
        debugPrint(message);
        debugPrint('==================');
        debugPrint('Success');
      }
      emit(VerifyOtpSuccess());
    }).catchError((onError) {
      // debugPrint('ERROR');
      debugPrint(onError.response.toString());
      errorMessage = onError.response.data['message'].toString();
      debugPrint(onError.response.data['message'].toString());
      // debugPrint(onError.statusCode.toString());
      emit(VerifyOtpFail());
    });
  }

  List faculties = [];
  List governorates = [];
  List majors = [];
  List universities = [];
  List countries = [];

  Future<void> getFaculties() async {
    emit(GetFacultiesLoading());
    await DioHelper.getData(
      url: facultiesEndPoint,
    ).then((value) {
      faculties = value.data['data']['json'];
      debugPrint(value.data['data']['json'].toString());
      emit(GetFacultiesSuccess());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(GetFacultiesFail());
    });
  }

  Future<void> getGovernorates() async {
    emit(GetFacultiesLoading());
    await DioHelper.getData(
      url: governmentsEndPoint,
    ).then((value) {
      governorates = value.data['data']['json'];
      debugPrint(value.data['data']['json'].toString());
      emit(GetFacultiesSuccess());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(GetFacultiesFail());
    });
  }

  Future<void> getMajors() async {
    emit(GetFacultiesLoading());
    await DioHelper.getData(
      url: majorsEndPoint,
    ).then((value) {
      majors = value.data['data']['json'];
      debugPrint(value.data['data']['json'].toString());
      emit(GetFacultiesSuccess());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(GetFacultiesFail());
    });
  }

  Future<void> getUniversities() async {
    emit(GetFacultiesLoading());
    await DioHelper.getData(
      url: universitiesEndPoint,
    ).then((value) {
      universities = value.data['data']['json'];
      debugPrint(value.data['data']['json'].toString());
      emit(GetFacultiesSuccess());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(GetFacultiesFail());
    });
  }

  Future<void> getCountries() async {
    emit(GetFacultiesLoading());
    await DioHelper.getData(
      url: countriesEndPoint,
    ).then((value) {
      countries = value.data['data']['json'];
      print('00000000000');
      debugPrint(value.data['data']['json'].toString());
      emit(GetFacultiesSuccess());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(GetFacultiesFail());
    });
  }


  void cacheSecondFormData() async {
    await CacheHelper.put(
        key: governorateKey, value: governorateController.text);
    await CacheHelper.put(key: countryKey, value: countryController.text);
    await CacheHelper.put(key: birthdateKey, value: birthDateController.text);
    await CacheHelper.put(key: universityKey, value: universityController.text);
    await CacheHelper.put(key: facultyKey, value: facultyController.text);
    await CacheHelper.put(key: majorKey, value: majorController.text);
    await CacheHelper.put(key: genderKey, value: genderController.text);
  }

  void cacheThirdFormData() {
    CacheHelper.put(key: classStandingKey, value: classStandingController.text);
    CacheHelper.put(
        key: statusOfGraduationKey, value: statusOfGraduationController.text);
    CacheHelper.put(
        key: graduationYearKey, value: graduationYearController.text);
    CacheHelper.put(key: insertedFieldKey, value: insertedFieldController.text);
    CacheHelper.put(key: linkedInKey, value: linkedinController.text);
    CacheHelper.put(key: gitHubKey, value: githubOrBehanceController.text);
  }

// cacheFormData() async {
//   await CacheHelper.put(
//       key: governorateKey, value: governorateController.text);
//   await CacheHelper.put(key: countryKey, value: countryController.text);
//   await CacheHelper.put(key: birthdateKey, value: birthDateController.text);
//   await CacheHelper.put(key: universityKey, value: universityController.text);
//   await CacheHelper.put(key: facultyKey, value: facultyController.text);
//   await CacheHelper.put(key: majorKey, value: majorController.text);
//   await CacheHelper.put(key: genderKey, value: genderController.text);
//   CacheHelper.put(key: classStandingKey, value: classStandingController.text);
//   CacheHelper.put(
//       key: statusOfGraduationKey, value: statusOfGraduationController.text);
//   CacheHelper.put(
//       key: graduationYearKey, value: graduationYearController.text);
//   CacheHelper.put(key: insertedFieldKey, value: insertedFieldController.text);
//   CacheHelper.put(key: linkedInKey, value: linkedinController.text);
//   CacheHelper.put(key: gitHubKey, value: githubOrBehanceController.text);
//   print('================ CACHED ================');
// }
}

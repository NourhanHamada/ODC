import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view/screens/layout/layout.dart';
import 'package:odc_offline/view/screens/splash_and_onboard/onboard_screen.dart';
import 'package:odc_offline/view_model/database/network/dio_helper.dart';
import 'package:odc_offline/view_model/database/network/end_points.dart';
import '../../../../model/auth/login/login_model.dart';
import '../../../../view/constant/color_manager.dart';
import '../../../../view/constant/data.dart';
import '../../../database/local/cache_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context, listen: true);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  String email = '';
  String password = '';
  bool isPasswordVisible = true;
  Color buttonColor = grey800;
  bool isLoading = false;
  bool isFormDone = false;

  void formDone(){
    isFormDone = true;
  }

  void emailChanged(String emailValue) {
    email = emailValue;
    emit(LoginLoading());
  }

  void passwordChanged(String passwordValue) {
    if (emailController.text != '' && passwordController.text != '') {
      buttonColor = mainColor;
    } else {
      buttonColor = grey800;
    }
    password = passwordValue;
    emit(LoginLoading());
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordShow());
  }

  void formValidation() {
    if (!RegExp(validationEmail).hasMatch(email) ||
        !RegExp(validationPassword).hasMatch(password)) {
      emit(TextFieldInvalid(
          error: 'Incorrect Email or Password. Please try again'));
    } else {
      emit(TextFieldValid());
    }
  }

  late LoginModel loginModel;
  String loginStatusMessage = '';
  late String errorMessage;

  List userCourses = [];
  //List divisionsList = [];

  // loginData(String email,String password,BuildContext context)async {
  //   emit(LoginDataLoading());
  //   var data = {"email": email, "password": password};
  //
  //   print(email);
  //   print(password);
  //   await DioHelper.postData(
  //     url: baseUrlAuth + login,
  //     data: data,
  //   ).then((value) async{
  //     loginModel = LoginModel.fromJson(value.data['data']);
  //     print("((((((((((((((((((((model token))))))))))))))))))))");
  //     print(loginModel.access_token);
  //     print("_______________________________");
  //     print(value.data);
  //     print(value.statusMessage);
  //     loginStatusMessage=value.statusMessage!;
  //     print("((((((((((((((((((((user courses))))))))))))))))))))");
  //     userCourses=value.data['data']['userCourses'];
  //     print(userCourses);
  //     var response = await DioHelper.getData(url: divisions, token: value.data['data']['access_token']);
  //     divisionsList=response.data['data'];
  //
  //     //divisionsList= HomeCubit().getDivisionsData(value.data['data']['access_token']) as List<DivisionModel>;
  //     print("::::::::::::::::::::::::::::");
  //     print(divisionsList);
  //
  //
  //     var firstName = await value.data['data']['first_name'];
  //     var lastName = await value.data['data']['last_name'];
  //     var email = await value.data['data']['email'];
  //     var phoneNumber = await value.data['data']['phone'];
  //     var nationalId = await value.data['data']['nationalId'];
  //     var userAccessToken = await value.data['data']['access_token'];
  //     CacheHelper.put(key: firstNameKey, value: firstName);
  //     CacheHelper.put(key: lastNameKey, value: lastName);
  //     CacheHelper.put(key: emailKey, value: email);
  //     CacheHelper.put(key: phoneNumberKey, value: phoneNumber);
  //     CacheHelper.put(key: nationalIdKey, value: nationalId);
  //     CacheHelper.put(key: accessTokenKey, value: userAccessToken);
  //     getUserDate();
  //     emit(LoginDataSuccess(loginModel));
  //     print("success");
  //     context.push(const Layout());
  //   }).catchError((error) async {
  //     if (error.response != null) {
  //       errorMessage = await error.response.data['message'];
  //       print('ERROR ---> ${error.response.data['message']}');
  //       // String statusMessage = error.response.statusMessage;
  //       // loginStatusMessage = statusMessage;
  //       // debugPrint(statusMessage);
  //       emit(LoginDataError(error));
  //     } else {
  //       // debugPrint(error.toString());
  //       emit(LoginDataError(error.toString()));
  //     }
  //   });
  // }

  getUserDate() async {
    userFirstName = await CacheHelper.get(key: firstNameKey);
    userLastName = await CacheHelper.get(key: lastNameKey);
    userEmail = await CacheHelper.get(key: emailKey);
    userPhoneNumber = await CacheHelper.get(key: phoneNumberKey);
    userNationalId = await CacheHelper.get(key: nationalIdKey);
    accessToken = await CacheHelper.get(key: accessTokenKey);
    userGovernorate = await CacheHelper.get(key: governorateKey);
    userCountry = await CacheHelper.get(key: countryKey);
    userBirthdate = await CacheHelper.get(key: birthdateKey);
    userUniversity = await CacheHelper.get(key: universityKey);
    userFaculty = await CacheHelper.get(key: facultyKey);
    userMajor = await CacheHelper.get(key: majorKey);
    userGender = await CacheHelper.get(key: genderKey);
    userClassStanding = await CacheHelper.get(key: classStandingKey);
    userStatusOfGraduation = await CacheHelper.get(key: statusOfGraduationKey);
    userGraduationYear = await CacheHelper.get(key: graduationYearKey);
    userInsertedField = await CacheHelper.get(key: insertedFieldKey);
    userLinkedIn = await CacheHelper.get(key: linkedInKey);
    userGithub = await CacheHelper.get(key: gitHubKey);
    print("from get Data");
    print(accessToken);

    //userDivisions = await CacheHelper.get(key: userDivisionsKey);
  }

  Future<void> loginData(
      String email, String password, BuildContext context) async {
    emit(LoginLoading());
    var data = {
      "email": email,
      "password": password,
    };
    await DioHelper.postData(
      url: baseUrlAuth + login,
      data: data,
    ).then((value) async {
      loginModel = LoginModel.fromJson(value.data);
      loginStatusMessage = value.statusMessage!;
      // userCourses = value.data['data']['userCourses'];
      // var response = await DioHelper.getData(
      //     url: divisions, token: value.data['data']['access_token']);
      // divisionsList = response.data['data'];
      // userDivisions = divisionsList;
      // Cache User Data.
      var firstName = await value.data['data']['first_name'];
      var lastName = await value.data['data']['last_name'];
      var email = await value.data['data']['email'];
      var phoneNumber = await value.data['data']['phone'];
      var nationalId = await value.data['data']['nationalId'];
      var userAccessToken = await value.data['data']['access_token'];
      CacheHelper.put(key: firstNameKey, value: firstName);
      CacheHelper.put(key: lastNameKey, value: lastName);
      CacheHelper.put(key: emailKey, value: email);
      CacheHelper.put(key: phoneNumberKey, value: phoneNumber);
      CacheHelper.put(key: nationalIdKey, value: nationalId);
      CacheHelper.put(key: accessTokenKey, value: userAccessToken);
      //CacheHelper.put(key: userDivisionsKey,value: userDivisions );
      getUserDate();
      // context.push(const Layout());
      emit(LoginDataSuccess(loginModel));
    }).catchError(
      (error) async {
        // print('=============');
        print(error.toString());
        errorMessage = error.response.data['message'].toString();
        // print(error.response.data['message'].toString());
        emit(LoginDataError(error.toString()));

        // errorMessage = error.response.data['message'].toString();
        // if (error.response != null) {
        //   // errorMessage = await error.response.data['message'];
        //   emit(LoginDataError(error.toString()));
        //   // debugPrint('ERROR ---> ${error.response.data['message']}');
        //   // debugPrint(errorMessage);
        //   // String statusMessage = error.response.statusMessage;
        //   // loginStatusMessage = statusMessage;
        //   isLoading = false;
        //   context.pop();
        //   emit(LoginDataError(error.toString()));
        // } else {
        //   isLoading = false;
        //   emit(LoginDataError(error.toString()));
        // }
      },
    );
  }

  // cache Remember me.
  bool isCheckedBox = false;

  void checkUnCheckBox(
      {required String email, required String password}) async {
    isCheckedBox = !isCheckedBox;
    if (isCheckedBox) {
      await CacheHelper.put(key: 'email', value: email);
      await CacheHelper.put(key: 'password', value: password);
      await CacheHelper.put(key: 'remember me', value: isCheckedBox);
    } else {
      CacheHelper.removeData(key: 'email');
      CacheHelper.removeData(key: 'password');
    }
    emit(ChangeCheckBoxState(
      value: isCheckedBox,
      email: email,
      password: password,
    ));
  }

  void loadRememberMe() async {
    bool rememberMe = CacheHelper.get(key: 'remember me') ?? false;
    String email = rememberMe ? CacheHelper.get(key: 'email') ?? '' : '';
    String password = rememberMe ? CacheHelper.get(key: 'password') ?? '' : '';

    if (rememberMe) {
      emailController.text = CacheHelper.get(key: 'email') ?? '';
      passwordController.text = CacheHelper.get(key: 'password') ?? '';
    }
    emit(ChangeCheckBoxState(
      value: rememberMe,
      email: email,
      password: password,
    ));
  }

// cache if user login
  bool defaultSeenValue = false;

  void cacheIfLogin(bool value) async {
    await CacheHelper.put(key: 'seen', value: value);
    emit(CacheIfSeenState(value));
  }

  void getSeenData(BuildContext context) {
    bool isSeen = CacheHelper.get(key: 'seen') ?? defaultSeenValue;
    if (isSeen) {
      context.push(const Layout());
    } else {
      context.push(const OnboardScreen());
    }
    emit(CacheIfSeenState(isSeen));
  }
}

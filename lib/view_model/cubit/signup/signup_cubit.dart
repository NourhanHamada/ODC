import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_offline/model/signup_model.dart';
import 'package:odc_offline/view_model/database/local/cache_helper.dart';
import '../../../../view/components/core/component.dart';
import '../../../view/constant/data.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(InitSignupState());

  static SignupCubit get(context) => BlocProvider.of(context);

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isAgreeTerms = false;
  bool isPasswordCharacters = false;
  bool hasPasswordNumber = false;
  bool hasEmailValid = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();

  //focus nodes
  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode phoneNumberFocus = FocusNode();
  FocusNode nationalIdFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    debugPrint("show password");
    emit(PasswordChangeState());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    debugPrint("show confirm password");
    emit(ConfirmPasswordChangeState());
  }

  void changeIsAgreeTerms() {
    isAgreeTerms = !isAgreeTerms;
    debugPrint("agree terms");
    emit(ChangeCheckBox());
  }

  // void updateTextFirstName(String? value) {
  //   firstNameController.text = value!;
  //   emit(OnTextChangeFirstName());
  // }

  // void updateTextLastName(String? value) {
  //   lastNameController.text = value!;
  //   emit(OnTextChangeLastName());
  // }

  // void updateTextPhoneNumber(String? value) {
  //   phoneNumberController.text = value!;
  //   emit(OnTextChangePhoneNumber());
  // }

  // void updateTextEmail(String? value) {
  //   emailController.text = value!;
  //   emit(OnTextChangeEmail());
  // }

  // void updateTextPassword(String? value) {
  //   passwordController.text = value!;
  //   emit(OnTextChangePassword());
  // }

  // void updateTextConfirmPassword(String? value) {
  //   confirmPasswordController.text = value!;
  //   emit(OnTextChangeConfirmPassword());
  // }

  void updateTextFirstName(String? value) {
    firstNameController.value = TextEditingValue(
      text: value!,
      selection: TextSelection.collapsed(offset: value.length),
    );
    emit(OnTextChangeFirstName());
  }

  void updateTextLastName(String? value) {
    lastNameController.value = TextEditingValue(
      text: value!,
      selection: TextSelection.collapsed(offset: value.length),
    );
    emit(OnTextChangeLastName());
  }

  void updateTextPhoneNumber(String? value) {
    phoneNumberController.value = TextEditingValue(
      text: value!,
      selection: TextSelection.collapsed(offset: value.length),
    );
    emit(OnTextChangePhoneNumber());
  }

  void updateTextNationalId(String? value) {
    nationalIdController.value = TextEditingValue(
      text: value!,
      selection: TextSelection.collapsed(offset: value.length),
    );
    emit(OnTextChangeNationalId());
  }

  void updateTextEmail(String? value) {
    emailController.value = TextEditingValue(
      text: value!,
      selection: TextSelection.collapsed(offset: value.length),
    );
    emit(OnTextChangeEmail());
  }

  void updateTextPassword(String? value) {
    passwordController.value = TextEditingValue(
      text: value!,
      selection: TextSelection.collapsed(offset: value.length),
    );
    emit(OnTextChangePassword());
  }

  void updateTextConfirmPassword(String? value) {
    confirmPasswordController.value = TextEditingValue(
      text: value!,
      selection: TextSelection.collapsed(offset: value.length),
    );
    emit(OnTextChangeConfirmPassword());
  }

  String phone = '';

  //used for send email to reset password
  Future<dynamic> verifyPhoneSignup({
    required String phone,
  }) async {
    emit(VerifyPhoneSignupLoading());
    this.phone = phone;
    await DioHelper.postData(
            url: verifyPhoneSignupEndPoint,
            data: {'phone': phone, 'type': "FREELANCE", 'country': "countryId"})
        .then((value) {
      // forgetPasswordModel = ForgetPasswordModel.fromJson(value.data);

      debugPrint("=====================data");
      debugPrint(value.data);
      debugPrint(phone);
      emit(VerifyPhoneSignupSuccess());
    }).catchError((error) {
      if (error is DioError) {
        debugPrint(error.response?.data);
        showToast(message: error.response?.data["errors"]);
        //showToast(message: error.response!.data['message'].toString());
      }
      //onFail();
      emit(VerifyPhoneSignupError());
      throw error;
    });
  }

  //used for get verify otp
  Future<dynamic> verifyOTPSignup(
      {required String phone, required String code}) async {
    this.phone = phone;
    emit(VerifyOtpSignupLoading());
    debugPrint(phone);
    await DioHelper.putData(
      url: verifyOtpPhoneSignupEndPoint,
      data: {
        "phone": phone,
        "code": code,
        "country": "countryId",
        "type": "FREELANCE"
      },
    ).then((value) {
      // ForgetPasswordModel.fromJson(value.data);
      debugPrint("phone is ----");
      debugPrint(phone);
      emit(VerifyOtpSignupSuccess());
    }).catchError((error) {
      if (error is DioError) {
        debugPrint(error.response?.data);
        showToast(message: error.response?.data["errors"]);
        //showToast(message:  error.response?.data);
        // String meesage = DioExceptions.fromDioError(error).toString();
        // showToast(message: meesage);
      }

      emit(VerifyOtpSignupError());

      throw error;
    });
  }

  // SignupModel? signupModel;

  Map<String, dynamic> testJson = {
    "companyName": "Kareem",
    "firstName": "Ahmed",
    "lastName": "Helmy",
    "phone": "1556155978",
    "country": 3,
    "email": "Ka8eem@gmail.com",
    "city": 2,
    "nationality": 3,
    "password": "Admin@123",
    "type": "FREELANCE",
    "personalImage":
        "/uploads/product/5f3253e5-7f2d-4bc6-939a-f61270268a03.jpg",
    "commecrialImage":
        "/uploads/product/426cdfee-1016-42ce-9f08-7708d4d8087f.jpg",
    "commecrialEndDate": "2023-04-30 00:00:00.000",
    "frontIdImage": "/uploads/product/18970eec-8ddc-4235-9cb2-a1e0a2682edb.jpg",
    "backIdImage": "/uploads/product/d1121a4e-97bc-4e42-b4bf-cdd34a31312a.jpg",
    "idEndDate": "2023-04-29 00:00:00.000",
    "passportImage":
        "/uploads/product/444b80b7-564a-49b0-97c3-5b94d6d28446.jpg",
    "passportEndDate": "2023-04-28 01:00:00.000",
    "stay": "/uploads/product/9cc83e09-d830-4071-95b1-6f827ca8614e.jpg",
    "stayEndDate": "2023-04-27 00:00:00.000",
    "mainService": [11, 12, 13, 14, 15, 16, 17],
    "bankAccountUserName": "Kareem Ahmed Helmy",
    "bankAccount": "123123123123",
    "bankName": "QNB",
    "ibanAccount": "123123123123123123123",
  };

  String personalImage = '';
  String commecrialImage = '';
  String frontIdImage = '';
  String backIdImage = '';
  String passportImage = '';
  String stayImage = '';

  // API
  late String errorMessage;
  late SignupModel signupModel;
  Future<void >signUpData(
      {required String firstname,
      required String lastName,
      required String email,
      required String phoneNumber,
      required String nationalId,
      required String password,
      required String confirmPassword
      }) async {
    emit(SignupDataLoading());
    var data = {
      "first_name": firstname,
      'last_name': lastName,
      'nationalId': nationalId,
      'email': email,
      'password': password,
      'passwordConfirm': confirmPassword,
      'phone': phoneNumber
    };

    // Cache User Data.
    CacheHelper.put(key: 'first name', value: firstname);
    CacheHelper.put(key: 'last name', value: lastName);
    CacheHelper.put(key: 'email', value: email);
    CacheHelper.put(key: 'phone number', value: phoneNumber);
    CacheHelper.put(key: 'national ID', value: nationalId);
    userFirstName = await CacheHelper.get(key: 'first name');
    userLastName = await CacheHelper.get(key: 'last name');
    userEmail = await CacheHelper.get(key: 'email');
    userPhoneNumber = await CacheHelper.get(key: 'phone number');
    userNationalId = await CacheHelper.get(key: 'national ID');
    await DioHelper.postData(
      url: baseUrlAuth + signUp,
      data: data,
    ).then((value) async {
      signupModel = SignupModel.fromJson(value.data);
      // debugPrint(value.data.toString());
      accessToken = await value.data['data']['access_token'];
      debugPrint('accessToken --------> $accessToken');
      // debugPrint('success');
      emit(SignupDataSuccess(signupModel));
    }).catchError((error) {
      debugPrint(error.response.toString());
      errorMessage = error.response.data['message'].toString();
      emit(SignupDataError(error.toString()));
    });
  }









  String terms='';
  getTermsAndConditions() async {
    emit(GetTermsAndConditionsLoadingState());


    await DioHelper.getData(url: baseUrl + termsAndConditions)
        .then((value) {
      terms=value.data;
      emit(GetTermsAndConditionsSuccessState());

    }).catchError((error) {
      // debugPrint(error.toString());
      emit(GetTermsAndConditionsErrorState(error.toString()));
    });
    debugPrint('HELLO');
  }

  Future<dynamic> getTConsent() async {
    print("hi");
    await DioHelper.getData(url: baseUrl + consent)
        .then((value) => value)
    // ignore: invalid_return_type_for_catch_error
        .catchError((onError) => print(onError));
  }

  String termsAndConditionsHTML = '';
  String consentHTML='';

// Function to get Terms and Conditions data
  Future<void> getTermsAndConditionsData() async {
    emit(GetTermsDataLoading());
    try {
      final response = await DioHelper.getData(url: termsAndConditions);
      Map<String, dynamic> temp= response.data['data'] as Map<String, dynamic>;
      termsAndConditionsHTML = temp['html'] as String;
      emit(GetTermsDataSuccess());
      // debugPrint('SUCCESS');
    } catch (error) {
      // debugPrint(error.toString());
      emit(GetTermsDataError(error.toString()));
    }
  }

// Function to get Consent data
  Future<void> getConsentData() async {
    emit(GetConsentDataLoading());
    try {
      final response = await DioHelper.getData(url: consent);
      Map<String, dynamic> temp = response.data['data'] as Map<String, dynamic>;
      consentHTML = temp['html'] as String;

      emit(GetConsentDataSuccess());
      // debugPrint('SUCCESS');

    } catch (error) {
      debugPrint(error.toString());
      emit(GetConsentDataError(error.toString()));
    }
  }

  postTermsAndConditions(
      {required String content,}) async {
    emit(PostTermsDataLoading());
    var data = {
      "content": content,

    };

    var result = await DioHelper.postData(
      url:  termsAndConditions,
      data: data,
    ).then((value) {
      debugPrint(value.data.toString());
      debugPrint('success');
      emit(PostTermsDataSuccess());
    }).catchError((error) {
      // print("______________");
      // print(error);
      // debugPrint(error.response.toString());
      emit(PostTermsDataError(error.toString()));
    });
  }

  postConsent({
    required String content,
  }) async {
    emit(PostConsentDataLoading());
    var data = {
      "content": content,
    };

    var result = await DioHelper.postData(
      url: consent,
      data: data,
    ).then((value) {
      // debugPrint(value.data.toString());
      debugPrint('success');
      emit(PostConsentDataSuccess());
    }).catchError((error) {
      // print("______________");
      // print(error);
      // debugPrint(error.response.toString());
      emit(PostConsentDataError(error.toString()));
    });
  }
}

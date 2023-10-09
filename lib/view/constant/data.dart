// import '../model/data/user_data.dart';
//
// UserData? userData;
import 'package:flutter/cupertino.dart';
import 'package:flutter_pw_validator/Resource/Strings.dart';
import 'package:odc_offline/view_model/cubit/auth/login/login_cubit.dart';

// import '../../model/UserModel.dart';
import '../../model/auth/user_model.dart';

String? currentLangCode;

late UserModel user;
//Tokens
final loginCubit = LoginCubit();
String accessToken = loginCubit.loginModel.access_token??"";


//SharedPreferences Keys
const String accessTokenKey = "token";
//validations
String validationEmail =
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
String validationPassword =
    r'(?=[A-Za-z0-9@#$%^&+!=]+$)^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%^&+!=])(?=.{8,}).*$';
String validatePasswordUpperCase = r'[A-Z]';
String validatePasswordLowerCase = r'[a-z]';
String validatePasswordDigits = r'[0-9]';
String validatePasswordSpecialChar = r'[!@#$%^&*(),.?":{}|<>]';
String validationName = r'^[a-z A-Z]+$';
String validationPhone = r'(^(?:[+0]9)?[0-9]{10,12}$)';
String validateNationalId = r'^[1-2]\d{12}[0-9]$';
String validationLink = r'^(https?://)?(www\.)?[A-Za-z0-9]+\.[A-Za-z]{2,}(\S*)$';

// Routers
// todo: add new screens
const String onboardScreen = 'onboardScreen';


// Password valid Class
class PasswordValidPlugin extends FlutterPwValidatorStrings {
  @override
  final String atLeast = '8 Characters minimum';
  @override
  final String uppercaseLetters = 'One uppercase character';
  @override
  final String specialCharacters = 'One special character';
  @override
  final String lowercaseLetters = "One lowercase character";
}


// global keys
final formKey2 = GlobalKey<FormState>();




// User data Keys
//todo: user data keys ....
String firstNameKey = 'first name';
String lastNameKey = 'last name';
String emailKey = 'email';
String nationalIdKey = 'national ID';
String phoneNumberKey = 'phone number';
String governorateKey = 'governorate';
String countryKey = 'country';
String birthdateKey = 'birthdate';
String universityKey = 'university';
String facultyKey = 'faculty';
String majorKey = 'major';
String genderKey = 'gender';
String classStandingKey = 'class standing';
String statusOfGraduationKey = 'status of graduation';
String graduationYearKey = 'graduation year';
String insertedFieldKey = 'inserted field';
String linkedInKey = 'linkedin';
String gitHubKey = 'github';
String userDivisionsKey='division';

// User Data
String userFirstName = '';
String userLastName = '';
String userEmail = '';
String userNationalId = '';
String userPhoneNumber = '';
String userGovernorate = '';
String userCountry = '';
String userBirthdate = '';
String userUniversity = '';
String userFaculty = '';
String userMajor = '';
String userGender = '';
String userClassStanding = '';
String userStatusOfGraduation = '';
String userGraduationYear = '';
String userInsertedField = '';
String userLinkedIn = '';
String userGithub = '';
List<dynamic> userDivisions=[];



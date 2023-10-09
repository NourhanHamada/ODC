import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_password_state.dart';

class CreatePasswordCubit extends Cubit<CreatePasswordState> {
  CreatePasswordCubit() : super(CreatePasswordInitial());

  static CreatePasswordCubit get(context) => BlocProvider.of(context);


  var eightChar = false;
  var upperCase = false;
  var lowerCase = false;
  var specialChar = false;

  List<String> list = [
    '• 8 Character minimum',
    '• One uppercase character',
    '• One lowercase character',
    '• One special character',
  ];

  String? passwordValidate(String value) {
    if (value.trim().isEmpty) {
      return "Password must be not Empty";
    }
    else if (!value.trim().contains(RegExp(r'[A-Z]'))) {
      return "Password must Contains UpperCase Letter";
    }
    else if (!value.trim().contains(RegExp(r'[0-9]'))) {

      return "Password must Contains Digit";
    }
    else if (!value.trim().contains(RegExp(r'[a-z]'))) {
      return "Password must Contains LowerCase Letter";
    }
    else if (!value.trim().contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must Contains Special Character";
    }
    else if (value.trim().length < 8) {
      return "Password must be more 8 Letters";
    }
    else if (!RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$')
        .hasMatch(value.trim())) {
      return "Password is not Valid";
    }
    return null;
  }
}

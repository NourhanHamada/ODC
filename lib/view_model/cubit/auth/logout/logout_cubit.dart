import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_offline/view/constant/data.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import 'package:odc_offline/view/screens/authentication/login_screen.dart';
import 'package:odc_offline/view_model/database/local/cache_helper.dart';
import 'package:odc_offline/view_model/database/network/dio_helper.dart';
import 'package:odc_offline/view_model/database/network/end_points.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  LogoutState get(context) => BlocProvider.of(context);



  void performLogout(BuildContext context) async {
    try{
      emit(LogoutLoadingState());
     final response = await DioHelper.postData(
         url: baseUrlAuth+logout,
         token: accessToken,
     );
     if (response.statusCode == 200) {
       debugPrint('response.statusCode ------ ${response.statusCode}');
       // CacheHelper.clearData();
       CacheHelper.removeData(key: 'seen');
       context.push(const LoginScreen());
       debugPrint('SUCCESS');
       emit(LogoutSuccessfulState());
     } else {
       debugPrint('Logout Failed ${response.statusCode}');
     }
    } catch (error) {
      debugPrint('Error During logout: ---> $error');
      emit(LogoutFailState());
    }
  }
}

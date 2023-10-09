import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:odc_offline/view_model/database/local/cache_helper.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppTheme() {
    isDark = !isDark;
    emit(ChangeThemeState());
  }


  void cashAppTheme(bool value) async {
   await CacheHelper.put(key: 'theme', value: value);
    emit(CacheThemeDataState(value: value));
  }


  void loadThemeMode() async {
    isDark = CacheHelper.get(key: 'theme');
    emit(CacheThemeDataState(value: isDark));
  }
}

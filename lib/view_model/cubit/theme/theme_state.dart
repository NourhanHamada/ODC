part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ChangeThemeState extends ThemeState {}

class CacheThemeDataState extends ThemeState {
  bool value;

  CacheThemeDataState({required this.value});
}

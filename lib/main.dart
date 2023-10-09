import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/navigation_service.dart';
import 'package:odc_offline/view/constant/theme.dart';
import 'package:odc_offline/view/screens/splash_and_onboard/splash_screen.dart';
import 'package:odc_offline/view_model/cubit/auth/logout/logout_cubit.dart';
import 'package:odc_offline/view_model/cubit/course_enrollment/course_enrollment_cubit.dart';
import 'package:odc_offline/view_model/cubit/dashboard/dashborad_cubit.dart';
import 'package:odc_offline/view_model/cubit/forget_password/forget_password_cubit.dart';
import 'package:odc_offline/view_model/cubit/auth/login/login_cubit.dart';
import 'package:odc_offline/view_model/cubit/home/home_cubit.dart';
import 'package:odc_offline/view_model/cubit/layout/layout_cubit.dart';
import 'package:odc_offline/view_model/cubit/notifications/notifications_cubit.dart';
import 'package:odc_offline/view_model/cubit/onboard/onboard_cubit.dart';
import 'package:odc_offline/view_model/cubit/signup/signup_cubit.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';
import 'package:timezone/data/latest.dart' as time_zone;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_offline/view/constant/observer.dart';
import 'package:odc_offline/view_model/database/local/cache_helper.dart';
import 'package:odc_offline/view_model/database/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  // Intl.defaultLocale = 'ar_SA';
  Intl.defaultLocale = 'en_US';
  time_zone.initializeTimeZones();
  // final DioHelper dioHelper;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupCubit(),
        ),
        BlocProvider(
          create: (context) => OnboardCubit(context)..getOnboardData(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit()..loadThemeMode(),
        ),
        BlocProvider(
          create: (context) => LoginCubit()..loadRememberMe(),
        ),
        BlocProvider(
          create: (context) => ForgetPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (context) => CourseEnrollmentCubit()
            ..getGovernorates()
            ..getUniversities()
            ..getMajors()
            ..getFaculties()
            ..getCountries(),
        ),
        BlocProvider(
          create: (context) => NotificationsCubit(),
        ),
        BlocProvider(
          create: (context) => LogoutCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()
            ..getDivisionsData()
            ..getAllCoursesData()
            ..getUserCoursesData(),
        ),
        BlocProvider(
          create: (context) => DashboardCubit(),
        ),
      ],
      child: EasyLocalization(
        path: "resources/langs",
        supportedLocales: const [
          Locale('en', 'EN'),
          Locale('ar', 'AR'),
        ],
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ThemeCubit.get(context).isDark
            ? darkBackground
            : grey100, // Set your desired color here
      ),
    );

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          // locale: context.locale,
          navigatorKey: NavigationService.instance.navigationKey,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
          },
          debugShowCheckedModeBanner: false,
          theme: buildLightMode(context),
          darkTheme: buildDarkMode(context),
          themeMode:
              ThemeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          // home: OnboardScreen(),
        );
      },
    );
  }
}

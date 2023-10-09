import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_manager.dart';

buildLightMode(context) {
  return ThemeData(
    primaryColor: mainColor,
    // colorScheme: const ColorScheme.light(
    //   primary: mainColor,
    //   onPrimary: white,
    //   onSurface: black,
    // ),
    scaffoldBackgroundColor: white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: GoogleFonts.poppins(
        color: black,
      ),
      iconTheme: const IconThemeData(color: black),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: white,
      elevation: 0,
    ),
    textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme)
        .apply()
        .copyWith(
          bodySmall: const TextStyle(
            color: darkBackground,
            fontSize: 14,
          ),
        ),
  );
}

buildDarkMode(context) {
  return ThemeData(
    scaffoldBackgroundColor: black,
    appBarTheme: AppBarTheme(
      backgroundColor: darkBackground,
      elevation: 0,
      titleTextStyle: GoogleFonts.poppins(
        color: white,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: darkBackground,
      elevation: 0,
    ),
    textTheme: GoogleFonts.cairoTextTheme(Theme.of(context).textTheme)
        .apply()
        .copyWith(
          bodySmall: const TextStyle(
            color: white,
            fontSize: 14,
          ).apply(),
        ),
  );
}

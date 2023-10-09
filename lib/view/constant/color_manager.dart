import 'package:flutter/material.dart';

// Core Colors.
const Color white = Color(0xffffffff);
const Color black = Color(0xff000000);
const Color mainColor = Color(0xffff7900);

// Functional Colors.
const Color green = Color(0xff32c832);
const Color blue = Color(0xff527edb);
const Color yellow = Color(0xffFFCC00);
const Color red = Color(0xffcd3c14);

// Supporting Colors.
const Color lightBlue = Color(0xff4bb4e6);
const Color lightYellow = Color(0xffffd200);
const Color lightGreen = Color(0xff50be87);
const Color lightPurple = Color(0xffa885d8);
const Color lightPink = Color(0xffffb4e6);
const Color lightOrange = Color(0xfffeebda);
// Greys
const Color grey100 = Color(0xfffafafa);
const Color grey200 = Color(0xfff6f6f6);
const Color grey300 = Color(0xffeeeeee);
const Color grey400 = Color(0xffdddddd);
const Color grey500 = Color(0xffcccccc);
const Color grey600 = Color(0xff999999);
const Color grey700 = Color(0xff666666);
const Color grey800 = Color(0xff595959);
const Color grey900 = Color(0xff333333);


// Filter
Color greyFilter = const Color(0xffeeeeee).withOpacity(.4);

// Dark Mood
const Color darkBackground =Color(0xff1A1A1A);
 Color darkShadow = const Color(0xff1B1816);
Color darkButton = const Color(0xff1F1E22);

const Color orangeRed = Color(0xffCD3C14);

// =========================================================
//Text Color
const Color textColorMain = Color(0xff8F8F8F);
const Color textColorParagraph = Color(0xff3A3A3A);
const Color textColorFormField = Color(0xff999999);
const Color textColorLight = Color(0xffF1F1F2);

// //App colors
// const Color mainColor = Color(0xffFF6600);
const Color sliderColor = Color(0xffFEEBDA);
const Color shadowColor = Color.fromARGB(55, 255, 102, 0);
const Color backgroundColor = Color(0xff141316);
const Color blackColor = Colors.black;
const Color whiteColor = Colors.white;
const Color grey = Color(0xffF1F1F1);
// const Color primaryColor = Color(0xff182061);
const Color greenColor = Color(0xff28af31);
const Color greenColor2 = Color(0xff32C832);
const Color darkBlueColor = Color(0xff303B7D);
const Color lightBlueColor = Color(0xff34418A);
const Color toastColor = Color(0xff1F1E22);
const Color transparent = Colors.transparent;
const Color borderColor = Color(0xff9B9FBB);
const Color redColor = Colors.red;
const Color borderColorTwo = Color(0x21ffffff);
const Color borderColor3 = Color(0xffD8D8D8);
const Color borderColor4 = Color(0xffCCCDD9);
const Color borderColor5 = Color(0xff84869D);
const Color greyTextColor = Color(0xffE0E1EA);
const Color greyText2Color = Color(0xff9EA1BC);
const Color yellowColor = Color(0xffFFCA34);
const Color greyColor = Color(0xff36393B);
const Color backGroundColorWhite = Color(0xffF3F4F6);
const Color iconColorGrey = Colors.grey;
const Color simonColor = Color(0xffFFE19B);
const Color aquaColor = Color(0xff69D7C4);
const Color buttonColor = Color(0xff1F1F20);

//utils
const Color grayDot = Color(0xffB7B7B7);
// const Color cardColor = Color(0xffFBFBFB);
const Color background = Color(0xffCAF6EF);
const Color hintColor = Color(0xffD0D0D0);
const Color blackArrowBack = Color(0xff1B1816);
const Color textFieldBackGround = Color(0xffEDEDED);
const Color fillGrey = Color(0xffE9E9E9);
Color cardColor = const Color(0xff494949).withOpacity(.2);

// MaterialColor
const MaterialColor primaryColor = MaterialColor(0xffFF6600, {
  50: Color.fromARGB(30, 255, 102, 0),
  100: Color.fromARGB(55, 255, 102, 0),
  200: Color.fromARGB(80, 255, 102, 0),
  300: Color.fromARGB(105, 255, 102, 0),
  400: Color.fromARGB(130, 255, 102, 0),
  500: Color.fromARGB(155, 255, 102, 0),
  600: Color.fromARGB(180, 255, 102, 0),
  700: Color.fromARGB(205, 255, 102, 0),
  800: Color.fromARGB(230, 255, 102, 0),
  900: Color.fromARGB(255, 255, 102, 0),
});

//color_Gradient
const mainGradient = LinearGradient(colors: [
  Color(0xff69D7C4),
  Color(0xff36A693),
], begin: Alignment.bottomLeft, end: Alignment.topRight);
const subGradient = LinearGradient(
  colors: [
    Color(0xff1E3A64),
    Color(0xff5ADDFF),
  ],
);

LinearGradient strokeCardColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    const Color(0xff333333),
    const Color(0xff333333).withOpacity(0)
  ], // Gradient from https://learnui.design/tools/gradient-generator.html
);

final Shader textLinearGradient = const LinearGradient(
  colors: <Color>[Color(0xff000000), Color(0xff000000)],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

final Shader orangeTextLinearGradient = const LinearGradient(
  colors: <Color>[Color.fromARGB(80, 255, 102, 0), Color(0xffFF6600)],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/color_manager.dart';
import '../../../constant/fonts.dart';
import 'custom_border.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String hint;
  Widget? suffixIcon;
  String? Function(String?)? validation;
  FocusNode? focusNode;
  FocusNode? nextTextField;
  Color fillColor;
  Color hintColor;
  int maxLines;
  double fontSize;
  TextInputType textInputType;
  Widget? widget;
  bool? isUnderlineBorder;
  bool? isDense;
  Color? textColor;
  List<TextInputFormatter>? inputFormatters;
  final textAlign;
  void Function(String) onCahnge;

  CustomTextField({
    Key? key,
    this.controller,
    required this.hint,
    this.fillColor = toastColor,
    this.hintColor = borderColor,
    this.suffixIcon,
    required this.validation,
    this.focusNode,
    this.nextTextField,
    this.maxLines = 1,
    this.fontSize = textFont18,
    this.textInputType = TextInputType.text,
    this.isUnderlineBorder = true,
    this.isDense = false,
    this.textColor = yellowColor,
    this.inputFormatters,
    this.textAlign,
    required this.onCahnge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(0, -10.0, 0),
      child: TextFormField(
        // autofocus: true,
        onChanged: onCahnge,
        onSaved: (val){

        },
        onFieldSubmitted: (value) {
          if (nextTextField != null) {
            FocusScope.of(context).requestFocus(nextTextField);
          } else if (focusNode != null) {
            focusNode!.unfocus();
          }
        },
        validator: validation,
        maxLines: maxLines,
        textAlign: textAlign,
        focusNode: focusNode,
        cursorColor: mainColor,
        controller: controller,
        keyboardType: textInputType,
        style: const TextStyle(color: mainColor, fontSize: 20),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 25,),
          //isDense: true,
          alignLabelWithHint: true,
          filled: true,
          fillColor: fillColor,
          suffixIcon: suffixIcon,
          // enabledBorder: customBorder(borderColor),
          focusedBorder: customBorder(borderColor),
          errorBorder: customBorder(redColor),
          focusedErrorBorder: customBorder(redColor),
          hintText: hint.tr().toString(),
          hintStyle: GoogleFonts.poppins(
              color: hintColor,
              fontWeight: FontWeight.w500,
              fontSize: fontSize.sp),
        ),
      ),
    );
  }
}





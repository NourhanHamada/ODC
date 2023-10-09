// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../constant/color_manager.dart';
//
// // ignore: must_be_immutable
// class TextFormFieldsCustom extends StatefulWidget {
//   final String? hintText;
//   final int? maxLines;
//   final String? Function(String?)? validator;
//   final Function(String?)? onSaved;
//   bool? isPassword;
//   final TextInputType? keyboardType;
//   final String? helperText;
//   final String initialValue;
//   final Function()? onEditingComplete;
//   final TextInputAction? textInputAction;
//   final TextEditingController? controller;
//   final bool? suffix;
//   final bool? suffixToggle;
//   final Widget? suffixIcon;
//   final Color? suffixIconColor;
//   final IconData? suffixIconToggle;
//   final Color? suffixIconColorToggle;
//   final Function()? suffixOnPressed;
//   final FocusNode? focus;
//   final Function(String?)? onChanged;
//   final bool? enableInteractive;
//   final Widget? prefixIcon;
//
//   TextFormFieldsCustom(
//       {Key? key,
//       this.hintText,
//       this.validator,
//       this.onSaved,
//       this.maxLines = 1,
//       this.keyboardType,
//       this.helperText,
//       this.isPassword = false,
//       this.initialValue = "",
//       this.onEditingComplete,
//       this.textInputAction,
//       this.controller,
//       this.suffix = false,
//       this.suffixToggle = false,
//       this.suffixIcon,
//       this.suffixIconColor = hintColor,
//       this.suffixIconToggle,
//       this.suffixIconColorToggle = hintColor,
//       this.suffixOnPressed,
//       this.focus,
//       this.onChanged,
//       this.enableInteractive = true,
//       this.prefixIcon})
//       : super(key: key);
//
//   @override
//   State<TextFormFieldsCustom> createState() => _TextFormFieldsCustomState();
// }
//
// class _TextFormFieldsCustomState extends State<TextFormFieldsCustom> {
//   //const TextFormFieldsCustom({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       enableInteractiveSelection: widget.enableInteractive,
//       controller: widget.controller,
//       focusNode: widget.focus,
//       maxLines: widget.maxLines,
//       textInputAction: widget.textInputAction ?? TextInputAction.done,
//       onEditingComplete: widget.onEditingComplete,
//       onChanged: (value) {
//         //onChanged!(value);
//         widget.onChanged != null ? widget.onChanged!(value) : null;
//       },
//       style: const TextStyle(
//         color: white
//       ),
//       decoration: InputDecoration(
//         fillColor: toastColor,
//         filled: true,
//         isDense: true,
//         hintText: widget.hintText,
//         helperText: widget.helperText,
//         suffixIcon: widget.suffixIcon,
//         prefixIcon: widget.prefixIcon,
//         floatingLabelBehavior: FloatingLabelBehavior.auto,
//         hintStyle: TextStyle(
//           fontSize: 14.sp,
//           color: greyText,
//         ),
//         // enabledBorder: const OutlineInputBorder(
//         //   borderSide: BorderSide(
//         //     color: fillGrey,
//         //   ),
//         // ),
//         contentPadding: EdgeInsets.symmetric(
//           vertical: 16.sp,
//           horizontal: 18.sp,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10)
//         ),
//         focusedBorder:  OutlineInputBorder(
//           borderSide: const BorderSide(
//             color: toastColor,
//           ),
//           borderRadius: BorderRadius.circular(10)
//         ),
//         errorBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.red,
//           ),
//         ),
//         focusedErrorBorder: const OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.red,
//           ),
//         ),
//       ),
//       obscureText: widget.isPassword!,
//       validator: widget.validator,
//       onSaved: (value) {
//         widget.onSaved != null ? widget.onSaved!(value) : null;
//       },
//       keyboardType: widget.keyboardType,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

import '../../../constant/color_manager.dart';

// ignore: must_be_immutable
class TextFormFieldsCustom extends StatefulWidget {
  final int? errorMaxLines;
  final String? hintText;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  bool? isPassword;
  final TextInputType? keyboardType;
  final String? helperText;
  final String initialValue;
  final Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? suffix;
  final bool? suffixToggle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? suffixIconColor;
  final IconData? suffixIconToggle;
  final Color? suffixIconColorToggle;
  final Function()? suffixOnPressed;
  final Function()? onTap;
  final FocusNode? focus;
  final Function(String?)? onChanged;
  final bool? readOnly;
  final bool? enabled;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatter;

  TextFormFieldsCustom({
    Key? key,
    this.prefixIcon,
    this.hintText,
    this.validator,
    this.onSaved,
    this.keyboardType,
    this.helperText,
    this.isPassword = false,
    this.initialValue = "",
    this.onEditingComplete,
    this.textInputAction,
    this.controller,
    this.suffix = false,
    this.suffixToggle = false,
    this.suffixIcon,
    this.suffixIconColor = hintColor,
    this.suffixIconToggle,
    this.suffixIconColorToggle = hintColor,
    this.suffixOnPressed,
    this.focus,
    this.onChanged,
    // required bool enableInteractive,
    this.errorMaxLines,
    this.readOnly,
    this.enabled,
    this.inputFormatter,
    this.onTap,
    this.maxLength
  }) : super(key: key);

  @override
  State<TextFormFieldsCustom> createState() => _TextFormFieldsCustomState();
}

class _TextFormFieldsCustomState extends State<TextFormFieldsCustom> {
  // const TextFormFieldsCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      // maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatter,
      // autofocus: false,
      readOnly: widget.readOnly ?? false,
      enabled: widget.enabled ?? true,
      // enableInteractiveSelection: false,
      controller: widget.controller,
      // focusNode: widget.focus,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      // prevent text from being automatically selected
      // onEditingComplete: widget.onEditingComplete,
      onChanged: (value) {
        // widget.onChanged!(value);
        widget.onChanged != null ? widget.onChanged!(value) : null;
      },
      style: TextStyle(color: ThemeCubit.get(context).isDark ? white : darkBackground),
      cursorColor: mainColor,
      // cursorHeight: 20,
      cursorWidth: 1.5,
      decoration: InputDecoration(
        errorMaxLines: widget.errorMaxLines,
        fillColor: ThemeCubit.get(context).isDark ? toastColor : grey200,
        filled: true,
        isDense: true,
        hintText: widget.hintText,
        helperText: widget.helperText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        errorStyle: const TextStyle(
            color: orangeRed, fontSize: 12, fontWeight: FontWeight.w500),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle: const TextStyle(
          fontSize: 15,
          color: grey600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                // color: Colors.red,
                color: Colors.transparent),
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                // color: Colors.red,
                color: Colors.transparent),
            borderRadius: BorderRadius.circular(10)),
      ),
      obscureText: widget.isPassword!,
      obscuringCharacter: '*',
      validator: widget.validator,
      onSaved: (value) {
        // widget.onSaved != null ? widget.onSaved!(value) : null;
      },
      keyboardType: widget.keyboardType,
    );
  }
}


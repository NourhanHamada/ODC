import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:odc_offline/view/constant/extensions.dart';
import '../../view_model/cubit/signup/signup_cubit.dart';
import '../../view_model/cubit/theme/theme_cubit.dart';
import '../constant/color_manager.dart';


class PopupTermsDialog extends StatelessWidget {
  String htmlContent;
  PopupTermsDialog({super.key,required this.htmlContent});

  List<String> texts = [
    'المعلومات التي تتحصل عليها الشركة: هي كل المعلومات التي من شأنها تعريف الشركة و/أو الجهه المعينة من قبل الشركة بالتعرف علي بياناتي بشكل جيد وفقاً للغرض من الاستخدام، وتشمل تلك المعلومات: أ)بيانات التواصل (الاسم ، البريد الالكتروني، رقم التليفون المحمول) ،ب) المستوي التعليمي (غير خريج/خريج "الجامعة/الكلية") ،ج) الدورات التدريبة التي تم الحصول عليها ، د) السيرة الذاتية.',
    'الغرض من الاستخدام: يكمن الغرض من الاستخدام من قبل الشركة أو اي من الاطراف المعينين من قبلها في اي مجال من المجالات الاتية: 1) امكانية توفير دعاوي لحضور ندوات، اجتماعات ، مناسبات عمل ، 2) معارض التوظيف ، 3) استطلاعات الاستقصاء.',
    'الاطراف الاخري/الجهات المعينة من قبل الشركة: هم اي طرف قد تقوم اورنج بمشاركة المعلومات التي تحصلت عليها بحدود اغراض الاستخدام المصرح بهم بموجب هذا الاقرار.',
    ' نطاق الاقرار: يسري هذا الاقرار بداية من تاريخ تحريره ولا يجوز إلغاءه أو الرجوع فيه من جانبي إلا بالحصول علي الموافقة الكتابية الخاصة بشركة اورنج مصر للاتصالات.',
    ' حدود المسئولية: بموجب هذا الاقرار وبحدود ما يتم اقراره قانوناً ، لن تكون اورنج مسئولة بكل الاحوال ولن تتحمل "اورنچ" مسئولية وقوع أية خسارة أو ضرر من أي نوع كان، بما في ذلك ــ على سبيل المثال لا الحصر ــ الخَسارة غير المباشرة أو اللاحقة، أو الإصابة الشخصية التي تحدث للمقر، باستثناء أية مسئولية يتعذر استبعادها وفقًا القانون.',
    ' أي بند لا يمتثل لبنود هذا الاقرار لا يُطبق، ويُعتبر كأنه لم يكن.',
    ' القانون الحاكم وتسوية النزاعات: تخضع المعلومات وطريقه مشاركتها وشروطها للقانون المصري وأي نزاعات يخضع للولاية القضائية للمحاكم المصرية.',
  ];

  @override
  Widget build(BuildContext context) {
    SignupCubit signupCubit =
        BlocProvider.of<SignupCubit>(context, listen: true);
    return AlertDialog(
        scrollable: true,
        backgroundColor:
            ThemeCubit.get(context).isDark ? darkBackground : white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        content: SingleChildScrollView(
          child: SizedBox(
            width: context.screenWidth - 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
               HtmlWidget(htmlContent),

                // Text(
                //   'إقرار قبول بإستخدام البيانات: \nاقر بقبولي بإستخدام بياناتي وفقاً للشروط المذكورة بهذا الاقرار كما اقر بتصريحي الكامل للشركة "اورنج مصر للاتصالات" واي طرف من الغير تفوضه بإستخدام تلك البيانات وذلك وفقاً لاغراض الاستخدام المعينة بهذا الاقرار.',
                //   textDirection: TextDirection.rtl,
                //   style: GoogleFonts.poppins(
                //     color: ThemeCubit.get(context).isDark ? white : grey900,
                //     fontSize: textFont14.sp,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
                // Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 5),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 4,
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Flexible(
                //             child: SizedBox(
                //               width: 234.h,
                //               child: Text(
                //                 texts[0],
                //                 textDirection: TextDirection.rtl,
                //                 style: GoogleFonts.poppins(
                //                   color: ThemeCubit.get(context).isDark
                //                       ? white
                //                       : grey900,
                //                   fontSize: textFont14.sp,
                //                   fontWeight: FontWeight.w400,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 8,
                //           ),
                //           Text(
                //             '•',
                //             textDirection: TextDirection.rtl,
                //             style: GoogleFonts.poppins(
                //               color: ThemeCubit.get(context).isDark
                //                   ? white
                //                   : grey900,
                //               fontSize: 16,
                //               fontWeight: FontWeight.w400,
                //             ),
                //           ),
                //         ],
                //       ),
                //     )),
                // Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 5),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 4,
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Flexible(
                //             child: SizedBox(
                //               width: 234.h,
                //               child: Text(
                //                 texts[1],
                //                 textDirection: TextDirection.rtl,
                //                 style: GoogleFonts.poppins(
                //                   color: ThemeCubit.get(context).isDark
                //                       ? white
                //                       : grey900,
                //                   fontSize: textFont14.sp,
                //                   fontWeight: FontWeight.w400,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 8,
                //           ),
                //           Text(
                //             '•',
                //             textDirection: TextDirection.rtl,
                //             style: GoogleFonts.poppins(
                //               color: ThemeCubit.get(context).isDark
                //                   ? white
                //                   : grey900,
                //               fontSize: 16,
                //               fontWeight: FontWeight.w400,
                //             ),
                //           ),
                //         ],
                //       ),
                //     )),
                // Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 5),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 4,
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Flexible(
                //             child: SizedBox(
                //               width: 234.h,
                //               child: Text(
                //                 texts[2],
                //                 textDirection: TextDirection.rtl,
                //                 style: GoogleFonts.poppins(
                //                   color: ThemeCubit.get(context).isDark
                //                       ? white
                //                       : grey900,
                //                   fontSize: textFont14.sp,
                //                   fontWeight: FontWeight.w400,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 8,
                //           ),
                //           Text(
                //             '•',
                //             textDirection: TextDirection.rtl,
                //             style: GoogleFonts.poppins(
                //               color: ThemeCubit.get(context).isDark
                //                   ? white
                //                   : grey900,
                //               fontSize: 16,
                //               fontWeight: FontWeight.w400,
                //             ),
                //           ),
                //         ],
                //       ),
                //     )),
                // Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 5),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 4,
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Flexible(
                //             child: SizedBox(
                //               width: 234.h,
                //               child: Text(
                //                 texts[3],
                //                 textDirection: TextDirection.rtl,
                //                 style: GoogleFonts.poppins(
                //                   color: ThemeCubit.get(context).isDark
                //                       ? white
                //                       : grey900,
                //                   fontSize: textFont14.sp,
                //                   fontWeight: FontWeight.w400,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 8,
                //           ),
                //           Text(
                //             '•',
                //             textDirection: TextDirection.rtl,
                //             style: GoogleFonts.poppins(
                //               color: ThemeCubit.get(context).isDark
                //                   ? white
                //                   : grey900,
                //               fontSize: 16,
                //               fontWeight: FontWeight.w400,
                //             ),
                //           ),
                //         ],
                //       ),
                //     )),
                // Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 5),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 4,
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Flexible(
                //             child: SizedBox(
                //               width: 234.h,
                //               child: Text(
                //                 texts[4],
                //                 textDirection: TextDirection.rtl,
                //                 style: GoogleFonts.poppins(
                //                   color: ThemeCubit.get(context).isDark
                //                       ? white
                //                       : grey900,
                //                   fontSize: textFont14.sp,
                //                   fontWeight: FontWeight.w400,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 8,
                //           ),
                //           Text(
                //             '•',
                //             textDirection: TextDirection.rtl,
                //             style: GoogleFonts.poppins(
                //               color: ThemeCubit.get(context).isDark
                //                   ? white
                //                   : grey900,
                //               fontSize: 16,
                //               fontWeight: FontWeight.w400,
                //             ),
                //           ),
                //         ],
                //       ),
                //     )),
                // Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 5),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 4,
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Flexible(
                //             child: SizedBox(
                //               width: 234.h,
                //               child: Text(
                //                 texts[5],
                //                 textDirection: TextDirection.rtl,
                //                 style: GoogleFonts.poppins(
                //                   color: ThemeCubit.get(context).isDark
                //                       ? white
                //                       : grey900,
                //                   fontSize: textFont14.sp,
                //                   fontWeight: FontWeight.w400,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 8,
                //           ),
                //           Text(
                //             '•',
                //             textDirection: TextDirection.rtl,
                //             style: GoogleFonts.poppins(
                //               color: ThemeCubit.get(context).isDark
                //                   ? white
                //                   : grey900,
                //               fontSize: 16,
                //               fontWeight: FontWeight.w400,
                //             ),
                //           ),
                //         ],
                //       ),
                //     )),
                // Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 5),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 4,
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Flexible(
                //             child: SizedBox(
                //               width: 234.h,
                //               child: Text(
                //                 texts[6],
                //                 textDirection: TextDirection.rtl,
                //                 style: GoogleFonts.poppins(
                //                   color: ThemeCubit.get(context).isDark
                //                       ? white
                //                       : grey900,
                //                   fontSize: textFont14.sp,
                //                   fontWeight: FontWeight.w400,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 8,
                //           ),
                //           Text(
                //             '•',
                //             textDirection: TextDirection.rtl,
                //             style: GoogleFonts.poppins(
                //               color: ThemeCubit.get(context).isDark
                //                   ? white
                //                   : grey900,
                //               fontSize: 16,
                //               fontWeight: FontWeight.w400,
                //             ),
                //           ),
                //         ],
                //       ),
                //     )),

                // SizedBox(
                //   height: 8.h,
                // ),
                // MainButton(
                //   title: 'Agree',
                //   onTap: () {
                //     signupCubit.changeIsAgreeTerms();
                //     context.pop();
                //   },
                // ),
              ],
            ),
          ),
        ));
  }
}


// todo: handle terms and conditions and concerts from Apis.
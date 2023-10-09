import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:odc_offline/view/components/core/custom_menu_button.dart';
import 'package:odc_offline/view/components/core/custom_notification_element.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/components/core/scaffold_custom/scaffold_custom.dart';
import 'package:odc_offline/view/constant/assets.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/fonts.dart';
import 'package:odc_offline/view_model/cubit/theme/theme_cubit.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    width: 8.w,
                    height: 16.h,
                    backIcon,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 8.w),
                CustomText(
                  text: "Notification",
                  color: mainColor,
                  fontWeight: FontWeight.w600,
                  fontSize: textFont16.sp,
                ),
                const Spacer(),
                CustomPopupMenuWidget(),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: notificationsList.length,
              itemBuilder: (context, index) {
                return notificationsList[index];
              },
            ),
          ],
        ),
      ),
    );
  }
}

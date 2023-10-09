import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc_offline/view/components/core/buttons/main_button.dart';
import 'package:odc_offline/view/components/core/custom_appbar.dart';
import 'package:odc_offline/view/components/core/scaffold_custom/scaffold_custom.dart';
import 'package:odc_offline/view/constant/color_manager.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'TEST',
      ),
      body: Column(
        children: [
          MainButton(
              title: 'Press Me',
              onTap: () {
                Fluttertoast.showToast(
                  msg: 'Hi I\'m a Toast',
                  fontSize: 20,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: grey600
                );
              })
        ],
      ),
    );
  }
}

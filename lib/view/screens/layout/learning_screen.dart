import 'package:flutter/material.dart';

import '../../components/core/custom_text.dart';
import '../../components/core/scaffold_custom/scaffold_custom.dart';
import '../../constant/color_manager.dart';

class LearningScreen extends StatelessWidget {
  const LearningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      body: Center(
        child: CustomText(
          text: 'Learning Screen',
          color: mainColor,
        ),
      ),
    );
  }
}

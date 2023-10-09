import 'package:flutter/material.dart';
import 'package:odc_offline/view/components/core/custom_text.dart';
import 'package:odc_offline/view/constant/color_manager.dart';
import 'package:odc_offline/view/constant/fonts.dart';

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  TimerState createState() => TimerState();
}

class TimerState extends State<Timer> with TickerProviderStateMixin {
  late AnimationController _controller;
  int levelClock = 120;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
                levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
        );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Countdown(
      animation: StepTween(
        begin: levelClock,
        end: 0,
      ).animate(_controller),
      listenable: _controller,
    );
  }
}

// ignore: must_be_immutable
class Countdown extends AnimatedWidget {
  Countdown({super.key, required this.animation, required super.listenable});
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return CustomText(
      text: timerText,
      color: mainColor,
      fontSize: textFont16,
      fontWeight: FontWeight.w600,
    );
  }
}

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/alert_dialog/views/alert_dialog.dart';

class DialogController extends GetxController {
  late AnimationController controller;
  late Animation<Offset> animation;

  var count = 10.obs;

  late Duration duration;
  late Timer timer;
  String strDigits(int n) => n.toString().padLeft(2, '0');

  animateDialog(TickerProvider ticker) {
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: ticker,
    )..forward();

    animation = Tween<Offset>(
      begin: const Offset(-2.0, -1.0),
      end: const Offset(1.2, -1.0),
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.linear,
    ));
  }

  teacherNotAvailableDialog(
      {required String teacherName, required BuildContext context}) {
    return customAlertDialog(
        color: const Color.fromRGBO(244, 67, 54, 1),
        text: '$teacherName is not available',
        context: context);
  }

  deafultTeacherDialog(
      {required String teacherName, required BuildContext context}) {
    return customAlertDialog(
        color: const Color.fromRGBO(33, 150, 243, 1),
        text: 'Topic start with $teacherName',
        context: context);
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  timerUpdate() {
    // count = 10;
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (count.value <= 0) {
          timer.cancel();
          update();
          print("cancel");
          count.value = 10;
        } else {
          count.value--;
          print(count.value);
          update();
        }
      },
    );
  }

  // teacherNotAvailableDialog(
  //     {required String teacherName, required TickerProvider ticker}) {
  //   animateDialog(ticker);
  //   update();
  //   return SlideTransition(
  //       textDirection: TextDirection.ltr,
  //       position: animation,
  //       child: customAlertDialog(
  //           color: const Color.fromRGBO(244, 67, 54, 1),
  //           text: '$teacherName is not available'));
  // }

  // deafultTeacherDialog({required String teacherName, required TickerProvider ticker}) {
  //       animateDialog(ticker);
  //   return customAlertDialog(
  //       color: const Color.fromRGBO(33, 150, 243, 1),
  //       text: 'Topic start with $teacherName');
  // }
}

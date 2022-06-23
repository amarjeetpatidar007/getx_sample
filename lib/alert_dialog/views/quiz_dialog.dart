import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

quizAlertDialog(
    {required BuildContext context, required int count, required Timer timer}) {
  Color quizAlertColor = const Color.fromRGBO(33, 150, 243, 1);
  return Get.snackbar(
    '',
    '',
    maxWidth: MediaQuery.of(context).size.width,
    snackStyle: SnackStyle.FLOATING,
    isDismissible: true,
    instantInit: true,
    duration: const Duration(seconds: 10),
    dismissDirection: DismissDirection.horizontal,
    snackPosition: SnackPosition.TOP,
    forwardAnimationCurve: Curves.easeInCubic,
    reverseAnimationCurve: Curves.easeOutCubic,
    barBlur: 0.0,
    titleText: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 50,
          width: 320,
          // padding: const EdgeInsets.fromLTRB(6.0, 16.0, 6.0, 16.0),
          padding: const EdgeInsets.only(left: 6.0, right: 6.0),
          decoration: const BoxDecoration(
              color: Color.fromRGBO(243, 241, 248, 0.9),
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
             Padding(
              padding: const EdgeInsets.only(left: 16, right: 12),
              // padding: EdgeInsets.fromLTRB(16, 7, 12, 7),

              child: Icon(
                Icons.error_outline,
                size: 15.0,
                color: quizAlertColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              // padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Obx(() => Text(
                    "Quiz starts in $count seconds",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: quizAlertColor),
                  )),
            ),
            IconButton(
              onPressed: () {
                timer.cancel();
                Get.closeCurrentSnackbar();
                count = 10;
              },
              icon: Icon(
                Icons.close,
                size: 12,
                color: quizAlertColor,
              ),
              // padding: const EdgeInsets.fromLTRB(40, 11, 12, 11),
              padding: const EdgeInsets.only(left: 40, right: 12),
            )
          ]),
        ),
      ],
    ),
  );
}

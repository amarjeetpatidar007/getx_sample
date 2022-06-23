import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

customAlertDialog(
    {required Color color,
    required String text,
    required BuildContext context}) {
  return Get.snackbar(
    '',
    '',
    maxWidth: MediaQuery.of(context).size.width,
    snackStyle: SnackStyle.FLOATING,
    isDismissible: true,
    instantInit: true,
    duration: const Duration(seconds: 2),
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
          padding: const EdgeInsets.only(left: 6.0, right: 6.0),
          // padding: const EdgeInsets.fromLTRB(6.0, 16.0, 6.0, 16.0),
          decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.9),
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 12),
              // padding: const EdgeInsets.fromLTRB(16, 7, 12, 7),

              child: Icon(
                Icons.error_outline,
                size: 18.0,
                color: color,
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              // padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                text,
                style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 14, color: color),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.close,
                size: 12,
                color: color,
              ),
              padding: const EdgeInsets.fromLTRB(40, 11, 12, 11),
            )
          ]),
        ),
      ],
    ),
  );
}

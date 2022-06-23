import 'package:flutter/material.dart';

import '../../theme.dart';

Widget joinedChatChip({required String userName}) {
  return Chip(
      backgroundColor: Colors.white,
      label: Text(
        "$userName joined",
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 8.0,
        ),
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 12.0));
}

// Widget emojiButton({required IconData icon}){
//   return OutlinedButton(
//     onPressed: () {},
//     style: ButtonStyle(
//       shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(300),
//       )),
//     ),
//     child: Icon(icon, color: Colors.green),
//   );
// }

Widget emojiButton({required String emoji, required Function() onPressed}) {
  return InkWell(
    borderRadius: BorderRadius.circular(15),
    onTap: onPressed,
    child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: const Color.fromRGBO(222, 213, 241, 1)),
          // color: Themes.bgColor
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(emoji, style: const TextStyle(fontSize: 12)),
        )),
  );
}

Widget userMessage({required String userName, required String message}) {
  return Padding(
      padding: const EdgeInsets.only(left: 12, right: 20),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "$userName : ",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10.0,
                color: Colors.black,
              )),
          TextSpan(
              text: message,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 9.0,
                  fontWeight: FontWeight.w400)),
        ]),
      ));
}

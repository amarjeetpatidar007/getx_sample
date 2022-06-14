
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static Color bgColor = const Color.fromRGBO(237, 236, 244, 1);
  static Color emojiButtonBorderColor = const Color.fromRGBO(222, 213, 241, 1);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff000000),
    primaryColorLight: const Color(0xffffcccc),
    primaryColorDark: const Color(0xff990000),
    canvasColor: const Color(0xfffafafa),
    scaffoldBackgroundColor: const Color(0xfffafafa),
    bottomAppBarColor: const Color(0xffffffff),
    cardColor: const Color(0xffffffff),
    dividerColor: const Color(0x1f000000),
    highlightColor: const Color(0x66bcbcbc),
    splashColor: const Color(0x66c8c8c8),
    selectedRowColor: const Color(0xfff5f5f5),
    unselectedWidgetColor: const Color(0x8a000000),
    disabledColor: const Color(0x61000000),
    toggleableActiveColor: const Color(0xffcc0000),
    secondaryHeaderColor: const Color(0xffffe5e5),
    backgroundColor: const Color(0xffff9999),
    dialogBackgroundColor: const Color(0xffffffff),
    indicatorColor: const Color( 0xffff0000 ),
    hintColor: const Color( 0x8a000000 ),

  );

  static ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.workSansTextTheme(),
    backgroundColor: const Color.fromRGBO(237, 236, 244, 1),
    brightness: Brightness.light,
    primaryColor: const Color(0xffffffff),
    primaryColorLight: const Color(0xffe6e6e6),
    primaryColorDark: const Color(0xff4d4d4d),
    canvasColor: const Color(0xfffafafa),
    scaffoldBackgroundColor: const Color(0xfffafafa),
    bottomAppBarColor: const Color(0xffffffff),
    cardColor: const Color(0xffffffff),
    dividerColor: const Color(0x1f000000),
    highlightColor: const Color(0x66bcbcbc),
    splashColor: const Color(0x66c8c8c8),
    selectedRowColor: const Color(0xfff5f5f5),
    unselectedWidgetColor: const Color(0x8a000000),
    disabledColor: const Color(0x61000000),
    toggleableActiveColor: const Color(0xff666666),
    secondaryHeaderColor: const Color(0xfff2f2f2),
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color.fromRGBO(237, 236, 244, 1)),
    dialogBackgroundColor: const Color(0xffffffff),
  );
}
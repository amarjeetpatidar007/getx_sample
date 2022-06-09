import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_project/posts/views/home_page.dart';
import 'package:getx_project/routes.dart';
import 'package:getx_project/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Sample Getx",
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        getPages: Routes.routes,
        home: HomePage());
  }
}

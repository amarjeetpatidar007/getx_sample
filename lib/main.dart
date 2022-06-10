import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_project/Auth/controller/auth_controller.dart';
import 'package:getx_project/Auth/view/register_page.dart';
import 'package:getx_project/languages.dart';
import 'package:getx_project/posts/views/page2.dart';
import 'package:getx_project/routes.dart';
import 'package:getx_project/theme.dart';

import 'Auth/view/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return GetMaterialApp(
        translations: Languages(),
        locale: Get.deviceLocale,
        title: "Sample Getx",
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        getPages: Routes.routes,
        home: const Page2());
  }
}

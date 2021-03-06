import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_project/languages.dart';
import 'package:getx_project/routes.dart';
import 'package:getx_project/theme.dart';
import 'alert_dialog/views/dialog_main_view.dart';
import 'chat/bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return GetMaterialApp(
        translations: Languages(),
        locale: Get.deviceLocale,
        initialBinding: AppBinding(),
        title: "Sample Getx",
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        getPages: Routes.routes,
        home: const AlertDialogPage());
    //
    // home: OrientationBuilder(builder: (context, orientation) {
    //   if (orientation == Orientation.portrait) {
    //     return const ChatScreen();
    //   } else {
    //     return const ChatViewLandscapeOrientation();
    //   }
    // }));
    // );
  }
}

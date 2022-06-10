import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_project/Auth/controller/auth_controller.dart';
import 'package:getx_project/posts/controller/controller.dart';

Widget custDrawer(BuildContext context) {
  Controller controller = Get.put(Controller());
  return Drawer(
    child: ListView(
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('User Name'),
          accountEmail: Text(""),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.yellow,
            child: Text(
              "A",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.dark_mode),
            title: const Text("Change Theme"),
            onTap: () {
              controller.updateTheme();
            },
          ),
        ),
        Card(
          child: GetBuilder<AuthController>(
            builder: (authController) => ListTile(
              leading: const Icon(Icons.exit_to_app_rounded),
              title: const Text("Logout "),
              onTap: () {
                authController.signOut();
              },
            ),
          ),
        ),
      ],
    ),
  );
}

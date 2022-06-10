import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_project/Auth/controller/auth_controller.dart';

import '../../routes.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Enter User Name",
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                )),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Enter Password ",
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.loginWithEmailAndPassword(
                      emailController.text, passwordController.text);
                },
                child: Text('Login')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Doesn't have an Account? "),
                TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.getSignUpPage());
                    },
                    child: const Text(
                      'Sign Up ',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.signInWithGoogle();
                },
                child: const Text('Login With Google '))
          ],
        ),
      ),
    );
  }
}
